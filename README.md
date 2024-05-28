# Indentation Level POC

![Domain Model](erd.png?raw=true "Domain Model")

```
rails generate scaffold run title:string description:string
rails generate scaffold run_unit title:string description:string indentation_level:integer run:belongs_to
```
