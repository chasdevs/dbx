{
    "test": {
        "dbfs": {
            "package": "dist/{project_name}-0.1.0-py3-none-any.whl",
            "entrypoint": "pipelines/pipeline1/pipeline_runner.py"
        },
        "jobs": [
            {
                "name": "{project_name}-pipeline1",
                "new_cluster": {
                    "spark_version": "7.0.x-scala2.12",
                    "node_type_id": "Standard_F4s",
                    "num_workers": 1
                },
                "libraries": [
                    {"whl": $["test"]["dbfs"]["package"]}
                ],
                "spark_python_task": {
                    "python_file": $["test"]["dbfs"]["entrypoint"]
              }
            }
        ]
    }
}