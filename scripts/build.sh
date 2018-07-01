# apt-get update

# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
# echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list 
# sudo apt update

# sudo apt -y install mono-devel
# sudo apt-get -y install unzip
# sudo apt-get -f install

mkdir $BUILD_SOURCESDIRECTORY/_dl
mkdir $BUILD_SOURCESDIRECTORY/_bin
mkdir $BUILD_SOURCESDIRECTORY/_publish

wget -O $BUILD_SOURCESDIRECTORY/_dl/docfx.zip "https://github.com/dotnet/docfx/releases/download/v2.37/docfx.zip"
unzip $BUILD_SOURCESDIRECTORY/_dl/docfx.zip -d $BUILD_SOURCESDIRECTORY/_bin/docfx

cd $BUILD_SOURCESDIRECTORY/_publish
mono $BUILD_SOURCESDIRECTORY/_bin/docfx/docfx.exe init

