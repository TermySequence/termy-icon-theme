#!/bin/bash

commit=${1:-HEAD}
package=$(awk '/^PackageName:/ {print $2}' LICENSE.spdx)
version=$(awk '/^PackageVersion:/ {print $2}' LICENSE.spdx)
name="${package}-${version}"
tarfile=/tmp/${name}.tar
tmpdir=/tmp/${name}

rm -rf ${tmpdir}
mkdir -p ${tmpdir} || exit 2

git archive --prefix=${name}/ -o ${tarfile} ${commit} || exit 3

for theme in default; do
    icondir=${tmpdir}/icons/${theme}
    mkdir -p ${icondir} || exit 2
    svgdir=${tmpdir}/svg/${theme}
    mkdir -p ${svgdir} || exit 2
    (cd icons/${theme} && source dist.sh ${icondir} ${svgdir}) || exit 4
done

tar -uf ${tarfile} -C /tmp ${name} || exit 5

xz <${tarfile} >${name}.tar.xz || exit 6

rm ${tarfile}
rm -r ${tmpdir}

echo Success
