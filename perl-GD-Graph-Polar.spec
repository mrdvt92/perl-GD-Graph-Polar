Name:           perl-GD-Graph-Polar
Version:        0.21
Release:        1%{?dist}
Summary:        Make polar graph using GD package
License:        perl
Group:          Development/Libraries
URL:            http://search.cpan.org/dist/GD-Graph-Polar/
Source0:        http://www.cpan.org/modules/by-module/GD/GD-Graph-Polar-%{version}.tar.gz
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildArch:      noarch
BuildRequires:  perl(ExtUtils::MakeMaker)
BuildRequires:  perl(Test::Simple) >= 0.44
BuildRequires:  perl(Graphics::ColorNames)
BuildRequires:  perl(GD)
BuildRequires:  perl(Geo::Constants) >= 0.04
BuildRequires:  perl(Geo::Functions) >= 0.03
BuildRequires:  perl(Package::New)
BuildRequires:  perl(Cwd)
Requires:       perl(GD)
Requires:       perl(Geo::Constants) >= 0.04
Requires:       perl(Geo::Functions) >= 0.03
Requires:       perl(Package::New)
Requires:       perl(Cwd)
Requires:       perl(Graphics::ColorNames)
Requires:       perl(:MODULE_COMPAT_%(eval "`%{__perl} -V:version`"; echo $version))

%description
This package is a wrapper arround GD to produce polar graphs with an easy
interface. I use this package to display GPS satellites on a graph with
data from the Net::GPSD3 package.

%prep
%setup -q -n GD-Graph-Polar-%{version}

%build
%{__perl} Makefile.PL INSTALLDIRS=vendor
make %{?_smp_mflags}

%install
rm -rf $RPM_BUILD_ROOT

make pure_install PERL_INSTALL_ROOT=$RPM_BUILD_ROOT

find $RPM_BUILD_ROOT -type f -name .packlist -exec rm -f {} \;
find $RPM_BUILD_ROOT -depth -type d -exec rmdir {} 2>/dev/null \;

%{_fixperms} $RPM_BUILD_ROOT/*

%check
make test

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%doc Changes LICENSE README.md
%{perl_vendorlib}/*
%{_mandir}/man3/*

%changelog
* Tue Sep 20 2022 Michael R. Davis (mrdvt92@yahoo.com) 0.18-1
- Upstream update
* Mon Mar 28 2011 Michael R. Davis (mrdvt92@yahoo.com) 0.16-1
- Specfile autogenerated by cpanspec 1.78.
