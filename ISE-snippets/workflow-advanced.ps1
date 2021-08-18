workflow Verb-Noun {
   <#
.Synopsis
   Short description
.DESCRIPTION
   Long description
.EXAMPLE
   Example of how to use this workflow
.EXAMPLE
   Another example of how to use this workflow
.INPUTS
   Inputs to this workflow (if any)
.OUTPUTS
   Output from this workflow (if any)
.NOTES
   General notes
.FUNCTIONALITY
   The functionality that best describes this workflow
#>

   [CmdletBinding(DefaultParameterSetName = 'Parameter Set 1',
      HelpUri = 'http://www.microsoft.com/',
      ConfirmImpact = 'Medium')]
   [Alias()]
   [OutputType([String])]
   Param
   (
      # Param1 help description
      [Parameter(Mandatory = $true,
         Position = 0,
         ParameterSetName = 'Parameter Set 1')]
      [ValidateNotNull()]
      [Alias("p1")]
      $Param1,

      # Param2 help description
      [int]
      $Param2
   )

   # Saves (persists) the current workflow state and output
   # Checkpoint-Workflow

   # Suspends the workflow
   # Suspend-Workflow

   # Workflow common parameters are available as variables such as:
   $PSPersist
   $PSComputerName
   $PSCredential
   $PSUseSsl
   $PSAuthentication

   # Workflow runtime information can be accessed by using the following variables:
   $Input
   $PSSenderInfo
   $PSWorkflowRoot
   $JobCommandName
   $ParentCommandName
   $JobId
   $ParentJobId
   $WorkflowInstanceId
   $JobInstanceId
   $ParentJobInstanceId
   $JobName
   $ParentJobName

   # Set the progress message ParentActivityId
   $PSParentActivityId

   # Preference variables that control runtime behavior
   $PSRunInProcessPreference
   $PSPersistPreference
}
