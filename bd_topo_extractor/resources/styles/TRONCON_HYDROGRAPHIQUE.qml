<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis minScale="25001" version="3.10.9-A Coruña" styleCategories="AllStyleCategories" simplifyAlgorithm="0" simplifyDrawingTol="1" simplifyDrawingHints="1" simplifyMaxScale="1" readOnly="0" maxScale="0" simplifyLocal="1" labelsEnabled="0" hasScaleBasedVisibilityFlag="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="0" type="singleSymbol" forceraster="0" enableorderby="0">
    <symbols>
      <symbol name="0" type="line" force_rhr="0" alpha="1" clip_to_extent="1">
        <layer enabled="1" pass="0" class="SimpleLine" locked="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="179,217,255,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="1" k="line_width"/>
          <prop v="Pixel" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
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
    <DiagramCategory penColor="#000000" rotationOffset="270" lineSizeScale="3x:0,0,0,0,0,0" sizeType="MM" enabled="0" lineSizeType="MM" backgroundAlpha="255" width="15" sizeScale="3x:0,0,0,0,0,0" penAlpha="255" backgroundColor="#ffffff" barWidth="5" scaleDependency="Area" scaleBasedVisibility="0" maxScaleDenominator="1e+08" penWidth="0" labelPlacementMethod="XHeight" minimumSize="0" minScaleDenominator="0" height="15" opacity="1" diagramOrientation="Up">
      <fontProperties style="" description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0"/>
      <attribute color="#000000" label="" field=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings showAll="1" linePlacementFlags="2" zIndex="0" obstacle="0" placement="2" dist="0" priority="0">
    <properties>
      <Option type="Map">
        <Option name="name" value="" type="QString"/>
        <Option name="properties" type="Map">
          <Option name="show" type="Map">
            <Option name="active" value="true" type="bool"/>
            <Option name="field" value="NOM_ENT_TR" type="QString"/>
            <Option name="type" value="2" type="int"/>
          </Option>
        </Option>
        <Option name="type" value="collection" type="QString"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration/>
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
      <column name="NOM_ENT_TR" type="field" width="-1" hidden="0"/>
      <column name="NOM_C_EAU" type="field" width="-1" hidden="0"/>
      <column name="ID_ENT_TR" type="field" width="-1" hidden="0"/>
      <column name="ID_S_HYDRO" type="field" width="-1" hidden="0"/>
      <column name="ID_C_EAU" type="field" width="-1" hidden="0"/>
      <column name="CODE_CARTH" type="field" width="-1" hidden="0"/>
      <column name="COMMENT" type="field" width="-1" hidden="0"/>
      <column name="BRAS" type="field" width="-1" hidden="0"/>
      <column name="LARGEUR" type="field" width="-1" hidden="0"/>
      <column name="DELIMIT" type="field" width="-1" hidden="0"/>
      <column name="RES_COULAN" type="field" width="-1" hidden="0"/>
      <column name="SENS_ECOUL" type="field" width="-1" hidden="0"/>
      <column name="PER_ORDRE" type="field" width="-1" hidden="0"/>
      <column name="ORIGINE" type="field" width="-1" hidden="0"/>
      <column name="CLA_ORDRE" type="field" width="-1" hidden="0"/>
      <column name="NUM_ORDRE" type="field" width="-1" hidden="0"/>
      <column name="SALINITE" type="field" width="-1" hidden="0"/>
      <column name="NAVIGABL" type="field" width="-1" hidden="0"/>
      <column name="FOSSE" type="field" width="-1" hidden="0"/>
      <column name="PERSISTANC" type="field" width="-1" hidden="0"/>
      <column name="STATUT" type="field" width="-1" hidden="0"/>
      <column name="SRC_ALTI" type="field" width="-1" hidden="0"/>
      <column name="SRC_COORD" type="field" width="-1" hidden="0"/>
      <column name="PREC_ALTI" type="field" width="-1" hidden="0"/>
      <column name="ACQU_ALTI" type="field" width="-1" hidden="0"/>
      <column name="PREC_PLANI" type="field" width="-1" hidden="0"/>
      <column name="ACQU_PLANI" type="field" width="-1" hidden="0"/>
      <column name="ID_SOURCE" type="field" width="-1" hidden="0"/>
      <column name="SOURCE" type="field" width="-1" hidden="0"/>
      <column name="DATE_CONF" type="field" width="-1" hidden="0"/>
      <column name="DATE_APP" type="field" width="-1" hidden="0"/>
      <column name="DATE_MAJ" type="field" width="-1" hidden="0"/>
      <column name="DATE_CREAT" type="field" width="-1" hidden="0"/>
      <column name="ETAT" type="field" width="-1" hidden="0"/>
      <column name="POS_SOL" type="field" width="-1" hidden="0"/>
      <column name="FICTIF" type="field" width="-1" hidden="0"/>
      <column name="NATURE" type="field" width="-1" hidden="0"/>
      <column name="CODE_PAYS" type="field" width="-1" hidden="0"/>
      <column name="CODE_HYDRO" type="field" width="-1" hidden="0"/>
      <column name="ID" type="field" width="-1" hidden="0"/>
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
    <field name="BRAS" editable="1"/>
    <field name="CLA_ORDRE" editable="1"/>
    <field name="CODE_CARTH" editable="1"/>
    <field name="CODE_HYDRO" editable="1"/>
    <field name="CODE_PAYS" editable="1"/>
    <field name="COMMENT" editable="1"/>
    <field name="DATE_APP" editable="1"/>
    <field name="DATE_CONF" editable="1"/>
    <field name="DATE_CREAT" editable="1"/>
    <field name="DATE_MAJ" editable="1"/>
    <field name="DELIMIT" editable="1"/>
    <field name="ETAT" editable="1"/>
    <field name="FICTIF" editable="1"/>
    <field name="FOSSE" editable="1"/>
    <field name="ID" editable="1"/>
    <field name="ID_C_EAU" editable="1"/>
    <field name="ID_ENT_TR" editable="1"/>
    <field name="ID_SOURCE" editable="1"/>
    <field name="ID_S_HYDRO" editable="1"/>
    <field name="LARGEUR" editable="1"/>
    <field name="NATURE" editable="1"/>
    <field name="NAVIGABL" editable="1"/>
    <field name="NOM_C_EAU" editable="1"/>
    <field name="NOM_ENT_TR" editable="1"/>
    <field name="NUM_ORDRE" editable="1"/>
    <field name="ORIGINE" editable="1"/>
    <field name="PERSISTANC" editable="1"/>
    <field name="PER_ORDRE" editable="1"/>
    <field name="POS_SOL" editable="1"/>
    <field name="PREC_ALTI" editable="1"/>
    <field name="PREC_PLANI" editable="1"/>
    <field name="RES_COULAN" editable="1"/>
    <field name="SALINITE" editable="1"/>
    <field name="SENS_ECOUL" editable="1"/>
    <field name="SOURCE" editable="1"/>
    <field name="SRC_ALTI" editable="1"/>
    <field name="SRC_COORD" editable="1"/>
    <field name="STATUT" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="ACQU_ALTI" labelOnTop="0"/>
    <field name="ACQU_PLANI" labelOnTop="0"/>
    <field name="BRAS" labelOnTop="0"/>
    <field name="CLA_ORDRE" labelOnTop="0"/>
    <field name="CODE_CARTH" labelOnTop="0"/>
    <field name="CODE_HYDRO" labelOnTop="0"/>
    <field name="CODE_PAYS" labelOnTop="0"/>
    <field name="COMMENT" labelOnTop="0"/>
    <field name="DATE_APP" labelOnTop="0"/>
    <field name="DATE_CONF" labelOnTop="0"/>
    <field name="DATE_CREAT" labelOnTop="0"/>
    <field name="DATE_MAJ" labelOnTop="0"/>
    <field name="DELIMIT" labelOnTop="0"/>
    <field name="ETAT" labelOnTop="0"/>
    <field name="FICTIF" labelOnTop="0"/>
    <field name="FOSSE" labelOnTop="0"/>
    <field name="ID" labelOnTop="0"/>
    <field name="ID_C_EAU" labelOnTop="0"/>
    <field name="ID_ENT_TR" labelOnTop="0"/>
    <field name="ID_SOURCE" labelOnTop="0"/>
    <field name="ID_S_HYDRO" labelOnTop="0"/>
    <field name="LARGEUR" labelOnTop="0"/>
    <field name="NATURE" labelOnTop="0"/>
    <field name="NAVIGABL" labelOnTop="0"/>
    <field name="NOM_C_EAU" labelOnTop="0"/>
    <field name="NOM_ENT_TR" labelOnTop="0"/>
    <field name="NUM_ORDRE" labelOnTop="0"/>
    <field name="ORIGINE" labelOnTop="0"/>
    <field name="PERSISTANC" labelOnTop="0"/>
    <field name="PER_ORDRE" labelOnTop="0"/>
    <field name="POS_SOL" labelOnTop="0"/>
    <field name="PREC_ALTI" labelOnTop="0"/>
    <field name="PREC_PLANI" labelOnTop="0"/>
    <field name="RES_COULAN" labelOnTop="0"/>
    <field name="SALINITE" labelOnTop="0"/>
    <field name="SENS_ECOUL" labelOnTop="0"/>
    <field name="SOURCE" labelOnTop="0"/>
    <field name="SRC_ALTI" labelOnTop="0"/>
    <field name="SRC_COORD" labelOnTop="0"/>
    <field name="STATUT" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>COALESCE( "ID", '&lt;NULL>' )</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
