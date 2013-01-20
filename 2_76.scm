Changes needed in the system:
1. Explicit dispatch:
  - new type: we need to update all existing generic selectors
  - new operation: we add new operation for each of existing types and then add
    new generic selector for this operation
2. Data-directed:
  - new type: we add new type to the operation-and-type table; we don't have to
    change anything in exisiting codebase
  - new operation: we add new operation in each type package and install them in
    the operation-and-type table
3. Message-passing:
  - new type: we need to add new constructor for new type
  - new operation: we add new operation to each of existing constructors


System with new types often added:
We should use data-directed or message-passing style.

System with new operations often added:
Same as above.
