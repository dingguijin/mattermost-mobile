#!/bin/sh

export SENTRY_PROPERTIES=sentry.properties

if [[ "${SENTRY_ENABLED}" = "true" ]]; then
	echo "Uploading debugging symbols to Sentry"

	./makeSentryProperties.sh

	export SENTRY_PROPERTIES=sentry.properties
	../node_modules/sentry-cli-binary/bin/sentry-cli upload-dsym
else
	echo "Not uploading debugging symbols to Sentry because Sentry is disabled"
fi
