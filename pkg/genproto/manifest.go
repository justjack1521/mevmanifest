package mevmanifest

func (x *Manifest) IsVersion(version string) bool {
	return x.Version == version
}

func (x *Manifest) ContainsVersion(version string) bool {
	for _, bundle := range x.Bundles {
		if bundle.Version == version {
			return true
		}
	}
	return false
}

func (x *Manifest) BundleForVersion(version string) *Bundle {
	for _, b := range x.Bundles {
		if b.Version == version {
			return b
		}
	}
	return nil
}
