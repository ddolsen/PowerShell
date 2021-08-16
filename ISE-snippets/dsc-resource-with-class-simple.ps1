# Defines the values for the resource's Ensure property.
enum Ensure {
    # The resource must be absent.
    Absent
    # The resource must be present.
    Present
}

# [DscResource()] indicates the class is a DSC resource.
[DscResource()]
class NameOfResource {

    # A DSC resource must define at least one key property.
    [DscProperty(Key)]
    [string]$P1

    # Mandatory indicates the property is required and DSC will guarantee it is set.
    [DscProperty(Mandatory)]
    [Ensure] $P2

    # NotConfigurable properties return additional information about the state of the resource.
    # For example, a Get() method might return the date a resource was last modified.
    # NOTE: These properties are only used by the Get() method and cannot be set in configuration.
    [DscProperty(NotConfigurable)]
    [Nullable[datetime]] $P3

    [DscProperty()]
    [ValidateSet("val1", "val2")]
    [string] $P4

    # Sets the desired state of the resource.
    [void] Set() {
    }

    # Tests if the resource is in the desired state.
    [bool] Test() {
        return $true
    }
    # Gets the resource's current state.
    [NameOfResource] Get() {
        # NotConfigurable properties are set in the Get method.
        $this.P3 = something
        # Return this instance or construct a new instance.
        return $this
    }
}
