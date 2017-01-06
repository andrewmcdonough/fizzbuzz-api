#!/bin/sh -e

tar -cvzf archive/build-$(date +%Y%m%d%H%M%S).tar.gz fizzbuzz/*
