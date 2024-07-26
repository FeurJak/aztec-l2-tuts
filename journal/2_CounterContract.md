# 2. Counter Contract

> See [Contract][#code1]

## 2.a. Std Noir Project Tree

```plaintext
|-[project]
| |-contracts
| | |--[contract]
| | |  |--src
| | |  |  |--main.nr
| | |  |--Nargo.toml
```

### 2.b. Std Dependencies

```toml
[dependencies]
aztec = { git="https://github.com/AztecProtocol/aztec-packages/", tag="aztec-packages-v0.47.0", directory="noir-projects/aztec-nr/aztec" }
value_note = { git="https://github.com/AztecProtocol/aztec-packages/", tag="aztec-packages-v0.47.0", directory="noir-projects/aztec-nr/value-note"}
easy_private_state = { git="https://github.com/AztecProtocol/aztec-packages/", tag="aztec-packages-v0.47.0", directory="noir-projects/aztec-nr/easy-private-state"}
```

### 2.c. Compile

Run command below in contracts/{contract} directory (i.e. code/contracts/counter)

```bash
aztec-nargo compile
```

[#code1]:../code/contracts/counter/src/main.nr
