#!/bin/bash
PROJECT_PATH=$(pwd)

echo 'Setting PROJECT_PATH'
export PROJECT_PATH=$PROJECT_PATH

#
#	Set EXISTING ENV
#
echo 'Setting PATH'
export PATH=$PATH:$PROJECT_PATH

echo 'Setting PYTHONPATHPATH'
export PYTHONPATH=$PATH


#
#	Set BUILD ENV
#
echo 'Setting BUILD_DIR'
export BUILD_DIR=build_project

echo 'Setting BUILD_PATH'
export BUILD_PATH=$PROJECT_PATH/../$BUILD_DIR

echo 'Setting BUILD_TARGET'
export BUILD_TARGET=calculator

#
#	Set CODE ENV
#
echo 'Setting CODE_PATH'
export CODE_PATH=$PROJECT_PATH/calculator

#
#	Set TEST ENV
#
echo 'Setting TESTS_DIR'
export TESTS_DIR=tests

echo 'Setting TESTS_PATH'
export TESTS_PATH=$PROJECT_PATH/tests

#
#	Set SCRIPT ENV
#
echo 'Setting SCRIPT_DIR'
export SCRIPT_DIR=scripts

echo 'Setting SCRIPT_PATH'
export SCRIPT_PATH=$PROJECT_PATH/scripts

#
#	Set SVN ENV
#
echo 'Setting SVN_IP'
export SVN_IP=10.66.145.55

echo 'Setting SVN_PATH'
export SVN_PATH=svn://$SVN_IP/D:/Repositories/NSI_Repository

echo 'Setting SVN_PATH_TRUNK'
export SVN_PATH_TRUNK=svn://$SVN_IP/D:/Repositories/NSI_Repository/trunk

#
#	Set TEST ENV
#
echo 'Setting TEST_FRAMEWORK_ERROR'
export TEST_FRAMEWORK_ERROR=ERROR



#
#
# Set alias-ES
#
#

#Project alias
alias calculator=$BUILD_PATH/$BUILD_TARGET

#Script alias
alias calculator_build=$SCRIPT_PATH/build.sh
alias calculator_test=$SCRIPT_PATH/test.sh
alias environment_vars=$SCRIPT_PATH/echo_variables.sh
alias all_commands=$SCRIPT_PATH/all_commands.sh
alias calculator_server_build_test=$SCRIPT_PATH/download_build_test_branch.sh


#Calculator remove control
alias calculator_man_test='nc 127.0.0.1 10023'
