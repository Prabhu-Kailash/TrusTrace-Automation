# Guidelines for Test (Robot) Execution
## Prerequisites to run the Test Suites :-

Make sure below important packages are installed for the Test Execution.

* RobotFrameWork module/package `pip install robotframework`
* SeleniumLib module/package `pip install robotframework-seleniumlibrary`
* Parallel Execution module/package `pip install robotframework-jsonlibrary`
* Parallel Execution module/package `pip install robotframework-requests`

**To install all dependecies together** :- Run `pip3 install -r requirements.txt` (Python 3)

**Note** :- Python **3.7** higher versions required.

### Test Execution Customization 

1. Sauce Demo Suite is configured to run in Chrome (Browser). It can be changed by altering below line in Sauce_Demo.robot file.

    `Suite Setup    Open Browser    ${UI_URL}    browser=edge`

2. How to run a specific test suite? Below command should help you run specific test suite.

    `robot -d results Test_Suites/Sauce_Demo.robot`

    Tag `-d results` on above command make sure output files (log.html, report.html, output.xml) are being generated under folder named results.
3. Running Test cases specific to the tags using below command,

    `robot -d results -i Smoke Test_Suites/Sauce_Demo.robot`

    By adding `-i TagName` it invokes specific test cases rather than running whole test suite.
4. Sample UI Automation and API Automation results are placed under results folder for reference.

**Note** :- Relative Chromedriver/edgedriver/geckodriver binary (Depending on the choice of your Browser) needs to be downloaded on your machine and should be placed at root folder of this repo.