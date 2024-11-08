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
