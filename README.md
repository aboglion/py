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
		
		**init**: Initialize the virtual environment and install dependencies.
		
		**active**: Manually activate the virtual environment. Use the command `source venv/bin/activate`.
		
		**install**: Install dependencies from the `requirements.txt` file.
		
		**req**: Generate a list of installed dependencies into the `requirements.txt` file.
		
		**run-xxx**: Run a Python script (replace `xxx` with the name of your Python script without the `.py` extension).
		
		**clean**: Clean the virtual environment by removing the `venv` directory.
		
		**out**: Deactivate the virtual environment. Use the command `deactivate` (for Unix-based systems).


 to run command = >
	  windows :
	  	py <command>  
	 linux : 
	 	 ./my_script.sh <command> 
	 	 or 
	   		make -f py <command>

