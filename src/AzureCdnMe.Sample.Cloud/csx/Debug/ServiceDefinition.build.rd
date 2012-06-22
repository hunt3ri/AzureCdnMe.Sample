<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="AzureCdnMe.Sample.Cloud" generation="1" functional="0" release="0" Id="f901d0b6-f1b1-448f-9e75-e807c09b7d20" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="AzureCdnMe.Sample.CloudGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="AzureCdnMe.Sample.Web:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/AzureCdnMe.Sample.Cloud/AzureCdnMe.Sample.CloudGroup/LB:AzureCdnMe.Sample.Web:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="AzureCdnMe.Sample.Web:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/AzureCdnMe.Sample.Cloud/AzureCdnMe.Sample.CloudGroup/MapAzureCdnMe.Sample.Web:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="AzureCdnMe.Sample.WebInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/AzureCdnMe.Sample.Cloud/AzureCdnMe.Sample.CloudGroup/MapAzureCdnMe.Sample.WebInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:AzureCdnMe.Sample.Web:Endpoint1">
          <toPorts>
            <inPortMoniker name="/AzureCdnMe.Sample.Cloud/AzureCdnMe.Sample.CloudGroup/AzureCdnMe.Sample.Web/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapAzureCdnMe.Sample.Web:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureCdnMe.Sample.Cloud/AzureCdnMe.Sample.CloudGroup/AzureCdnMe.Sample.Web/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapAzureCdnMe.Sample.WebInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/AzureCdnMe.Sample.Cloud/AzureCdnMe.Sample.CloudGroup/AzureCdnMe.Sample.WebInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="AzureCdnMe.Sample.Web" generation="1" functional="0" release="0" software="C:\dev\work\AzureCdnMe.Sample\src\AzureCdnMe.Sample.Cloud\csx\Debug\roles\AzureCdnMe.Sample.Web" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="1792" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;AzureCdnMe.Sample.Web&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;AzureCdnMe.Sample.Web&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/AzureCdnMe.Sample.Cloud/AzureCdnMe.Sample.CloudGroup/AzureCdnMe.Sample.WebInstances" />
            <sCSPolicyFaultDomainMoniker name="/AzureCdnMe.Sample.Cloud/AzureCdnMe.Sample.CloudGroup/AzureCdnMe.Sample.WebFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyFaultDomain name="AzureCdnMe.Sample.WebFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="AzureCdnMe.Sample.WebInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="fd7acb0a-bb13-44f4-99d4-6825c1350f41" ref="Microsoft.RedDog.Contract\ServiceContract\AzureCdnMe.Sample.CloudContract@ServiceDefinition.build">
      <interfacereferences>
        <interfaceReference Id="f4fae71b-8bc6-4902-adbe-90441d182cf7" ref="Microsoft.RedDog.Contract\Interface\AzureCdnMe.Sample.Web:Endpoint1@ServiceDefinition.build">
          <inPort>
            <inPortMoniker name="/AzureCdnMe.Sample.Cloud/AzureCdnMe.Sample.CloudGroup/AzureCdnMe.Sample.Web:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>