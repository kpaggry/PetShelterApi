# PetShelterAPI

## Dependencies
1. Dotnet Core. To install dotnet core if you dont have it already visit [.net core](https://www.microsoft.com/net/core)
2. MSSQL Express or Full Above 2008R2

## Setting up on Local Machine

1. Run `pets.sql` on a MSSQL Server. This has been scripted as low as 2008R2 so that or any above that version will work.
2. Open the project in Visual Studio.
3. Build Solution, This will restore all dependencies.
4. Change the Database login details in the `PetShelterApi/appsettings.json` file
	`"petContext": "{your_server_name},1433;Initial Catalog={database_name};Persist Security Info=False;User ID={sql_id};Password={password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"`
5. Run Application
	
## EndPoints
	
	`{server}/api/pet/getpetsperpage/:id returns array of objects by page number`
	`{server}/api/pet/getpet/:id returns id of object`
	`{server}/api/pet/getPetTypes returns array of PetType objects`
	`{server}/api/pet/createpet return Success | Exists message, Takes a Pet Object`

## Running unit tests

1. On the menu bar in VS, click `Test->Windows->Test` Explorer to open the window.
2. Build the App, you should now see the tests in the test Explorer window.
3. Click `run all` in the Test Explorer Window
