import datetime
import os
import re
import shutil
from dotenv import load_dotenv
from webdriver_manager.chrome import ChromeDriverManager
from robot.api.deco import keyword,library
from robot.libraries.BuiltIn import BuiltIn
import pyperclip
import getpass


@library
class test_utils:
    
    # @keyword
    def get_browser_logs(self):
        sel_lib = BuiltIn().get_library_instance('SeleniumLibrary')
        with open("console_logs.txt", "a") as console_logs:
            console_logs.write(str(sel_lib.driver.get_log("browser")))
        # pass
    
    @keyword
    def is_gitlab_user(self):
        runner_name = getpass.getuser()
        gitlab_runners = ['root', 'gitlab-runner', 'vm','azure']
        if any((match := substring) in runner_name for substring in gitlab_runners):
            return True
        else:
            return False
   
    @keyword
    def load_env(self):
        env = os.environ.get('ENV', "stage")
        os.environ['ENV']=env
        print("selected env is:"+env)
        env_file = ""
        if env == 'stage':
            env_file = 'stage.env'
        elif env == 'prod':
            env_file = 'prod.env'
        load_dotenv(dotenv_path=os.getcwd() + '/env_files/' + env_file)
        
    @keyword   
    def is_production_environment(self):
        if os.environ.get('ENV')=="prod":
            return True
        else:
            False
        
        
    @keyword
    def get_current_timestamp(self):
        text = str(datetime.datetime.now())
        text = text.replace("-", "").replace(" ", "")
        text = text[0:16]
        text = text.replace(":", "").replace(" ", "")
        return text
    
    @keyword
    def clean_screenshots_directory(self):
        root_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        screenshots_dir = root_dir +os.sep+ "screenshots"
        try:
            shutil.rmtree(screenshots_dir,True)
        except Exception as error:
            print(error)
            
    @keyword
    def remove_all_spaces_from_text(self,text):
        text = re.sub(r"\s+", "", text, flags=re.UNICODE)
        text =text.replace('"', '')
        return text
    
    @keyword
    def get_random_build_card_name(self):
        prefix = "test99AutoRobotStudioUI"
        return prefix + self.get_current_timestamp()
    
    @keyword
    def get_chrome_driver_path(self):
        driver_path = ChromeDriverManager().install()
        print("****chrome driver_path=", driver_path)
        return driver_path

    @keyword
    def extract_number_from_text(self,text):
        number = re.sub(r"\D", "",text)      
        return number
    
    @keyword
    def extract_amount_from_text(self,text):
        amount = re.sub(r"[^0-9.]", "",text)
        if amount=="":
            return 0
        else:
            amount = float(amount)
            return amount
    
    @keyword
    def remove_all_non_numeric_elements_from_text(self,text):
        amount = re.sub(r"\D", "",text)
        amount = amount[:-2]
        if amount=="":
            return 0
        else:
            amount = int(amount)
            return amount
    
    @keyword
    def extract_alphabets_from_text(self,text):
        alphabets = re.sub(r"[^a-zA-Z]", "",text)
        return alphabets    
    
    @keyword
    def get_text_from_clipboard(self):
        return pyperclip .paste()
    

    @keyword
    def extract_cost_from_multilines(self, text):
        list_of_text= text.split("\n")
        return list_of_text
    
    
    @keyword
    def convert_weeks_to_months(self,text):
        text = int(text)
        text = text/4
        return round(text+0.5)