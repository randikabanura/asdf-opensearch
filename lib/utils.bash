#!/usr/bin/env bash

set -euo pipefail

readonly github_repository_url="https://github.com/opensearch-project/OpenSearch"
readonly opensearch_download_url="https://artifacts.opensearch.org/releases/bundle/opensearch"
readonly tool_name="opensearch"

fail() {
  echo -e "asdf-${tool_name}: $*"
  exit 1
}

curl_opts=(-fsSL)

if [ -n "${GITHUB_API_TOKEN:-}" ]; then
  curl_opts=("${curl_opts[@]}" -H "Authorization: token ${GITHUB_API_TOKEN}")
fi

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
  git ls-remote --tags --refs "${github_repository_url}" |
    grep -o 'refs/tags/.*' | cut -d/ -f3- |
    sed 's/^v//'
}

list_all_versions() {
  list_github_tags
}

install_version() {
  local install_type="$1"
  local version="$2"
  local install_path="$3"

  if [ "${install_type}" != "version" ]; then
    fail "asdf-${tool_name} supports release installs only"
  fi

  local platform
  case "$OSTYPE" in
  darwin*)
    platform="linux"
    ;;
  linux*)
    platform="linux"
    ;;
  *)
    fail "Unsupported platform"
    ;;
  esac

  local architecture
  case "$(uname -m)" in
  x86_64)
    architecture="x64"
    ;;
  arm64)
    architecture="arm64"
    ;;
  *)
    fail "Unsupported architecture"
    ;;
  esac

  local download_filename="${install_path}/${tool_name}-${version}.tar.gz"
  (
    mkdir -p "${install_path}"

    echo "${tool_name} ${version} download beginning...."
    local url="${opensearch_download_url}/$version/opensearch-$version-linux-$architecture.tar.gz"
    curl -SLfo "${download_filename}" "${url}" || fail "Could not download ${url}"
    echo "${tool_name} ${version} downloaded successfully. installing...."

    tar -xzf "${download_filename}" -C "${install_path}" --strip-components=1 || fail "Could not extract ${download_filename}"
    echo "${tool_name} ${version} decompressing files."

    rm "${download_filename}"

    echo "${tool_name} ${version} installation tests are running...."
    chmod +x "${install_path}/bin/${tool_name}"
    test -x "${install_path}/bin/${tool_name}" || fail "Expected ${install_path}/${tool_name} to be executable."

    echo "${tool_name} ${version} installation was successful!"
  ) || (
    rm -rf "${install_path}"
    fail "An error occurred while installing ${tool_name} ${version}."
  )
}
