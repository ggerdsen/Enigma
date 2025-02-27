# Garrett Gerdsen
# 2005 BE
# Enigma

#### Enigma

##### This project consists of two Classes and one Module.  The two Classes are `Enigma` and `CryptoTools`.  When either the `Encrypt` or `Decrypt` runner files are run, they call the associated method in the `Enigma` Class.  `Enigma` only has two methods: `encrypt` and `decrypt`.  The `Enigma` Class is a child to Parent Class `CryptoTools`.  The responsibility for the `Enigma` Class is to route data to the appropriate endpoint, as well allow us to create an instance of the `Enigma` Class for testing and runner file utilization.

##### In `CryptoTools`, you will find most of the helper methods used to feed the `cipher` method within the `Cipherable` module.  Data from the `Enigma` Class is passed to the `analyze` method in `CryptoTools`, where a few tasks are completed prior to sending this data via a `Hash` to the `cipher` method within the `Cipherable` module.

##### The `cipher` method within the `Cipherable` module can either `encrypt` or `decrypt` messages.  The method know what the type of action should take place by looking at the arguement passed to it in the form of `cipher_data[:task]` - this can hold the value of either `encrypt` or `decrypt`.

##### I chose CryptoTools to be my Parent Class, as it does most of the heavy lifting, and both the `Cipherable` Module and `Enigma` Class utilize this class, it also makes it easier to run methods in these areas while working with `Enigma` instances.  Also, `Cipherable` seemed like a good use case for a Module as it does repeated calculations, and has more than one purpose.

##### Below are example CLI usages for Enigma: 

`ruby ./lib/encrypt.rb message.txt encrypted.txt`

`ruby ./lib/decrypt.rb encrypted.txt decrypted.txt <your key here> <date here DDMMYY>`

#### Testing

#####  TDD was used throughout the first iteration of this project.  After refactoring the Enigma Class, these tests were refactored where necessary, and additional test files were created for `Cipherable` and `CryptoTools`.  In the `Cipherable_test`, I had to test the method in `cipher` using an instance of `CryptoTools`, as I could not instanciate an instance of a Module.  I attempted to use mocks and stubs in two tests, but also used traditional testing in sister test methods as a backup.

####  Self-Assessment

##### I followed the rubric and aimed for Above Expectations where possible.  I did not complete the `Crack` functionality, but instead decided to focus on tests and refactoring this final day of the project.  I was able to start early and take my time, and I believe this was a great effort given the timeline.
