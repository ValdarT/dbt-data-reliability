{{
  config(
    materialized = 'view',
    bind=False
  )
}}

with dbt_run_results as (
    select * from {{ ref('dbt_run_results') }}
),

dbt_models as (
    select * from {{ ref('dbt_models') }}
)

SELECT
    run_results.model_execution_id,
    run_results.unique_id,
    run_results.invocation_id,
    run_results.name,
    run_results.generated_at,
    run_results.status,
    run_results.full_refresh,
    run_results.message,
    run_results.execution_time,
    run_results.execute_started_at,
    run_results.execute_completed_at,
    run_results.compile_started_at,
    run_results.compile_completed_at,
    run_results.compiled_code,
    models.database_name,
    models.schema_name,
    models.materialization,
    models.tags,
    models.package_name,
    models.path,
    models.original_path,
    models.owner,
    models.alias
FROM dbt_run_results run_results
JOIN dbt_models models ON run_results.unique_id = models.unique_id
