#!/bin/bash


if [[ $user ==  'jenkins' ]]
then
    cd /var/lib/jenkins/jobs/Kalman/workspace
    for i in $(find ./build/test/test-* -type f -executable)
    do
      $i "--log_format=XML --log_level=all --report_level=no --result_code=no --log_sink=$i.xml"
    done
else
    for i in $(find ./build/test/test-* -type f -executable)
    do
      $i
    done
fi
