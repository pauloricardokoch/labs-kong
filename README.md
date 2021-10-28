# Kongs lab
Environment to learn Kong Gateway

#### API spec example to use with Insomnia
[spec](docs/spec.yaml)

## Setup
If you want to try inso, you'll have to have Insomnia installed on your computer and set the correct value to **INSOMNIA_DIR** on the Makefile 
    
- Builds, (re)creates, starts, and attaches to containers for the services.
    ```
    make setup
    ```

- Set up konga

    ![Step one](docs/assets/konga.png)

    ![Step two](docs/assets/konga1.png)

    ![Step three](docs/assets/konga2.png)

## Usage
- Create kong.yaml
  - generate kong config file
    ```
    make inso-generate-config
    ```
  - import config into kong's container
    ```
    docker-compose run --rm inso generate config spc_9e0238 > kong/data/kong.yaml 
    ```

- Sync data into kong
    ```
    docker-compose exec kong bash
    ```
    ```
    cd app
    deck sync
    ```

- Check if json-server is responding
  ```
  http --body localhost:8080/books
  ```
  Should output
  ```
  [
      {
          "author": "Agatha Christie",
          "id": 1,
          "title": "The Mysterious Murder At Styles"
      }
  ]
  ```

- Call json-server via proxy
  ```
  http --verbose --proxy http:http:localhost:8000 jsonserver:8080/books/1 kong-debug:1
  ```
  Or 
  ```
  http --verbose localhost:8000/books/1 kong-debug:1
  ```
  Notice that the response has Kong's headers


  **kong-debug:1** header adds the following info
  ```
  Kong-Route-Id: 4b3a08e5-505a-45d1-8f03-2814dc64f7e8
  Kong-Route-Name: Bookstore_Api-books-id-get
  Kong-Service-Id: 16929ea2-77d9-47c8-b134-618abcfa06d5
  Kong-Service-Name: Bookstore_Api
  ```

  Change the route's host 
  ```
  http PATCH http://localhost:8001/routes/e11238c7-9143-484d-8a61-22b1368df899 hosts:='["jsonserver.localhost"]'
  ```

  Now it should work only if called as follow
  ```
  http --verbose jsonserver.localhost:8000/books/1 kong-debug:1
  ```
