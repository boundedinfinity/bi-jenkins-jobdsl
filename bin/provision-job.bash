#!/usr/bin/env bash

function ee { echo $1 && eval $1; } # echo and eval

ee "java -jar $DSL_JAR $@"
