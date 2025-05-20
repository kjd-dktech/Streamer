Name:           Streamer
Version:        1.0
Release:        1%{?dist}
Summary:        Partage d'écran local avec OBS et VLC
License:        MIT
BuildArch:      noarch
Source0:        streamer.sh
Source1:        streamer.desktop
Source2:        License.txt

Requires:       obs-studio
Requires:       vlc
Requires:       net-tools
BuildRequires:  coreutils

%description
Streamer permet de diffuser l'écran de votre PC vers une TV ou un navigateur local via HTTP, comme un HDMI sans fil.

%prep
# Rien à préparer ici

%build
# Rien à construire ici

%install
# Création des dossiers nécessaires
mkdir -p %{buildroot}/usr/bin
mkdir -p %{buildroot}/usr/share/applications
mkdir -p %{buildroot}/usr/share/licenses/%{name}

# Fichiers principaux
install -m 755 %{SOURCE0} %{buildroot}/usr/bin/streamer.sh
install -m 644 %{SOURCE1} %{buildroot}/usr/share/applications/streamer.desktop

# Licence
install -m 644 %{SOURCE2} %{buildroot}/usr/share/licenses/%{name}/License.txt

%files
%{_bindir}/streamer.sh
%{_datadir}/applications/streamer.desktop
%license %{_datadir}/licenses/%{name}/License.txt

%changelog
* Mon May 20 2025 Kodjo Jean DEGBEVI <kodjojeandegbevi@gmail.com> - 1.0-1
- Première version avec licence et README

