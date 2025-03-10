{# We create tables and some databases limit the length of table names #}
{% macro get_relation_max_name_length() %}
    {{ return(adapter.dispatch('get_relation_max_name_length', 'elementary')()) }}
{% endmacro %}

{# Snowflake and BigQuery #}
{% macro default__get_relation_max_name_length(temporary, relation, sql_query) %}
    {{ return(none) }}
{% endmacro %}

{% macro redshift__get_relation_max_name_length(temporary, relation, sql_query) %}
    {{ return(127) }}
{% endmacro %}

{% macro postgres__get_relation_max_name_length(temporary, relation, sql_query) %}
    {{ return(63) }}
{% endmacro %}

{% macro databricks__get_relation_max_name_length(temporary, relation, sql_query) %}
    {{ return(127) }}
{% endmacro %}

{% macro spark__get_relation_max_name_length(temporary, relation, sql_query) %}
    {{ return(127) }}
{% endmacro %}
