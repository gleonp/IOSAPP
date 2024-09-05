#!/bin/bash
#
# Common functions to fetch languages.
#

LANG_PATH='../src/assets/lang'
SUFFIX='' # Determines suffix of the langpacks to be merged. Ie, using wp will include en.json and en_wp.json
          # (and the later will override the earlier).

# Get the version of the Moodle App to fetch latest languages.
function get_app_version {
    if [ ! -z "${LANGVERSION}" ]; then
        return
    fi

    # Obtén la versión de la aplicación directamente desde moodle.config.json sin jq
    APP_VERSION=$(grep -oP '"versionname": "\K[^"]+' ../moodle.config.json)

    if [ -n "$APP_VERSION" ]; then
        export LANGVERSION=$APP_VERSION
        echo "Using app version $LANGVERSION"
        return
    else
        echo "Failed to determine the app version."
        exit 1
    fi
}

