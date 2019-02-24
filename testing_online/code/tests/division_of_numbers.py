from test_framework.main import *

class DivisionOfNumbers(Test):

    def test_body(self):
        self.press_button('5')
        self.press_button('6')
        self.press_button('/')
        self.press_button('8')
        self.press_button('=')
        return  self.check_disp("7")

test = DivisionOfNumbers()
test.test_method()