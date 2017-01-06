#!/bin/sh -e

version=$(cat version/version)
tar -cvzf archive/build-$version.tar.gz fizzbuzz/*
