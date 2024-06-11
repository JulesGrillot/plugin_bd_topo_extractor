<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis minScale="100000" version="3.10.9-A Coruña" styleCategories="AllStyleCategories" simplifyAlgorithm="0" simplifyDrawingTol="1" simplifyDrawingHints="1" simplifyMaxScale="1" readOnly="0" maxScale="0" simplifyLocal="1" labelsEnabled="0" hasScaleBasedVisibilityFlag="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="0" type="singleSymbol" forceraster="0" enableorderby="0">
    <symbols>
      <symbol name="0" type="fill" force_rhr="0" alpha="1" clip_to_extent="1">
        <layer enabled="1" pass="0" class="SimpleFill" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="179,217,255,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="no" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="Pixel" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <customproperties>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Pie">
    <DiagramCategory penColor="#000000" rotationOffset="270" lineSizeScale="3x:0,0,0,0,0,0" sizeType="MM" enabled="0" lineSizeType="MM" backgroundAlpha="255" width="15" sizeScale="3x:0,0,0,0,0,0" penAlpha="255" backgroundColor="#ffffff" barWidth="5" scaleDependency="Area" scaleBasedVisibility="0" maxScaleDenominator="1e+08" penWidth="0" labelPlacementMethod="XHeight" minimumSize="0" minScaleDenominator="-2.14748e+09" height="15" opacity="1" diagramOrientation="Up">
      <fontProperties style="" description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0"/>
      <attribute color="#000000" label="" field=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings showAll="1" linePlacementFlags="2" zIndex="0" obstacle="0" placement="0" dist="0" priority="0">
    <properties>
      <Option type="Map">
        <Option name="name" value="" type="QString"/>
        <Option name="properties" type="Map">
          <Option name="show" type="Map">
            <Option name="active" value="true" type="bool"/>
            <Option name="field" value="ID" type="QString"/>
            <Option name="type" value="2" type="int"/>
          </Option>
        </Option>
        <Option name="type" value="collection" type="QString"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration type="Map">
      <Option name="QgsGeometryGapCheck" type="Map">
        <Option name="allowedGapsBuffer" value="0" type="double"/>
        <Option name="allowedGapsEnabled" value="false" type="bool"/>
        <Option name="allowedGapsLayer" value="" type="QString"/>
      </Option>
    </checkConfiguration>
  </geometryOptions>
  <fieldConfiguration/>
  <aliases/>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults/>
  <constraints/>
  <constraintExpressions/>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortExpression="" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column name="ID" type="field" width="-1" hidden="0"/>
      <column name="CODE_HYDRO" type="field" width="-1" hidden="0"/>
      <column name="CODE_PAYS" type="field" width="-1" hidden="0"/>
      <column name="NATURE" type="field" width="-1" hidden="0"/>
      <column name="POS_SOL" type="field" width="-1" hidden="0"/>
      <column name="ETAT" type="field" width="-1" hidden="0"/>
      <column name="DATE_CREAT" type="field" width="-1" hidden="0"/>
      <column name="DATE_MAJ" type="field" width="-1" hidden="0"/>
      <column name="DATE_APP" type="field" width="-1" hidden="0"/>
      <column name="DATE_CONF" type="field" width="-1" hidden="0"/>
      <column name="SOURCE" type="field" width="-1" hidden="0"/>
      <column name="ID_SOURCE" type="field" width="-1" hidden="0"/>
      <column name="ACQU_PLANI" type="field" width="-1" hidden="0"/>
      <column name="PREC_PLANI" type="field" width="-1" hidden="0"/>
      <column name="ACQU_ALTI" type="field" width="-1" hidden="0"/>
      <column name="PREC_ALTI" type="field" width="-1" hidden="0"/>
      <column name="SRC_COORD" type="field" width="-1" hidden="0"/>
      <column name="SRC_ALTI" type="field" width="-1" hidden="0"/>
      <column name="STATUT" type="field" width="-1" hidden="0"/>
      <column name="PERSISTANC" type="field" width="-1" hidden="0"/>
      <column name="SALINITE" type="field" width="-1" hidden="0"/>
      <column name="ORIGINE" type="field" width="-1" hidden="0"/>
      <column name="COMMENT" type="field" width="-1" hidden="0"/>
      <column name="ID_P_EAU" type="field" width="-1" hidden="0"/>
      <column name="ID_C_EAU" type="field" width="-1" hidden="0"/>
      <column name="ID_ENT_TR" type="field" width="-1" hidden="0"/>
      <column name="NOM_P_EAU" type="field" width="-1" hidden="0"/>
      <column name="NOM_C_EAU" type="field" width="-1" hidden="0"/>
      <column name="NOM_ENT_TR" type="field" width="-1" hidden="0"/>
      <column type="actions" width="-1" hidden="1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field name="ACQU_ALTI" editable="1"/>
    <field name="ACQU_PLANI" editable="1"/>
    <field name="CODE_HYDRO" editable="1"/>
    <field name="CODE_PAYS" editable="1"/>
    <field name="COMMENT" editable="1"/>
    <field name="DATE_APP" editable="1"/>
    <field name="DATE_CONF" editable="1"/>
    <field name="DATE_CREAT" editable="1"/>
    <field name="DATE_MAJ" editable="1"/>
    <field name="ETAT" editable="1"/>
    <field name="ID" editable="1"/>
    <field name="ID_C_EAU" editable="1"/>
    <field name="ID_ENT_TR" editable="1"/>
    <field name="ID_P_EAU" editable="1"/>
    <field name="ID_SOURCE" editable="1"/>
    <field name="NATURE" editable="1"/>
    <field name="NOM_C_EAU" editable="1"/>
    <field name="NOM_ENT_TR" editable="1"/>
    <field name="NOM_P_EAU" editable="1"/>
    <field name="ORIGINE" editable="1"/>
    <field name="PERSISTANC" editable="1"/>
    <field name="POS_SOL" editable="1"/>
    <field name="PREC_ALTI" editable="1"/>
    <field name="PREC_PLANI" editable="1"/>
    <field name="SALINITE" editable="1"/>
    <field name="SOURCE" editable="1"/>
    <field name="SRC_ALTI" editable="1"/>
    <field name="SRC_COORD" editable="1"/>
    <field name="STATUT" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="ACQU_ALTI" labelOnTop="0"/>
    <field name="ACQU_PLANI" labelOnTop="0"/>
    <field name="CODE_HYDRO" labelOnTop="0"/>
    <field name="CODE_PAYS" labelOnTop="0"/>
    <field name="COMMENT" labelOnTop="0"/>
    <field name="DATE_APP" labelOnTop="0"/>
    <field name="DATE_CONF" labelOnTop="0"/>
    <field name="DATE_CREAT" labelOnTop="0"/>
    <field name="DATE_MAJ" labelOnTop="0"/>
    <field name="ETAT" labelOnTop="0"/>
    <field name="ID" labelOnTop="0"/>
    <field name="ID_C_EAU" labelOnTop="0"/>
    <field name="ID_ENT_TR" labelOnTop="0"/>
    <field name="ID_P_EAU" labelOnTop="0"/>
    <field name="ID_SOURCE" labelOnTop="0"/>
    <field name="NATURE" labelOnTop="0"/>
    <field name="NOM_C_EAU" labelOnTop="0"/>
    <field name="NOM_ENT_TR" labelOnTop="0"/>
    <field name="NOM_P_EAU" labelOnTop="0"/>
    <field name="ORIGINE" labelOnTop="0"/>
    <field name="PERSISTANC" labelOnTop="0"/>
    <field name="POS_SOL" labelOnTop="0"/>
    <field name="PREC_ALTI" labelOnTop="0"/>
    <field name="PREC_PLANI" labelOnTop="0"/>
    <field name="SALINITE" labelOnTop="0"/>
    <field name="SOURCE" labelOnTop="0"/>
    <field name="SRC_ALTI" labelOnTop="0"/>
    <field name="SRC_COORD" labelOnTop="0"/>
    <field name="STATUT" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>ID</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
