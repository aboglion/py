# py
Python Virtual Environment Management Script


designed to simplify the management of Python virtual environments and related tasks. The script allows users to perform various actions such as creating and initializing a virtual environment, installing dependencies, generating a list of dependencies, running Python scripts within the environment, cleaning the environment, and deactivating it. It also provides helpful instructions and usage information.



# linux :
		shell => py.sh
				make the script executable using chmod +x my_script.sh.
				You can then run it with ./my_script.sh 

		make file = make -f py

# windows : 
		in cmd run py

it will show the help :

Commands and Explanations
-------------------------
		
		command            explanation
		---------      ---------------------------
		 init    --> Initialize the virtual environment and install dependencies.
		 active  --> Instructions for manually activating the virtual environment.
		 install --> Install dependencies from requirements.txt.
		 req     --> Generate a list of dependencies into requirements.txt.
		 run-xxx --> Run the code (replace xxx with the name of your Python script without .py).
		 clean   --> Clean the virtual environment.
		 out     --> Deactivate the virtual environment.
		 ---------      ---------------------------


 to run command = >
	  windows :
	  	py <command>  
	 linux : 
	 	./my_script.sh <command> 
	make file (linux) 
		make -f py <command>

