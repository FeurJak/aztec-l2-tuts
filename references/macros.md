# List of Macros

```plaintext
#[aztec(public)] or #[aztec(private)] - Whether the function is to be executed from a public or private context (see Further Reading)
#[aztec(initializer)] - If one or more functions are marked as an initializer, then one of them must be called before any non-initilizer functions
#[aztec(noinitcheck)] - The function is able to be called before an initializer (if one exists)
#[aztec(view)] - Makes calls to the function static (see also Static calls)
#[aztec(internal)] - Function can only be called from within the contract
#[aztec(note)] - Creates a custom note
```
