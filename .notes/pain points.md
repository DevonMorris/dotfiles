# Pain Points

## Reading Code

### Navigating Call Graph

* <C-o> kinda sucks bc the jumplist gets polluted by other operations
* <C-^> only takes you to previous file
* Also, I've _honestly_ forgotten the hierarchy of calllist when I'm 5 or 6 levels deep, I'd like to see the global picture when I'm buried in a function
        * I want to see a list of functions and not files/lines
* I'd really like it to integrate seamlessly with <C-]> and lsp

#### Potential Solutions
* Just use <C-o> multiple times (gross)
* Use global marks (_really_ manual, also doesn't give good overview)

#### That good good solution
* Tag Stack!!! - Already integrated with nvim lsp
* TODO: want to integrate the tag stack with telescope.nvim
