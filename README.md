# unusualLanguages


## Installation and Running Instructions

### OCaml

#### Installation:
#### Linux
```
sudo apt-get update
sudo apt-get install ocaml
```

#### Running Files:
Compile your OCaml files using the `ocamlc` compiler. For example:
```bash
ocamlc -o output_file source_file.ml
```

Execute the compiled executable:

```bash
./output_file
```
or

```bash
ocaml output_file
```

### Erlang
#### Installation:

##### Linux
```
sudo apt-get update
sudo apt-get erlang-ic
```

#### Running Files:
Compile your Erlang files using the `erlc` compiler. For example:
```bash
erlc source_file.erl
```

Execute the compiled executable:

```bash
erl -noshell -s source_file start -s init stop
```
