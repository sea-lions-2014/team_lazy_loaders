#Code Review from Anne

##UI
* Can't add multiple choices?
* Can't respond to a survey?
* Signup should direct to signed in behavior

## Controller
* Don't need to enable sessions here (it's on the environment.rb file)
* Use RESTful routes.
* Move model logic to model 
* Use include in AR to avoid lazy loading and the N+1 problem. 

##Helpers
* Helpers can be accessed from view and controller - if you don't need access to a method on the view, don't put it in a helper - put it on an existing model or make a new Module or Class.
* No params in helpers (pass these from the controller)

##Models
* If you have a view stating passwords must be 6 or more characters - be sure to have a validation that does the same. 
* You need a responses table.

## Views
* No sessions in the view - use your helper methods.  Abstract how you are maintaining state.

## JavaScript
