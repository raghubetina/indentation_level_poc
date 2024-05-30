# Indentation Level POC

![Domain Model](erd.png?raw=true "Domain Model")

```
rails generate scaffold run title:string description:string
rails generate scaffold run_unit title:string description:string indentation_level:integer run:belongs_to
rails generate devise user
rails generate scaffold run_submission run:belongs_to user:belongs_to progress:float
rails generate scaffold run_unit_submission run_submission:belongs_to user:belongs_to run:belongs_to run_unit:belongs_to progress:float
```
