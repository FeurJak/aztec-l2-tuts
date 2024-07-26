contract Counter {
    /*
        [From Tutorial]:
        AztecAddress is a type for storing contract (including account) addresses.
        Map is a private state variable that functions like a dictionary, relating Fields to other state variables.
    */
    use dep::aztec::prelude::{AztecAddress, Map};

    /*
        [From Tutorial]:
        Notes are fundamental to how Aztec manages privacy.
        A note is a privacy-preserving representation of an amount of tokens associated with a nullifier key (that can be owned by an owner),
        while encrypting the amount. In this contract, we are using the value_note library.
        This is a type of note interface for storing a single Field, eg a balance - or, in our case, a counter.
        We are also using balance_utils from this import, a useful library that allows us to utilize value notes as if they are simple balances.
    */
    use dep::value_note::{balance_utils, value_note::{ValueNote, VALUE_NOTE_LEN}};
    /*
        [From Tutorial]:
        This allows us to store our counter in a way that acts as an integer, abstracting the note logic.
    */
    use dep::easy_private_state::EasyPrivateUint;

    #[aztec(storage)]
    // Declares storage variables for the contract
    struct Storage {
        counters: Map<AztecAddress, EasyPrivateUint>,
    }

    #[aztec(private)]
    #[aztec(initializer)]
    // We can name our initializer anything we want as long as it's marked as aztec(initializer)
    fn initialize(headstart: u64, owner: AztecAddress, outgoing_viewer: AztecAddress) {
        let counters = storage.counters;
        counters.at(owner).add(headstart, owner, outgoing_viewer);
    }

    #[aztec(private)]
    fn increment(owner: AztecAddress, outgoing_viewer: AztecAddress) {
        dep::aztec::oracle::debug_log::debug_log_format("Incrementing counter for owner {0}", [owner.to_field()]);
        let counters = storage.counters;
        counters.at(owner).add(1, owner, outgoing_viewer);
    }

    // unconstrained --> fetch data from storage without a transaction
    unconstrained fn get_counter(owner: AztecAddress) -> pub Field {
        let counters = storage.counters;
        balance_utils::get_balance(counters.at(owner).set)
    }
}
