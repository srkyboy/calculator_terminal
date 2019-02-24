import sys, os
import subprocess
import time
import socket

class Test:

    # TCP / IP Configuration
    TCP_IP = '127.0.0.1'
    TCP_PORT = 10023
    BUFFER_SIZE = 1024
    program_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    # Calculator Configuration
    process_calculator = 0
    build_path = os.environ['BUILD_PATH']
    build_target = os.environ['BUILD_TARGET']
    process_path = build_path + "/" + build_target
    python_path = os.environ['PROJECT_PATH']

    # Command Configuration
    command_press_something = "pritisni_dugme "
    command_get_display = "tekst_prozora"
    command_endchar = "\n"

    # TestFrameWork Configuration
    test_error_message = os.environ['TEST_FRAMEWORK_ERROR']

    #
    #   Function for starting & connecting to process
    #
    def start_calculator(self):
        self.process_calculator = subprocess.Popen(self.process_path)
        time.sleep(2)
        print("Calc Started")
    def connect_to_calculator(self):
        self.program_socket.connect((self.TCP_IP, self.TCP_PORT))
        time.sleep(2)
        print("Sock Connected to Calc")
    def kill_calc(self):
        pid = self.process_calculator.pid
        os.system('kill -9 %s' % pid)
    #
    #   Functions for communication with process
    #
    def press_button(self,button_label):
        command = self.command_press_something + button_label + self.command_endchar
        self.program_socket.send(command.encode('utf-8'))
        time.sleep(1)
    def get_display(self):
        command = self.command_get_display + self.command_endchar
        self.program_socket.send(command.encode('utf-8'))
        data = self.program_socket.recv(self.BUFFER_SIZE)
        return data.decode("utf-8")
    def check_disp(self,value):
        rez = self.get_display()
        for i in range(0, 3):
            if rez == value:
                return True
        return False

    #
    # Other Functions
    #
    def wait_for_word(self,word):
        var = input("Waiting for " + word + "\n")
        while var is not word:
            var = input("Press Enter\n")


    #
    #   Define test method
    #
    def test_body(self):
        pass
    def test_method(self):

        # Start Calculator and connect to it
        # Set the TCP/IP socket for sending and receiving commands
        self.start_calculator()
        self.connect_to_calculator()

        # TODO: TEST BODY
        test_value = self.test_body()

        if test_value is not True:
            print(self.test_error_message)

        # Wait for input, used fo testing
        # wait_for_word("a")

        # Kill Calculator Process
        self.kill_calc()