#!/bin/bash

function print_usage () {
    echo "Usage:"
    echo "  ${0} file_list extract_from extract_to"
    echo "    file_list - a list of files to extract"
    echo "    extract_from - one of:"
    echo "      adb - extract from adb"
    echo "      dir - a directory to extract from"
    echo "    extract_to - a directory to extract to (will be created)"
}

function extract_file () {
    from_file="$1"
    from_loc="$2"
    to_loc="$3"

    if [ ! -d "${to_loc}" ] ; then
        echo "${to_loc} directory does not exist"
        return
    fi

    if [ "${from_loc}" == "adb" ] ; then
        echo "Extracting ${from_file} from adb..."
        adb pull "${from_file}" "${to_loc}/"
    else
        if [ -d "${from_loc}" ] ; then
            echo "Copying ${from_file} from ${from_loc}"
            cp "${from_loc}/${from_file}" "${to_loc}/"
        else
            echo "${from_loc} is not a valid from location"
        fi
    fi
}

FILE_LIST=$1
EXTRACT_FROM=$2
EXTRACT_TO=$3

# check file list
if [ ! -e "${FILE_LIST}" ] ; then
    print_usage
    echo ""
    echo "You must specify a list file"
    exit 1
fi

# check our source
if [ ! -d "${EXTRACT_FROM}" -a "${EXTRACT_FROM}" != "adb" ] ; then
    print_usage
    echo ""
    echo "You must specify a valid place to extract from"
    exit 1
fi

if [ -z "${EXTRACT_TO}" ] ; then
    print_usage
    echo ""
    echo "You must specify and extraction location"
    exit 1
fi

# make our extraction directory
mkdir -p "${EXTRACT_TO}"

# extract!
for file in $(cat "${FILE_LIST}" | sed -r 's/ /_/g'); do
    extract_file "${file}" "${EXTRACT_FROM}" "${EXTRACT_TO}"
done
