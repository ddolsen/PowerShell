@{
    AllNodes = @(
        @{
            NodeName = "Node1"
            Role     = "WebServer"
        },
        @{
            NodeName = "Node2"
            Role     = "SQLServer"
        },
        @{
            NodeName = "Node3"
            Role     = "WebServer"
        }
    )
}
# Save ConfigurationData in a file with .psd1 file extension
