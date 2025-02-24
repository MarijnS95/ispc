choco install --no-progress winflexbison3 wget 7zip cygwin cyg-get

# Install M4 exec and put it into PATH
cyg-get m4
echo "C:\tools\cygwin\bin" | Out-File -FilePath $env:GITHUB_PATH -Encoding utf8 -Append

# Download and unpack llvm
mkdir ${env:LLVM_HOME}
cd ${env:LLVM_HOME}
wget -q --retry-connrefused --waitretry=5 --read-timeout=20 --timeout=15 -t 5 https://github.com/ispc/llvm-project/releases/download/llvm-${env:LLVM_VERSION}-ispc-dev/${env:LLVM_TAR}
7z.exe x -t7z ${env:LLVM_TAR}
echo "${env:LLVM_HOME}\bin-${env:LLVM_VERSION}\bin" | Out-File -FilePath $env:GITHUB_PATH -Encoding utf8 -Append

# Download and unpack gnuwin32
mkdir ${env:CROSS_TOOLS_GNUWIN32}
cd ${env:CROSS_TOOLS_GNUWIN32}
wget -q --retry-connrefused --waitretry=5 --read-timeout=20 --timeout=15 -t 5 -O libgw32c-0.4-lib.zip https://sourceforge.net/projects/gnuwin32/files/libgw32c/0.4/libgw32c-0.4-lib.zip/download
7z.exe x libgw32c-0.4-lib.zip
