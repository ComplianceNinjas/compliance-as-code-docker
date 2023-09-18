# My Compliance Project

**ComplianceAsCode** is used to generate an XML, with the recommendations from many compliance guides, that is used by **OpenSCAP** to generate a report <small>(how many recommendation did we apply?)</small> and a patch <small>(automatically apply unapplied recommendations)</small>. 

This is a project that includes [Compliance as Code Loader](https://github.com/ComplianceNinjas/compliance-as-code-loader) and [Compliance as Code](https://github.com/ComplianceAsCode/content) as submodules.

## Getting Started

You will need to have Docker and Docker Compose installed on your system.
To get started with this project, follow these steps:

1. Clone the repository
2. You can initialize and update the submodules with the following commands:

```bash
git submodule init
git submodule update
```

3. You can navigate to the loader and content directories to work on them individually.
4. Navigate to the project's root directory in your terminal.
5. Run the following command to start the Docker container defined in the `docker-compose.yml` file:

```bash
docker compose up -d
docker attach $(docker compose ps -q)
```

6. Run the following command to stop the Docker container

```bash
docker compose down 
```

Once you are done working, run the following command to stop the Docker container:

```bash
docker compose down
```

## Working on the project

#### 1. Add your product files

The compliance as code project is in `content`. You're only supposed to edit the files in `loader` which are merged in `content`. See the [Loader README for usage instructions](loader/README.md#usage).

This reduces the complexity of updating `content`, as it changes often and merge are quite a hassle. Moreover, this reduces the complexity of manipulating CAC.

Reminder: ⚠️ **always revert your changes** ⚠️ in `content`; do not commit them.

#### 2. Generate the XML

On the docker, execute these only once:

```bash
cd content
source .pyenv.sh
```

Then, each time you merge your files in Compliance As Code

```bash
./utils/after_merge.sh
./build_product <your_product_name> -j $(nproc)
```

#### 3. Scan a target

Once you got your XML, refer to the OpenSCAP documentation to use it.