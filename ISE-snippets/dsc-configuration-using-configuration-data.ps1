configuration ConfigurationName
{
    # One can evaluate expressions to get the node list
    # E.g: $AllNodes.Where("Role -eq Web").NodeName
    node $AllNodes.Where{ $_.Role -eq "WebServer" }.NodeName
    {
        # Call Resource Provider
        # E.g: WindowsFeature, File
        WindowsFeature FriendlyName {
            Ensure = "Present"
            Name   = "Feature Name"
        }

        File FriendlyName {
            Ensure          = "Present"
            SourcePath      = $SourcePath
            DestinationPath = $DestinationPath
            Type            = "Directory"
            DependsOn       = "[WindowsFeature]FriendlyName"
        }
    }
}

# ConfigurationName -configurationData <path to ConfigurationData (.psd1) file>
