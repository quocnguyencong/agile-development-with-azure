from hello import toyou, add, subtract

def setup_function(function):
  print("Running Setup: %s" % function.__name__)
  function.x = 10
  
def teardown_function(function):
  print("Running teardown: " % function.__name__)
  def function.x
  
### Run to see failed test
#def test_hello_add():
# assert add(test_hello_add.x) == 10

def test_hello_subtract():
  assert subtract(test_hello_subtract.x) == 9
