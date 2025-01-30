<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis minScale="100000" version="3.10.9-A Coruña" styleCategories="AllStyleCategories" simplifyAlgorithm="0" simplifyDrawingTol="1" simplifyDrawingHints="1" simplifyMaxScale="1" readOnly="0" maxScale="0" simplifyLocal="1" labelsEnabled="1" hasScaleBasedVisibilityFlag="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="0" type="RuleRenderer" forceraster="0" enableorderby="1">
    <rules key="{3b80663e-4894-4ca0-9a09-12c19c38c91e}">
      <rule key="{6947544e-45bc-4ce3-9be3-c9c06e10468a}" filter="&quot;NATURE&quot; = 'Bac ou liaison maritime'" label="Bac ou liaison maritime" scalemaxdenom="100001" symbol="0"/>
      <rule key="{2c7dd88e-ba48-4158-9401-b2975aa8ab54}" filter="&quot;NATURE&quot; = 'Bretelle'" label="Bretelle" scalemaxdenom="100001" symbol="1"/>
      <rule key="{990aeb09-4461-4484-8325-107c1d9e3d48}" filter="&quot;NATURE&quot; = 'Chemin'" label="Chemin" scalemaxdenom="50001" symbol="2"/>
      <rule key="{f631156e-b93f-4f61-80f2-012f60d022de}" filter="&quot;NATURE&quot; = 'Escalier'" label="Escalier" scalemaxdenom="50001" symbol="3"/>
      <rule key="{112ecd51-2274-41af-afc3-999c6f07eb1b}" filter="&quot;NATURE&quot; = 'Piste cyclable'" label="Piste cyclable" scalemaxdenom="50001" symbol="4"/>
      <rule key="{deb660ec-a09b-42c9-ab05-d1f3abf97e16}" filter="&quot;NATURE&quot; = 'Rond-point'" label="Rond-point">
        <rule key="{e8cc73a5-34d9-488e-85a9-ee82e685e434}" label="Tous" scalemindenom="3001" scalemaxdenom="100001" symbol="5"/>
        <rule key="{e912ee77-8940-4158-803a-075b221f690c}" label="2 bords" scalemaxdenom="3001" symbol="6"/>
      </rule>
      <rule key="{3db786ee-ced1-4336-8df2-c8292ecb25b3}" filter="&quot;NATURE&quot; = 'Route à 1 chaussée'" label="Route à 1 chaussée">
        <rule key="{88d24700-e183-40d2-876f-4065a75c739a}" filter=" &quot;IMPORTANCE&quot;  &lt; 4" label="IMP &lt; 4" scalemindenom="50001" scalemaxdenom="100001" symbol="7"/>
        <rule key="{effd26dc-0830-4b68-a37e-b4dbf3830c3e}" label="Toutes" scalemindenom="3001" scalemaxdenom="50001" symbol="8"/>
        <rule key="{5f23a410-ff8a-4972-a283-1708d2972789}" label="2 bords" scalemaxdenom="3001" symbol="9"/>
      </rule>
      <rule key="{4163fcd0-a3b5-4a35-a7a4-1dddb51170fd}" filter="&quot;NATURE&quot; = 'Route à 2 chaussées'" label="Route à 2 chaussées">
        <rule key="{b2b0ce31-6022-4f3f-87f4-6b26bfe2022c}" label="Ech. -> 1:10000" scalemindenom="10001" scalemaxdenom="100001" symbol="10"/>
        <rule key="{05136f90-f903-4a39-b7de-e295f3111914}" label="Ech. -> 1:3000" scalemindenom="3001" scalemaxdenom="10001" symbol="11"/>
        <rule key="{c1f8c3fb-8f83-4a02-82ff-3eed209cdc42}" label="Ech. -> 1:1" scalemaxdenom="3001" symbol="12"/>
      </rule>
      <rule key="{104fda88-fa15-4a4b-8fe1-9ad49bad7158}" filter="&quot;NATURE&quot; = 'Route empierrée'" label="Route empierrée" scalemaxdenom="50001" symbol="13"/>
      <rule key="{245228ad-426e-4478-aaeb-2283e3d8b887}" filter="&quot;NATURE&quot; = 'Sentier'" label="Sentier" scalemaxdenom="50001" symbol="14"/>
      <rule key="{fef234a2-aca4-4a00-8dc1-6c3300e02ed0}" filter="&quot;NATURE&quot; = 'Type autoroutier'" label="Type autoroutier" scalemaxdenom="2000001" symbol="15"/>
    </rules>
    <symbols>
      <symbol name="0" type="line" force_rhr="0" alpha="1" clip_to_extent="1">
        <layer enabled="1" pass="0" class="SimpleLine" locked="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="Pixel" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="255,0,127,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="1" k="line_width"/>
          <prop v="Pixel" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="Pixel" k="offset_unit"/>
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
      <symbol name="1" type="line" force_rhr="0" alpha="1" clip_to_extent="1">
        <layer enabled="1" pass="0" class="SimpleLine" locked="1">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="0,0,0,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="3" k="line_width"/>
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
        <layer enabled="1" pass="5" class="SimpleLine" locked="0">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="0,172,172,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="2" k="line_width"/>
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
      <symbol name="10" type="line" force_rhr="0" alpha="1" clip_to_extent="1">
        <layer enabled="1" pass="0" class="SimpleLine" locked="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="2.5" k="line_width"/>
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
      <symbol name="11" type="line" force_rhr="0" alpha="1" clip_to_extent="1">
        <layer enabled="1" pass="0" class="SimpleLine" locked="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="1.2" k="line_width"/>
          <prop v="Pixel" k="line_width_unit"/>
          <prop v="-1.5" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="Pixel" k="offset_unit"/>
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
        <layer enabled="1" pass="0" class="SimpleLine" locked="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="1.2" k="line_width"/>
          <prop v="Pixel" k="line_width_unit"/>
          <prop v="1.5" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="Pixel" k="offset_unit"/>
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
      <symbol name="12" type="line" force_rhr="0" alpha="1" clip_to_extent="0">
        <layer enabled="1" pass="0" class="SimpleLine" locked="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="10" k="line_width"/>
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
        <layer enabled="1" pass="1" class="SimpleLine" locked="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="255,255,255,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="8" k="line_width"/>
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
      <symbol name="13" type="line" force_rhr="0" alpha="1" clip_to_extent="1">
        <layer enabled="1" pass="2" class="SimpleLine" locked="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="dash" k="line_style"/>
          <prop v="2" k="line_width"/>
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
      <symbol name="14" type="line" force_rhr="0" alpha="1" clip_to_extent="1">
        <layer enabled="1" pass="0" class="SimpleLine" locked="0">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="45,52,39,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="1.5" k="line_width"/>
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
        <layer enabled="1" pass="0" class="SimpleLine" locked="1">
          <prop v="round" k="capstyle"/>
          <prop v="4;4" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="Pixel" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="37,227,113,255" k="line_color"/>
          <prop v="dash" k="line_style"/>
          <prop v="1.5" k="line_width"/>
          <prop v="Pixel" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="1" k="use_custom_dash"/>
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
      <symbol name="15" type="line" force_rhr="0" alpha="1" clip_to_extent="1">
        <layer enabled="1" pass="0" class="SimpleLine" locked="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="35,92,160,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="8" k="line_width"/>
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
        <layer enabled="1" pass="16" class="SimpleLine" locked="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="204,0,110,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="2.6" k="line_width"/>
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
      <symbol name="2" type="line" force_rhr="0" alpha="1" clip_to_extent="1">
        <layer enabled="1" pass="3" class="SimpleLine" locked="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="199,98,39,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="1.5" k="line_width"/>
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
      <symbol name="3" type="line" force_rhr="0" alpha="1" clip_to_extent="1">
        <layer enabled="1" pass="0" class="MarkerLine" locked="0">
          <prop v="4" k="average_angle_length"/>
          <prop v="3x:0,0,0,0,0,0" k="average_angle_map_unit_scale"/>
          <prop v="MM" k="average_angle_unit"/>
          <prop v="6" k="interval"/>
          <prop v="3x:0,0,0,0,0,0" k="interval_map_unit_scale"/>
          <prop v="Pixel" k="interval_unit"/>
          <prop v="0" k="offset"/>
          <prop v="0" k="offset_along_line"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_along_line_map_unit_scale"/>
          <prop v="MM" k="offset_along_line_unit"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="interval" k="placement"/>
          <prop v="0" k="ring_filter"/>
          <prop v="1" k="rotate"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
          <symbol name="@3@0" type="marker" force_rhr="0" alpha="0.97" clip_to_extent="1">
            <layer enabled="1" pass="0" class="SimpleMarker" locked="0">
              <prop v="0" k="angle"/>
              <prop v="255,0,0,255" k="color"/>
              <prop v="1" k="horizontal_anchor_point"/>
              <prop v="bevel" k="joinstyle"/>
              <prop v="line" k="name"/>
              <prop v="0,0" k="offset"/>
              <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
              <prop v="MM" k="offset_unit"/>
              <prop v="0,0,0,255" k="outline_color"/>
              <prop v="solid" k="outline_style"/>
              <prop v="0" k="outline_width"/>
              <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
              <prop v="MM" k="outline_width_unit"/>
              <prop v="area" k="scale_method"/>
              <prop v="4" k="size"/>
              <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
              <prop v="Pixel" k="size_unit"/>
              <prop v="1" k="vertical_anchor_point"/>
              <data_defined_properties>
                <Option type="Map">
                  <Option name="name" value="" type="QString"/>
                  <Option name="properties"/>
                  <Option name="type" value="collection" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer enabled="1" pass="0" class="SimpleLine" locked="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0,0,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="1" k="line_width"/>
          <prop v="Pixel" k="line_width_unit"/>
          <prop v="2" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="Pixel" k="offset_unit"/>
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
        <layer enabled="1" pass="0" class="SimpleLine" locked="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0,0,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="1" k="line_width"/>
          <prop v="Pixel" k="line_width_unit"/>
          <prop v="-2" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="Pixel" k="offset_unit"/>
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
      <symbol name="4" type="line" force_rhr="0" alpha="1" clip_to_extent="1">
        <layer enabled="1" pass="0" class="SimpleLine" locked="0">
          <prop v="round" k="capstyle"/>
          <prop v="12;4" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="Pixel" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="0,255,0,255" k="line_color"/>
          <prop v="dot" k="line_style"/>
          <prop v="1.5" k="line_width"/>
          <prop v="Pixel" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="1" k="use_custom_dash"/>
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
      <symbol name="5" type="line" force_rhr="0" alpha="1" clip_to_extent="1">
        <layer enabled="1" pass="0" class="SimpleLine" locked="1">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="92,92,92,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="2" k="line_width"/>
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
        <layer enabled="1" pass="3" class="SimpleLine" locked="0">
          <prop v="round" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="192,192,192,255" k="line_color"/>
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
      <symbol name="6" type="line" force_rhr="0" alpha="1" clip_to_extent="0">
        <layer enabled="1" pass="0" class="SimpleLine" locked="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="10" k="line_width"/>
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
        <layer enabled="1" pass="1" class="SimpleLine" locked="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="255,255,255,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="8" k="line_width"/>
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
      <symbol name="7" type="line" force_rhr="0" alpha="1" clip_to_extent="1">
        <layer enabled="1" pass="0" class="SimpleLine" locked="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="1.5" k="line_width"/>
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
      <symbol name="8" type="line" force_rhr="0" alpha="1" clip_to_extent="1">
        <layer enabled="1" pass="0" class="SimpleLine" locked="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="1.5" k="line_width"/>
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
      <symbol name="9" type="line" force_rhr="0" alpha="1" clip_to_extent="0">
        <layer enabled="1" pass="0" class="SimpleLine" locked="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="100,100,100,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="10" k="line_width"/>
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
        <layer enabled="1" pass="1" class="SimpleLine" locked="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="255,255,255,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="8" k="line_width"/>
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
  </renderer-v2>
  <labeling type="rule-based">
    <rules key="{1ba76096-3f60-4f06-ada0-eb68d7fa9975}">
      <rule key="{a32fd2cb-8f90-44e2-81be-1c4d8d4c8b2c}" filter="&quot;NATURE&quot; = 'Bac ou liaison maritime'" scalemindenom="1" scalemaxdenom="40001" description="Bac ou liaison maritime">
        <settings calloutType="simple">
          <text-style fontStrikeout="0" fontKerning="1" blendMode="0" previewBkgrdColor="255,255,255,255" textOpacity="1" useSubstitutions="0" isExpression="0" fontItalic="0" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontCapitals="0" multilineHeight="1" fontSizeUnit="Point" fontUnderline="0" fontWordSpacing="0" textColor="255,0,127,255" fontWeight="50" fontSize="11" namedStyle="Regular" fieldName="TOPONYME" fontFamily="Calibri" textOrientation="horizontal" fontLetterSpacing="0">
            <text-buffer bufferJoinStyle="128" bufferBlendMode="0" bufferSize="2" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferNoFill="1" bufferColor="255,255,255,255" bufferSizeUnits="Point" bufferDraw="0" bufferOpacity="1"/>
            <background shapeFillColor="255,255,255,255" shapeBorderColor="128,128,128,255" shapeDraw="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeJoinStyle="64" shapeBlendMode="0" shapeSizeUnit="MM" shapeRotation="0" shapeOffsetY="0" shapeOffsetX="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetUnit="MM" shapeRadiiX="0" shapeSizeY="0" shapeBorderWidth="0" shapeRadiiUnit="MM" shapeOpacity="1" shapeRadiiY="0" shapeRotationType="0" shapeSizeType="0" shapeSVGFile="" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthUnit="MM" shapeType="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeSizeX="0">
              <symbol name="markerSymbol" type="marker" force_rhr="0" alpha="1" clip_to_extent="1">
                <layer enabled="1" pass="0" class="SimpleMarker" locked="0">
                  <prop v="0" k="angle"/>
                  <prop v="183,72,75,255" k="color"/>
                  <prop v="1" k="horizontal_anchor_point"/>
                  <prop v="bevel" k="joinstyle"/>
                  <prop v="circle" k="name"/>
                  <prop v="0,0" k="offset"/>
                  <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
                  <prop v="MM" k="offset_unit"/>
                  <prop v="35,35,35,255" k="outline_color"/>
                  <prop v="solid" k="outline_style"/>
                  <prop v="0" k="outline_width"/>
                  <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
                  <prop v="MM" k="outline_width_unit"/>
                  <prop v="diameter" k="scale_method"/>
                  <prop v="2" k="size"/>
                  <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
                  <prop v="MM" k="size_unit"/>
                  <prop v="1" k="vertical_anchor_point"/>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option name="name" value="" type="QString"/>
                      <Option name="properties"/>
                      <Option name="type" value="collection" type="QString"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </background>
            <shadow shadowUnder="0" shadowOffsetUnit="MM" shadowRadius="1.5" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowDraw="0" shadowOffsetGlobal="1" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowColor="0,0,0,255" shadowBlendMode="6" shadowOffsetAngle="135" shadowOffsetDist="1" shadowRadiusAlphaOnly="0" shadowScale="100" shadowRadiusUnit="MM" shadowOpacity="0.7"/>
            <dd_properties>
              <Option type="Map">
                <Option name="name" value="" type="QString"/>
                <Option name="properties"/>
                <Option name="type" value="collection" type="QString"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format addDirectionSymbol="0" reverseDirectionSymbol="0" leftDirectionSymbol="&lt;" decimals="3" wrapChar=":" multilineAlign="1" autoWrapLength="0" formatNumbers="0" plussign="0" useMaxLineLengthForAutoWrap="1" rightDirectionSymbol=">" placeDirectionSymbol="0"/>
          <placement maxCurvedCharAngleOut="-25" overrunDistanceUnit="Pixel" maxCurvedCharAngleIn="25" repeatDistanceUnits="MM" preserveRotation="1" distUnits="MM" overrunDistance="0" layerType="LineGeometry" geometryGenerator="" geometryGeneratorType="PointGeometry" placementFlags="10" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" quadOffset="4" repeatDistance="0" priority="5" distMapUnitScale="3x:0,0,0,0,0,0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="2" centroidInside="0" offsetType="0" offsetUnits="MM" dist="0" yOffset="0" geometryGeneratorEnabled="0" rotationAngle="0" fitInPolygonOnly="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" xOffset="0" centroidWhole="0"/>
          <rendering fontMaxPixelSize="10000" mergeLines="0" limitNumLabels="0" obstacle="1" scaleVisibility="0" labelPerPart="0" obstacleFactor="1" drawLabels="1" minFeatureSize="0" scaleMax="0" obstacleType="1" fontLimitPixelSize="0" maxNumLabels="2000" zIndex="0" fontMinPixelSize="3" scaleMin="0" upsidedownLabels="0" displayAll="0"/>
          <dd_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option name="anchorPoint" value="pole_of_inaccessibility" type="QString"/>
              <Option name="ddProperties" type="Map">
                <Option name="name" value="" type="QString"/>
                <Option name="properties"/>
                <Option name="type" value="collection" type="QString"/>
              </Option>
              <Option name="drawToAllParts" value="false" type="bool"/>
              <Option name="enabled" value="0" type="QString"/>
              <Option name="lineSymbol" value="&lt;symbol name=&quot;symbol&quot; type=&quot;line&quot; force_rhr=&quot;0&quot; alpha=&quot;1&quot; clip_to_extent=&quot;1&quot;>&lt;layer enabled=&quot;1&quot; pass=&quot;0&quot; class=&quot;SimpleLine&quot; locked=&quot;0&quot;>&lt;prop v=&quot;square&quot; k=&quot;capstyle&quot;/>&lt;prop v=&quot;5;2&quot; k=&quot;customdash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;customdash_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;customdash_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;draw_inside_polygon&quot;/>&lt;prop v=&quot;bevel&quot; k=&quot;joinstyle&quot;/>&lt;prop v=&quot;60,60,60,255&quot; k=&quot;line_color&quot;/>&lt;prop v=&quot;solid&quot; k=&quot;line_style&quot;/>&lt;prop v=&quot;0.3&quot; k=&quot;line_width&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;line_width_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;offset&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;offset_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;offset_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;ring_filter&quot;/>&lt;prop v=&quot;0&quot; k=&quot;use_custom_dash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;width_map_unit_scale&quot;/>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; value=&quot;&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; value=&quot;collection&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString"/>
              <Option name="minLength" value="0" type="double"/>
              <Option name="minLengthMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="minLengthUnit" value="MM" type="QString"/>
              <Option name="offsetFromAnchor" value="0" type="double"/>
              <Option name="offsetFromAnchorMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="offsetFromAnchorUnit" value="MM" type="QString"/>
              <Option name="offsetFromLabel" value="0" type="double"/>
              <Option name="offsetFromLabelMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="offsetFromLabelUnit" value="MM" type="QString"/>
            </Option>
          </callout>
        </settings>
      </rule>
      <rule key="{5e52ef44-c6eb-4958-903b-1b6686c6d9f8}" filter="&quot;NATURE&quot; = 'Bretelle'" scalemindenom="1" scalemaxdenom="100001" description="Bretelle" active="0"/>
      <rule key="{e4cfe3c8-f3a5-4536-a5ef-58e912ee8370}" filter="&quot;NATURE&quot; = 'Chemin'" scalemindenom="1" scalemaxdenom="100001" description="Chemin" active="0"/>
      <rule key="{3d81d32c-7e2e-44b1-9fbc-27fa69d80a71}" filter="&quot;NATURE&quot; = 'Escalier'" scalemindenom="1" scalemaxdenom="100001" description="Escalier" active="0"/>
      <rule key="{f4b68058-a9bd-4ecd-b40e-06556a9543dc}" filter="&quot;NATURE&quot; = 'Piste cyclable'" scalemindenom="1" scalemaxdenom="100001" description="Piste cyclable" active="0"/>
      <rule key="{58a1c597-57ec-4303-abaf-c9af43c9d8c1}" filter="&quot;NATURE&quot; = 'Rond-point'" scalemindenom="1" scalemaxdenom="100001" description="Rond-point" active="0"/>
      <rule key="{d513f295-98fd-4399-9d2f-35a5d7b221fc}" filter="&quot;NATURE&quot; = 'Route à 1 chaussée'" scalemindenom="1" scalemaxdenom="100001" description="Route à 1 chaussée">
        <rule key="{1c93bf85-0fc4-4828-ae2d-149e9f12ce4d}" filter="ELSE" scalemindenom="1" scalemaxdenom="100001" description="Numéro">
          <settings calloutType="simple">
            <text-style fontStrikeout="0" fontKerning="1" blendMode="0" previewBkgrdColor="255,255,255,255" textOpacity="1" useSubstitutions="0" isExpression="0" fontItalic="0" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontCapitals="0" multilineHeight="1" fontSizeUnit="Point" fontUnderline="0" fontWordSpacing="0" textColor="0,0,0,255" fontWeight="50" fontSize="10" namedStyle="Regular" fieldName="NUMERO" fontFamily="Calibri" textOrientation="horizontal" fontLetterSpacing="0">
              <text-buffer bufferJoinStyle="128" bufferBlendMode="0" bufferSize="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferNoFill="1" bufferColor="255,255,255,255" bufferSizeUnits="Point" bufferDraw="1" bufferOpacity="1"/>
              <background shapeFillColor="255,255,255,255" shapeBorderColor="128,128,128,255" shapeDraw="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeJoinStyle="64" shapeBlendMode="0" shapeSizeUnit="MM" shapeRotation="0" shapeOffsetY="0" shapeOffsetX="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetUnit="MM" shapeRadiiX="0" shapeSizeY="0" shapeBorderWidth="0" shapeRadiiUnit="MM" shapeOpacity="1" shapeRadiiY="0" shapeRotationType="0" shapeSizeType="0" shapeSVGFile="" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthUnit="MM" shapeType="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeSizeX="0">
                <symbol name="markerSymbol" type="marker" force_rhr="0" alpha="1" clip_to_extent="1">
                  <layer enabled="1" pass="0" class="SimpleMarker" locked="0">
                    <prop v="0" k="angle"/>
                    <prop v="225,89,137,255" k="color"/>
                    <prop v="1" k="horizontal_anchor_point"/>
                    <prop v="bevel" k="joinstyle"/>
                    <prop v="circle" k="name"/>
                    <prop v="0,0" k="offset"/>
                    <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
                    <prop v="MM" k="offset_unit"/>
                    <prop v="35,35,35,255" k="outline_color"/>
                    <prop v="solid" k="outline_style"/>
                    <prop v="0" k="outline_width"/>
                    <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
                    <prop v="MM" k="outline_width_unit"/>
                    <prop v="diameter" k="scale_method"/>
                    <prop v="2" k="size"/>
                    <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
                    <prop v="MM" k="size_unit"/>
                    <prop v="1" k="vertical_anchor_point"/>
                    <data_defined_properties>
                      <Option type="Map">
                        <Option name="name" value="" type="QString"/>
                        <Option name="properties"/>
                        <Option name="type" value="collection" type="QString"/>
                      </Option>
                    </data_defined_properties>
                  </layer>
                </symbol>
              </background>
              <shadow shadowUnder="0" shadowOffsetUnit="MM" shadowRadius="1.5" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowDraw="0" shadowOffsetGlobal="1" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowColor="0,0,0,255" shadowBlendMode="6" shadowOffsetAngle="135" shadowOffsetDist="1" shadowRadiusAlphaOnly="0" shadowScale="100" shadowRadiusUnit="MM" shadowOpacity="0.7"/>
              <dd_properties>
                <Option type="Map">
                  <Option name="name" value="" type="QString"/>
                  <Option name="properties"/>
                  <Option name="type" value="collection" type="QString"/>
                </Option>
              </dd_properties>
              <substitutions/>
            </text-style>
            <text-format addDirectionSymbol="0" reverseDirectionSymbol="0" leftDirectionSymbol="&lt;" decimals="3" wrapChar="" multilineAlign="0" autoWrapLength="0" formatNumbers="0" plussign="0" useMaxLineLengthForAutoWrap="1" rightDirectionSymbol=">" placeDirectionSymbol="0"/>
            <placement maxCurvedCharAngleOut="-25" overrunDistanceUnit="MM" maxCurvedCharAngleIn="25" repeatDistanceUnits="MM" preserveRotation="1" distUnits="MM" overrunDistance="0" layerType="LineGeometry" geometryGenerator="" geometryGeneratorType="PointGeometry" placementFlags="10" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" quadOffset="4" repeatDistance="0" priority="5" distMapUnitScale="3x:0,0,0,0,0,0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="3" centroidInside="0" offsetType="0" offsetUnits="MM" dist="0" yOffset="0" geometryGeneratorEnabled="0" rotationAngle="0" fitInPolygonOnly="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" xOffset="0" centroidWhole="0"/>
            <rendering fontMaxPixelSize="10000" mergeLines="1" limitNumLabels="0" obstacle="1" scaleVisibility="0" labelPerPart="0" obstacleFactor="1" drawLabels="1" minFeatureSize="5" scaleMax="0" obstacleType="1" fontLimitPixelSize="0" maxNumLabels="2000" zIndex="0" fontMinPixelSize="3" scaleMin="0" upsidedownLabels="0" displayAll="0"/>
            <dd_properties>
              <Option type="Map">
                <Option name="name" value="" type="QString"/>
                <Option name="properties"/>
                <Option name="type" value="collection" type="QString"/>
              </Option>
            </dd_properties>
            <callout type="simple">
              <Option type="Map">
                <Option name="anchorPoint" value="pole_of_inaccessibility" type="QString"/>
                <Option name="ddProperties" type="Map">
                  <Option name="name" value="" type="QString"/>
                  <Option name="properties"/>
                  <Option name="type" value="collection" type="QString"/>
                </Option>
                <Option name="drawToAllParts" value="false" type="bool"/>
                <Option name="enabled" value="0" type="QString"/>
                <Option name="lineSymbol" value="&lt;symbol name=&quot;symbol&quot; type=&quot;line&quot; force_rhr=&quot;0&quot; alpha=&quot;1&quot; clip_to_extent=&quot;1&quot;>&lt;layer enabled=&quot;1&quot; pass=&quot;0&quot; class=&quot;SimpleLine&quot; locked=&quot;0&quot;>&lt;prop v=&quot;square&quot; k=&quot;capstyle&quot;/>&lt;prop v=&quot;5;2&quot; k=&quot;customdash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;customdash_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;customdash_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;draw_inside_polygon&quot;/>&lt;prop v=&quot;bevel&quot; k=&quot;joinstyle&quot;/>&lt;prop v=&quot;60,60,60,255&quot; k=&quot;line_color&quot;/>&lt;prop v=&quot;solid&quot; k=&quot;line_style&quot;/>&lt;prop v=&quot;0.3&quot; k=&quot;line_width&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;line_width_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;offset&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;offset_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;offset_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;ring_filter&quot;/>&lt;prop v=&quot;0&quot; k=&quot;use_custom_dash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;width_map_unit_scale&quot;/>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; value=&quot;&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; value=&quot;collection&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString"/>
                <Option name="minLength" value="0" type="double"/>
                <Option name="minLengthMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
                <Option name="minLengthUnit" value="MM" type="QString"/>
                <Option name="offsetFromAnchor" value="0" type="double"/>
                <Option name="offsetFromAnchorMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
                <Option name="offsetFromAnchorUnit" value="MM" type="QString"/>
                <Option name="offsetFromLabel" value="0" type="double"/>
                <Option name="offsetFromLabelMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
                <Option name="offsetFromLabelUnit" value="MM" type="QString"/>
              </Option>
            </callout>
          </settings>
        </rule>
        <rule key="{dccf6d63-6192-4130-9e1c-33465a534c7a}" filter="ELSE" scalemindenom="1" scalemaxdenom="3001" description="Odonyme">
          <settings calloutType="simple">
            <text-style fontStrikeout="0" fontKerning="1" blendMode="0" previewBkgrdColor="255,255,255,255" textOpacity="1" useSubstitutions="0" isExpression="0" fontItalic="0" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontCapitals="0" multilineHeight="1" fontSizeUnit="Point" fontUnderline="0" fontWordSpacing="0" textColor="0,0,0,255" fontWeight="50" fontSize="8" namedStyle="Regular" fieldName="NOM_BAN_G" fontFamily="Calibri" textOrientation="horizontal" fontLetterSpacing="0">
              <text-buffer bufferJoinStyle="128" bufferBlendMode="0" bufferSize="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferNoFill="1" bufferColor="255,255,255,255" bufferSizeUnits="Point" bufferDraw="1" bufferOpacity="1"/>
              <background shapeFillColor="255,255,255,255" shapeBorderColor="128,128,128,255" shapeDraw="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeJoinStyle="64" shapeBlendMode="0" shapeSizeUnit="MM" shapeRotation="0" shapeOffsetY="0" shapeOffsetX="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetUnit="MM" shapeRadiiX="0" shapeSizeY="0" shapeBorderWidth="0" shapeRadiiUnit="MM" shapeOpacity="1" shapeRadiiY="0" shapeRotationType="0" shapeSizeType="0" shapeSVGFile="" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthUnit="MM" shapeType="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeSizeX="0">
                <symbol name="markerSymbol" type="marker" force_rhr="0" alpha="1" clip_to_extent="1">
                  <layer enabled="1" pass="0" class="SimpleMarker" locked="0">
                    <prop v="0" k="angle"/>
                    <prop v="225,89,137,255" k="color"/>
                    <prop v="1" k="horizontal_anchor_point"/>
                    <prop v="bevel" k="joinstyle"/>
                    <prop v="circle" k="name"/>
                    <prop v="0,0" k="offset"/>
                    <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
                    <prop v="MM" k="offset_unit"/>
                    <prop v="35,35,35,255" k="outline_color"/>
                    <prop v="solid" k="outline_style"/>
                    <prop v="0" k="outline_width"/>
                    <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
                    <prop v="MM" k="outline_width_unit"/>
                    <prop v="diameter" k="scale_method"/>
                    <prop v="2" k="size"/>
                    <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
                    <prop v="MM" k="size_unit"/>
                    <prop v="1" k="vertical_anchor_point"/>
                    <data_defined_properties>
                      <Option type="Map">
                        <Option name="name" value="" type="QString"/>
                        <Option name="properties"/>
                        <Option name="type" value="collection" type="QString"/>
                      </Option>
                    </data_defined_properties>
                  </layer>
                </symbol>
              </background>
              <shadow shadowUnder="0" shadowOffsetUnit="MM" shadowRadius="1.5" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowDraw="0" shadowOffsetGlobal="1" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowColor="0,0,0,255" shadowBlendMode="6" shadowOffsetAngle="135" shadowOffsetDist="1" shadowRadiusAlphaOnly="0" shadowScale="100" shadowRadiusUnit="MM" shadowOpacity="0.7"/>
              <dd_properties>
                <Option type="Map">
                  <Option name="name" value="" type="QString"/>
                  <Option name="properties"/>
                  <Option name="type" value="collection" type="QString"/>
                </Option>
              </dd_properties>
              <substitutions/>
            </text-style>
            <text-format addDirectionSymbol="0" reverseDirectionSymbol="0" leftDirectionSymbol="&lt;" decimals="3" wrapChar="" multilineAlign="0" autoWrapLength="0" formatNumbers="0" plussign="0" useMaxLineLengthForAutoWrap="1" rightDirectionSymbol=">" placeDirectionSymbol="0"/>
            <placement maxCurvedCharAngleOut="-25" overrunDistanceUnit="MM" maxCurvedCharAngleIn="25" repeatDistanceUnits="RenderMetersInMapUnits" preserveRotation="1" distUnits="MM" overrunDistance="0" layerType="LineGeometry" geometryGenerator="" geometryGeneratorType="PointGeometry" placementFlags="9" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" quadOffset="4" repeatDistance="400" priority="5" distMapUnitScale="3x:0,0,0,0,0,0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="3" centroidInside="0" offsetType="0" offsetUnits="MM" dist="0" yOffset="0" geometryGeneratorEnabled="0" rotationAngle="0" fitInPolygonOnly="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" xOffset="0" centroidWhole="0"/>
            <rendering fontMaxPixelSize="10000" mergeLines="1" limitNumLabels="0" obstacle="1" scaleVisibility="0" labelPerPart="0" obstacleFactor="1" drawLabels="1" minFeatureSize="5" scaleMax="0" obstacleType="1" fontLimitPixelSize="0" maxNumLabels="2000" zIndex="0" fontMinPixelSize="3" scaleMin="0" upsidedownLabels="0" displayAll="0"/>
            <dd_properties>
              <Option type="Map">
                <Option name="name" value="" type="QString"/>
                <Option name="properties"/>
                <Option name="type" value="collection" type="QString"/>
              </Option>
            </dd_properties>
            <callout type="simple">
              <Option type="Map">
                <Option name="anchorPoint" value="pole_of_inaccessibility" type="QString"/>
                <Option name="ddProperties" type="Map">
                  <Option name="name" value="" type="QString"/>
                  <Option name="properties"/>
                  <Option name="type" value="collection" type="QString"/>
                </Option>
                <Option name="drawToAllParts" value="false" type="bool"/>
                <Option name="enabled" value="0" type="QString"/>
                <Option name="lineSymbol" value="&lt;symbol name=&quot;symbol&quot; type=&quot;line&quot; force_rhr=&quot;0&quot; alpha=&quot;1&quot; clip_to_extent=&quot;1&quot;>&lt;layer enabled=&quot;1&quot; pass=&quot;0&quot; class=&quot;SimpleLine&quot; locked=&quot;0&quot;>&lt;prop v=&quot;square&quot; k=&quot;capstyle&quot;/>&lt;prop v=&quot;5;2&quot; k=&quot;customdash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;customdash_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;customdash_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;draw_inside_polygon&quot;/>&lt;prop v=&quot;bevel&quot; k=&quot;joinstyle&quot;/>&lt;prop v=&quot;60,60,60,255&quot; k=&quot;line_color&quot;/>&lt;prop v=&quot;solid&quot; k=&quot;line_style&quot;/>&lt;prop v=&quot;0.3&quot; k=&quot;line_width&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;line_width_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;offset&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;offset_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;offset_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;ring_filter&quot;/>&lt;prop v=&quot;0&quot; k=&quot;use_custom_dash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;width_map_unit_scale&quot;/>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; value=&quot;&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; value=&quot;collection&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString"/>
                <Option name="minLength" value="0" type="double"/>
                <Option name="minLengthMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
                <Option name="minLengthUnit" value="MM" type="QString"/>
                <Option name="offsetFromAnchor" value="0" type="double"/>
                <Option name="offsetFromAnchorMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
                <Option name="offsetFromAnchorUnit" value="MM" type="QString"/>
                <Option name="offsetFromLabel" value="0" type="double"/>
                <Option name="offsetFromLabelMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
                <Option name="offsetFromLabelUnit" value="MM" type="QString"/>
              </Option>
            </callout>
          </settings>
        </rule>
      </rule>
      <rule key="{14d2fd6f-76ef-4b0d-bb14-63474b7bc1fc}" filter="&quot;NATURE&quot; = 'Route à 2 chaussées'" scalemindenom="1" scalemaxdenom="100001" description="Route à 2 chaussées">
        <rule key="{3c8831b1-b2f5-4b16-b913-9dba157b7854}" filter="ELSE" scalemindenom="1" scalemaxdenom="100001" description="Numéro">
          <settings calloutType="simple">
            <text-style fontStrikeout="0" fontKerning="1" blendMode="0" previewBkgrdColor="255,255,255,255" textOpacity="1" useSubstitutions="0" isExpression="0" fontItalic="0" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontCapitals="0" multilineHeight="1" fontSizeUnit="Point" fontUnderline="0" fontWordSpacing="0" textColor="0,0,0,255" fontWeight="50" fontSize="10" namedStyle="Regular" fieldName="NUMERO" fontFamily="Calibri" textOrientation="horizontal" fontLetterSpacing="0">
              <text-buffer bufferJoinStyle="128" bufferBlendMode="0" bufferSize="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferNoFill="1" bufferColor="255,255,255,255" bufferSizeUnits="Point" bufferDraw="1" bufferOpacity="1"/>
              <background shapeFillColor="255,255,255,255" shapeBorderColor="128,128,128,255" shapeDraw="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeJoinStyle="64" shapeBlendMode="0" shapeSizeUnit="MM" shapeRotation="0" shapeOffsetY="0" shapeOffsetX="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetUnit="MM" shapeRadiiX="0" shapeSizeY="0" shapeBorderWidth="0" shapeRadiiUnit="MM" shapeOpacity="1" shapeRadiiY="0" shapeRotationType="0" shapeSizeType="0" shapeSVGFile="" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthUnit="MM" shapeType="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeSizeX="0">
                <symbol name="markerSymbol" type="marker" force_rhr="0" alpha="1" clip_to_extent="1">
                  <layer enabled="1" pass="0" class="SimpleMarker" locked="0">
                    <prop v="0" k="angle"/>
                    <prop v="225,89,137,255" k="color"/>
                    <prop v="1" k="horizontal_anchor_point"/>
                    <prop v="bevel" k="joinstyle"/>
                    <prop v="circle" k="name"/>
                    <prop v="0,0" k="offset"/>
                    <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
                    <prop v="MM" k="offset_unit"/>
                    <prop v="35,35,35,255" k="outline_color"/>
                    <prop v="solid" k="outline_style"/>
                    <prop v="0" k="outline_width"/>
                    <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
                    <prop v="MM" k="outline_width_unit"/>
                    <prop v="diameter" k="scale_method"/>
                    <prop v="2" k="size"/>
                    <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
                    <prop v="MM" k="size_unit"/>
                    <prop v="1" k="vertical_anchor_point"/>
                    <data_defined_properties>
                      <Option type="Map">
                        <Option name="name" value="" type="QString"/>
                        <Option name="properties"/>
                        <Option name="type" value="collection" type="QString"/>
                      </Option>
                    </data_defined_properties>
                  </layer>
                </symbol>
              </background>
              <shadow shadowUnder="0" shadowOffsetUnit="MM" shadowRadius="1.5" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowDraw="0" shadowOffsetGlobal="1" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowColor="0,0,0,255" shadowBlendMode="6" shadowOffsetAngle="135" shadowOffsetDist="1" shadowRadiusAlphaOnly="0" shadowScale="100" shadowRadiusUnit="MM" shadowOpacity="0.7"/>
              <dd_properties>
                <Option type="Map">
                  <Option name="name" value="" type="QString"/>
                  <Option name="properties"/>
                  <Option name="type" value="collection" type="QString"/>
                </Option>
              </dd_properties>
              <substitutions/>
            </text-style>
            <text-format addDirectionSymbol="0" reverseDirectionSymbol="0" leftDirectionSymbol="&lt;" decimals="3" wrapChar="" multilineAlign="0" autoWrapLength="0" formatNumbers="0" plussign="0" useMaxLineLengthForAutoWrap="1" rightDirectionSymbol=">" placeDirectionSymbol="0"/>
            <placement maxCurvedCharAngleOut="-25" overrunDistanceUnit="MM" maxCurvedCharAngleIn="25" repeatDistanceUnits="MM" preserveRotation="1" distUnits="MM" overrunDistance="0" layerType="LineGeometry" geometryGenerator="" geometryGeneratorType="PointGeometry" placementFlags="10" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" quadOffset="4" repeatDistance="0" priority="5" distMapUnitScale="3x:0,0,0,0,0,0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="3" centroidInside="0" offsetType="0" offsetUnits="MM" dist="0" yOffset="0" geometryGeneratorEnabled="0" rotationAngle="0" fitInPolygonOnly="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" xOffset="0" centroidWhole="0"/>
            <rendering fontMaxPixelSize="10000" mergeLines="1" limitNumLabels="0" obstacle="1" scaleVisibility="0" labelPerPart="0" obstacleFactor="1" drawLabels="1" minFeatureSize="5" scaleMax="0" obstacleType="1" fontLimitPixelSize="0" maxNumLabels="2000" zIndex="0" fontMinPixelSize="3" scaleMin="0" upsidedownLabels="0" displayAll="0"/>
            <dd_properties>
              <Option type="Map">
                <Option name="name" value="" type="QString"/>
                <Option name="properties"/>
                <Option name="type" value="collection" type="QString"/>
              </Option>
            </dd_properties>
            <callout type="simple">
              <Option type="Map">
                <Option name="anchorPoint" value="pole_of_inaccessibility" type="QString"/>
                <Option name="ddProperties" type="Map">
                  <Option name="name" value="" type="QString"/>
                  <Option name="properties"/>
                  <Option name="type" value="collection" type="QString"/>
                </Option>
                <Option name="drawToAllParts" value="false" type="bool"/>
                <Option name="enabled" value="0" type="QString"/>
                <Option name="lineSymbol" value="&lt;symbol name=&quot;symbol&quot; type=&quot;line&quot; force_rhr=&quot;0&quot; alpha=&quot;1&quot; clip_to_extent=&quot;1&quot;>&lt;layer enabled=&quot;1&quot; pass=&quot;0&quot; class=&quot;SimpleLine&quot; locked=&quot;0&quot;>&lt;prop v=&quot;square&quot; k=&quot;capstyle&quot;/>&lt;prop v=&quot;5;2&quot; k=&quot;customdash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;customdash_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;customdash_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;draw_inside_polygon&quot;/>&lt;prop v=&quot;bevel&quot; k=&quot;joinstyle&quot;/>&lt;prop v=&quot;60,60,60,255&quot; k=&quot;line_color&quot;/>&lt;prop v=&quot;solid&quot; k=&quot;line_style&quot;/>&lt;prop v=&quot;0.3&quot; k=&quot;line_width&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;line_width_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;offset&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;offset_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;offset_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;ring_filter&quot;/>&lt;prop v=&quot;0&quot; k=&quot;use_custom_dash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;width_map_unit_scale&quot;/>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; value=&quot;&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; value=&quot;collection&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString"/>
                <Option name="minLength" value="0" type="double"/>
                <Option name="minLengthMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
                <Option name="minLengthUnit" value="MM" type="QString"/>
                <Option name="offsetFromAnchor" value="0" type="double"/>
                <Option name="offsetFromAnchorMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
                <Option name="offsetFromAnchorUnit" value="MM" type="QString"/>
                <Option name="offsetFromLabel" value="0" type="double"/>
                <Option name="offsetFromLabelMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
                <Option name="offsetFromLabelUnit" value="MM" type="QString"/>
              </Option>
            </callout>
          </settings>
        </rule>
        <rule key="{50eb4416-89d6-4aee-9e78-ca7685e9cea9}" filter="ELSE" scalemindenom="1" scalemaxdenom="3001" description="Odonyme">
          <settings calloutType="simple">
            <text-style fontStrikeout="0" fontKerning="1" blendMode="0" previewBkgrdColor="255,255,255,255" textOpacity="1" useSubstitutions="0" isExpression="0" fontItalic="0" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontCapitals="0" multilineHeight="1" fontSizeUnit="Point" fontUnderline="0" fontWordSpacing="0" textColor="0,0,0,255" fontWeight="50" fontSize="8" namedStyle="Regular" fieldName="NOM_BAN_G" fontFamily="Calibri" textOrientation="horizontal" fontLetterSpacing="0">
              <text-buffer bufferJoinStyle="128" bufferBlendMode="0" bufferSize="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferNoFill="1" bufferColor="255,255,255,255" bufferSizeUnits="Point" bufferDraw="1" bufferOpacity="1"/>
              <background shapeFillColor="255,255,255,255" shapeBorderColor="128,128,128,255" shapeDraw="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeJoinStyle="64" shapeBlendMode="0" shapeSizeUnit="MM" shapeRotation="0" shapeOffsetY="0" shapeOffsetX="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetUnit="MM" shapeRadiiX="0" shapeSizeY="0" shapeBorderWidth="0" shapeRadiiUnit="MM" shapeOpacity="1" shapeRadiiY="0" shapeRotationType="0" shapeSizeType="0" shapeSVGFile="" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthUnit="MM" shapeType="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeSizeX="0">
                <symbol name="markerSymbol" type="marker" force_rhr="0" alpha="1" clip_to_extent="1">
                  <layer enabled="1" pass="0" class="SimpleMarker" locked="0">
                    <prop v="0" k="angle"/>
                    <prop v="225,89,137,255" k="color"/>
                    <prop v="1" k="horizontal_anchor_point"/>
                    <prop v="bevel" k="joinstyle"/>
                    <prop v="circle" k="name"/>
                    <prop v="0,0" k="offset"/>
                    <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
                    <prop v="MM" k="offset_unit"/>
                    <prop v="35,35,35,255" k="outline_color"/>
                    <prop v="solid" k="outline_style"/>
                    <prop v="0" k="outline_width"/>
                    <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
                    <prop v="MM" k="outline_width_unit"/>
                    <prop v="diameter" k="scale_method"/>
                    <prop v="2" k="size"/>
                    <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
                    <prop v="MM" k="size_unit"/>
                    <prop v="1" k="vertical_anchor_point"/>
                    <data_defined_properties>
                      <Option type="Map">
                        <Option name="name" value="" type="QString"/>
                        <Option name="properties"/>
                        <Option name="type" value="collection" type="QString"/>
                      </Option>
                    </data_defined_properties>
                  </layer>
                </symbol>
              </background>
              <shadow shadowUnder="0" shadowOffsetUnit="MM" shadowRadius="1.5" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowDraw="0" shadowOffsetGlobal="1" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowColor="0,0,0,255" shadowBlendMode="6" shadowOffsetAngle="135" shadowOffsetDist="1" shadowRadiusAlphaOnly="0" shadowScale="100" shadowRadiusUnit="MM" shadowOpacity="0.7"/>
              <dd_properties>
                <Option type="Map">
                  <Option name="name" value="" type="QString"/>
                  <Option name="properties"/>
                  <Option name="type" value="collection" type="QString"/>
                </Option>
              </dd_properties>
              <substitutions/>
            </text-style>
            <text-format addDirectionSymbol="0" reverseDirectionSymbol="0" leftDirectionSymbol="&lt;" decimals="3" wrapChar="" multilineAlign="0" autoWrapLength="0" formatNumbers="0" plussign="0" useMaxLineLengthForAutoWrap="1" rightDirectionSymbol=">" placeDirectionSymbol="0"/>
            <placement maxCurvedCharAngleOut="-25" overrunDistanceUnit="MM" maxCurvedCharAngleIn="25" repeatDistanceUnits="RenderMetersInMapUnits" preserveRotation="1" distUnits="MM" overrunDistance="0" layerType="LineGeometry" geometryGenerator="" geometryGeneratorType="PointGeometry" placementFlags="9" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" quadOffset="4" repeatDistance="400" priority="5" distMapUnitScale="3x:0,0,0,0,0,0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="3" centroidInside="0" offsetType="0" offsetUnits="MM" dist="0" yOffset="0" geometryGeneratorEnabled="0" rotationAngle="0" fitInPolygonOnly="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" xOffset="0" centroidWhole="0"/>
            <rendering fontMaxPixelSize="10000" mergeLines="1" limitNumLabels="0" obstacle="1" scaleVisibility="0" labelPerPart="0" obstacleFactor="1" drawLabels="1" minFeatureSize="5" scaleMax="0" obstacleType="1" fontLimitPixelSize="0" maxNumLabels="2000" zIndex="0" fontMinPixelSize="3" scaleMin="0" upsidedownLabels="0" displayAll="0"/>
            <dd_properties>
              <Option type="Map">
                <Option name="name" value="" type="QString"/>
                <Option name="properties"/>
                <Option name="type" value="collection" type="QString"/>
              </Option>
            </dd_properties>
            <callout type="simple">
              <Option type="Map">
                <Option name="anchorPoint" value="pole_of_inaccessibility" type="QString"/>
                <Option name="ddProperties" type="Map">
                  <Option name="name" value="" type="QString"/>
                  <Option name="properties"/>
                  <Option name="type" value="collection" type="QString"/>
                </Option>
                <Option name="drawToAllParts" value="false" type="bool"/>
                <Option name="enabled" value="0" type="QString"/>
                <Option name="lineSymbol" value="&lt;symbol name=&quot;symbol&quot; type=&quot;line&quot; force_rhr=&quot;0&quot; alpha=&quot;1&quot; clip_to_extent=&quot;1&quot;>&lt;layer enabled=&quot;1&quot; pass=&quot;0&quot; class=&quot;SimpleLine&quot; locked=&quot;0&quot;>&lt;prop v=&quot;square&quot; k=&quot;capstyle&quot;/>&lt;prop v=&quot;5;2&quot; k=&quot;customdash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;customdash_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;customdash_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;draw_inside_polygon&quot;/>&lt;prop v=&quot;bevel&quot; k=&quot;joinstyle&quot;/>&lt;prop v=&quot;60,60,60,255&quot; k=&quot;line_color&quot;/>&lt;prop v=&quot;solid&quot; k=&quot;line_style&quot;/>&lt;prop v=&quot;0.3&quot; k=&quot;line_width&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;line_width_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;offset&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;offset_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;offset_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;ring_filter&quot;/>&lt;prop v=&quot;0&quot; k=&quot;use_custom_dash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;width_map_unit_scale&quot;/>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; value=&quot;&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; value=&quot;collection&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString"/>
                <Option name="minLength" value="0" type="double"/>
                <Option name="minLengthMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
                <Option name="minLengthUnit" value="MM" type="QString"/>
                <Option name="offsetFromAnchor" value="0" type="double"/>
                <Option name="offsetFromAnchorMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
                <Option name="offsetFromAnchorUnit" value="MM" type="QString"/>
                <Option name="offsetFromLabel" value="0" type="double"/>
                <Option name="offsetFromLabelMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
                <Option name="offsetFromLabelUnit" value="MM" type="QString"/>
              </Option>
            </callout>
          </settings>
        </rule>
      </rule>
      <rule key="{0f17a227-234e-428d-af51-de0e011e4084}" filter="&quot;NATURE&quot; = 'Route empierrée'" scalemindenom="1" scalemaxdenom="100001" description="Route empierrée" active="0"/>
      <rule key="{408aa4f4-7868-4a96-899b-23ab5d13defd}" filter="&quot;NATURE&quot; = 'Sentier'" scalemindenom="1" scalemaxdenom="100001" description="Sentier" active="0"/>
      <rule key="{ef74d178-2b11-4dde-8780-60f278814d43}" filter="&quot;NATURE&quot; = 'Type autoroutier'" description="Type autoroutier">
        <rule key="{7ea87ca8-265e-471e-a710-fd3d65bacfc0}" filter="&quot;NATURE&quot; = 'Type autoroutier'" scalemindenom="1" scalemaxdenom="500001" description="Type autoroutier">
          <settings calloutType="simple">
            <text-style fontStrikeout="0" fontKerning="1" blendMode="0" previewBkgrdColor="255,255,255,255" textOpacity="1" useSubstitutions="0" isExpression="1" fontItalic="0" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontCapitals="0" multilineHeight="1" fontSizeUnit="Point" fontUnderline="0" fontWordSpacing="0" textColor="0,0,0,255" fontWeight="50" fontSize="11" namedStyle="Regular" fieldName="COALESCE( &quot;NUMERO&quot;,'')||' '||COALESCE(&quot;NUM_EUROP&quot;,'')" fontFamily="Calibri" textOrientation="horizontal" fontLetterSpacing="0">
              <text-buffer bufferJoinStyle="128" bufferBlendMode="0" bufferSize="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferNoFill="1" bufferColor="255,255,255,255" bufferSizeUnits="Point" bufferDraw="1" bufferOpacity="1"/>
              <background shapeFillColor="255,255,255,255" shapeBorderColor="128,128,128,255" shapeDraw="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeJoinStyle="64" shapeBlendMode="0" shapeSizeUnit="MM" shapeRotation="0" shapeOffsetY="0" shapeOffsetX="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetUnit="MM" shapeRadiiX="0" shapeSizeY="0" shapeBorderWidth="0" shapeRadiiUnit="MM" shapeOpacity="1" shapeRadiiY="0" shapeRotationType="0" shapeSizeType="0" shapeSVGFile="" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthUnit="MM" shapeType="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeSizeX="0">
                <symbol name="markerSymbol" type="marker" force_rhr="0" alpha="1" clip_to_extent="1">
                  <layer enabled="1" pass="0" class="SimpleMarker" locked="0">
                    <prop v="0" k="angle"/>
                    <prop v="229,182,54,255" k="color"/>
                    <prop v="1" k="horizontal_anchor_point"/>
                    <prop v="bevel" k="joinstyle"/>
                    <prop v="circle" k="name"/>
                    <prop v="0,0" k="offset"/>
                    <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
                    <prop v="MM" k="offset_unit"/>
                    <prop v="35,35,35,255" k="outline_color"/>
                    <prop v="solid" k="outline_style"/>
                    <prop v="0" k="outline_width"/>
                    <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
                    <prop v="MM" k="outline_width_unit"/>
                    <prop v="diameter" k="scale_method"/>
                    <prop v="2" k="size"/>
                    <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
                    <prop v="MM" k="size_unit"/>
                    <prop v="1" k="vertical_anchor_point"/>
                    <data_defined_properties>
                      <Option type="Map">
                        <Option name="name" value="" type="QString"/>
                        <Option name="properties"/>
                        <Option name="type" value="collection" type="QString"/>
                      </Option>
                    </data_defined_properties>
                  </layer>
                </symbol>
              </background>
              <shadow shadowUnder="0" shadowOffsetUnit="MM" shadowRadius="1.5" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowDraw="0" shadowOffsetGlobal="1" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowColor="0,0,0,255" shadowBlendMode="6" shadowOffsetAngle="135" shadowOffsetDist="1" shadowRadiusAlphaOnly="0" shadowScale="100" shadowRadiusUnit="MM" shadowOpacity="0.7"/>
              <dd_properties>
                <Option type="Map">
                  <Option name="name" value="" type="QString"/>
                  <Option name="properties"/>
                  <Option name="type" value="collection" type="QString"/>
                </Option>
              </dd_properties>
              <substitutions/>
            </text-style>
            <text-format addDirectionSymbol="0" reverseDirectionSymbol="0" leftDirectionSymbol="&lt;" decimals="3" wrapChar="" multilineAlign="0" autoWrapLength="0" formatNumbers="0" plussign="0" useMaxLineLengthForAutoWrap="1" rightDirectionSymbol=">" placeDirectionSymbol="0"/>
            <placement maxCurvedCharAngleOut="-25" overrunDistanceUnit="MM" maxCurvedCharAngleIn="25" repeatDistanceUnits="MM" preserveRotation="1" distUnits="Point" overrunDistance="0" layerType="LineGeometry" geometryGenerator="" geometryGeneratorType="PointGeometry" placementFlags="10" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" quadOffset="4" repeatDistance="1000" priority="5" distMapUnitScale="3x:0,0,0,0,0,0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="3" centroidInside="0" offsetType="0" offsetUnits="MM" dist="2" yOffset="0" geometryGeneratorEnabled="0" rotationAngle="0" fitInPolygonOnly="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" xOffset="0" centroidWhole="0"/>
            <rendering fontMaxPixelSize="10000" mergeLines="1" limitNumLabels="0" obstacle="0" scaleVisibility="0" labelPerPart="0" obstacleFactor="1" drawLabels="1" minFeatureSize="0" scaleMax="0" obstacleType="1" fontLimitPixelSize="0" maxNumLabels="100" zIndex="0" fontMinPixelSize="3" scaleMin="0" upsidedownLabels="0" displayAll="0"/>
            <dd_properties>
              <Option type="Map">
                <Option name="name" value="" type="QString"/>
                <Option name="properties"/>
                <Option name="type" value="collection" type="QString"/>
              </Option>
            </dd_properties>
            <callout type="simple">
              <Option type="Map">
                <Option name="anchorPoint" value="pole_of_inaccessibility" type="QString"/>
                <Option name="ddProperties" type="Map">
                  <Option name="name" value="" type="QString"/>
                  <Option name="properties"/>
                  <Option name="type" value="collection" type="QString"/>
                </Option>
                <Option name="drawToAllParts" value="false" type="bool"/>
                <Option name="enabled" value="0" type="QString"/>
                <Option name="lineSymbol" value="&lt;symbol name=&quot;symbol&quot; type=&quot;line&quot; force_rhr=&quot;0&quot; alpha=&quot;1&quot; clip_to_extent=&quot;1&quot;>&lt;layer enabled=&quot;1&quot; pass=&quot;0&quot; class=&quot;SimpleLine&quot; locked=&quot;0&quot;>&lt;prop v=&quot;square&quot; k=&quot;capstyle&quot;/>&lt;prop v=&quot;5;2&quot; k=&quot;customdash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;customdash_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;customdash_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;draw_inside_polygon&quot;/>&lt;prop v=&quot;bevel&quot; k=&quot;joinstyle&quot;/>&lt;prop v=&quot;60,60,60,255&quot; k=&quot;line_color&quot;/>&lt;prop v=&quot;solid&quot; k=&quot;line_style&quot;/>&lt;prop v=&quot;0.3&quot; k=&quot;line_width&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;line_width_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;offset&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;offset_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;offset_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;ring_filter&quot;/>&lt;prop v=&quot;0&quot; k=&quot;use_custom_dash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;width_map_unit_scale&quot;/>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; value=&quot;&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; value=&quot;collection&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString"/>
                <Option name="minLength" value="0" type="double"/>
                <Option name="minLengthMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
                <Option name="minLengthUnit" value="MM" type="QString"/>
                <Option name="offsetFromAnchor" value="0" type="double"/>
                <Option name="offsetFromAnchorMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
                <Option name="offsetFromAnchorUnit" value="MM" type="QString"/>
                <Option name="offsetFromLabel" value="0" type="double"/>
                <Option name="offsetFromLabelMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
                <Option name="offsetFromLabelUnit" value="MM" type="QString"/>
              </Option>
            </callout>
          </settings>
        </rule>
        <rule key="{550603ca-0040-4bad-9af0-e1438ed0db7a}" filter="&quot;NATURE&quot; = 'Type autoroutier'" scalemindenom="50001" scalemaxdenom="500001" description="Type autoroutier">
          <settings calloutType="simple">
            <text-style fontStrikeout="0" fontKerning="1" blendMode="0" previewBkgrdColor="255,255,255,255" textOpacity="1" useSubstitutions="0" isExpression="1" fontItalic="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontCapitals="0" multilineHeight="1" fontSizeUnit="Point" fontUnderline="0" fontWordSpacing="0" textColor="0,0,0,255" fontWeight="50" fontSize="11" namedStyle="Italic" fieldName="'                    '  || TOPONYME || '                    '" fontFamily="Calibri" textOrientation="horizontal" fontLetterSpacing="0">
              <text-buffer bufferJoinStyle="128" bufferBlendMode="0" bufferSize="1.5" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferNoFill="1" bufferColor="255,255,255,255" bufferSizeUnits="Point" bufferDraw="1" bufferOpacity="1"/>
              <background shapeFillColor="255,255,255,255" shapeBorderColor="128,128,128,255" shapeDraw="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeJoinStyle="64" shapeBlendMode="0" shapeSizeUnit="MM" shapeRotation="0" shapeOffsetY="0" shapeOffsetX="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetUnit="MM" shapeRadiiX="0" shapeSizeY="0" shapeBorderWidth="0" shapeRadiiUnit="MM" shapeOpacity="1" shapeRadiiY="0" shapeRotationType="0" shapeSizeType="0" shapeSVGFile="" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthUnit="MM" shapeType="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeSizeX="0">
                <symbol name="markerSymbol" type="marker" force_rhr="0" alpha="1" clip_to_extent="1">
                  <layer enabled="1" pass="0" class="SimpleMarker" locked="0">
                    <prop v="0" k="angle"/>
                    <prop v="229,182,54,255" k="color"/>
                    <prop v="1" k="horizontal_anchor_point"/>
                    <prop v="bevel" k="joinstyle"/>
                    <prop v="circle" k="name"/>
                    <prop v="0,0" k="offset"/>
                    <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
                    <prop v="MM" k="offset_unit"/>
                    <prop v="35,35,35,255" k="outline_color"/>
                    <prop v="solid" k="outline_style"/>
                    <prop v="0" k="outline_width"/>
                    <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
                    <prop v="MM" k="outline_width_unit"/>
                    <prop v="diameter" k="scale_method"/>
                    <prop v="2" k="size"/>
                    <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
                    <prop v="MM" k="size_unit"/>
                    <prop v="1" k="vertical_anchor_point"/>
                    <data_defined_properties>
                      <Option type="Map">
                        <Option name="name" value="" type="QString"/>
                        <Option name="properties"/>
                        <Option name="type" value="collection" type="QString"/>
                      </Option>
                    </data_defined_properties>
                  </layer>
                </symbol>
              </background>
              <shadow shadowUnder="0" shadowOffsetUnit="MM" shadowRadius="1.5" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowDraw="0" shadowOffsetGlobal="1" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowColor="0,0,0,255" shadowBlendMode="6" shadowOffsetAngle="135" shadowOffsetDist="1" shadowRadiusAlphaOnly="0" shadowScale="100" shadowRadiusUnit="MM" shadowOpacity="0.7"/>
              <dd_properties>
                <Option type="Map">
                  <Option name="name" value="" type="QString"/>
                  <Option name="properties"/>
                  <Option name="type" value="collection" type="QString"/>
                </Option>
              </dd_properties>
              <substitutions/>
            </text-style>
            <text-format addDirectionSymbol="0" reverseDirectionSymbol="0" leftDirectionSymbol="&lt;" decimals="3" wrapChar="" multilineAlign="0" autoWrapLength="0" formatNumbers="0" plussign="0" useMaxLineLengthForAutoWrap="1" rightDirectionSymbol=">" placeDirectionSymbol="0"/>
            <placement maxCurvedCharAngleOut="-25" overrunDistanceUnit="MM" maxCurvedCharAngleIn="25" repeatDistanceUnits="MM" preserveRotation="1" distUnits="Point" overrunDistance="0" layerType="LineGeometry" geometryGenerator="" geometryGeneratorType="PointGeometry" placementFlags="10" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" quadOffset="4" repeatDistance="500" priority="5" distMapUnitScale="3x:0,0,0,0,0,0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="3" centroidInside="0" offsetType="0" offsetUnits="MM" dist="2" yOffset="0" geometryGeneratorEnabled="0" rotationAngle="0" fitInPolygonOnly="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" xOffset="0" centroidWhole="0"/>
            <rendering fontMaxPixelSize="10000" mergeLines="1" limitNumLabels="0" obstacle="0" scaleVisibility="0" labelPerPart="0" obstacleFactor="1" drawLabels="1" minFeatureSize="0" scaleMax="0" obstacleType="1" fontLimitPixelSize="0" maxNumLabels="100" zIndex="0" fontMinPixelSize="3" scaleMin="0" upsidedownLabels="0" displayAll="0"/>
            <dd_properties>
              <Option type="Map">
                <Option name="name" value="" type="QString"/>
                <Option name="properties"/>
                <Option name="type" value="collection" type="QString"/>
              </Option>
            </dd_properties>
            <callout type="simple">
              <Option type="Map">
                <Option name="anchorPoint" value="pole_of_inaccessibility" type="QString"/>
                <Option name="ddProperties" type="Map">
                  <Option name="name" value="" type="QString"/>
                  <Option name="properties"/>
                  <Option name="type" value="collection" type="QString"/>
                </Option>
                <Option name="drawToAllParts" value="false" type="bool"/>
                <Option name="enabled" value="0" type="QString"/>
                <Option name="lineSymbol" value="&lt;symbol name=&quot;symbol&quot; type=&quot;line&quot; force_rhr=&quot;0&quot; alpha=&quot;1&quot; clip_to_extent=&quot;1&quot;>&lt;layer enabled=&quot;1&quot; pass=&quot;0&quot; class=&quot;SimpleLine&quot; locked=&quot;0&quot;>&lt;prop v=&quot;square&quot; k=&quot;capstyle&quot;/>&lt;prop v=&quot;5;2&quot; k=&quot;customdash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;customdash_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;customdash_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;draw_inside_polygon&quot;/>&lt;prop v=&quot;bevel&quot; k=&quot;joinstyle&quot;/>&lt;prop v=&quot;60,60,60,255&quot; k=&quot;line_color&quot;/>&lt;prop v=&quot;solid&quot; k=&quot;line_style&quot;/>&lt;prop v=&quot;0.3&quot; k=&quot;line_width&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;line_width_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;offset&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;offset_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;offset_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;ring_filter&quot;/>&lt;prop v=&quot;0&quot; k=&quot;use_custom_dash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;width_map_unit_scale&quot;/>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; value=&quot;&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; value=&quot;collection&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString"/>
                <Option name="minLength" value="0" type="double"/>
                <Option name="minLengthMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
                <Option name="minLengthUnit" value="MM" type="QString"/>
                <Option name="offsetFromAnchor" value="0" type="double"/>
                <Option name="offsetFromAnchorMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
                <Option name="offsetFromAnchorUnit" value="MM" type="QString"/>
                <Option name="offsetFromLabel" value="0" type="double"/>
                <Option name="offsetFromLabelMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
                <Option name="offsetFromLabelUnit" value="MM" type="QString"/>
              </Option>
            </callout>
          </settings>
        </rule>
      </rule>
    </rules>
  </labeling>
  <customproperties>
    <property key="dualview/previewExpressions">
      <value>COALESCE( "ID", '&lt;NULL>' )</value>
      <value>COALESCE( "ID", '&lt;NULL>' )</value>
      <value>COALESCE( "ID", '&lt;NULL>' )</value>
      <value>COALESCE( "ID", '&lt;NULL>' )</value>
      <value>COALESCE( "ID", '&lt;NULL>' )</value>
    </property>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <LinearlyInterpolatedDiagramRenderer upperValue="0" upperWidth="50" lowerValue="0" lowerWidth="0" attributeLegend="1" lowerHeight="0" diagramType="Histogram" classificationAttributeExpression="" upperHeight="50">
    <DiagramCategory penColor="#000000" rotationOffset="270" lineSizeScale="3x:0,0,0,0,0,0" sizeType="MM" enabled="0" lineSizeType="MM" backgroundAlpha="255" width="15" sizeScale="3x:0,0,0,0,0,0" penAlpha="255" backgroundColor="#ffffff" barWidth="5" scaleDependency="Area" scaleBasedVisibility="0" maxScaleDenominator="1e+08" penWidth="0" labelPlacementMethod="XHeight" minimumSize="0" minScaleDenominator="0" height="15" opacity="1" diagramOrientation="Up">
      <fontProperties style="" description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0"/>
      <attribute color="#000000" label="" field=""/>
    </DiagramCategory>
  </LinearlyInterpolatedDiagramRenderer>
  <DiagramLayerSettings showAll="1" linePlacementFlags="2" zIndex="0" obstacle="0" placement="2" dist="0" priority="0">
    <properties>
      <Option type="Map">
        <Option name="name" value="" type="QString"/>
        <Option name="properties" type="Map">
          <Option name="show" type="Map">
            <Option name="active" value="true" type="bool"/>
            <Option name="field" value="DELESTAGE" type="QString"/>
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
  <attributetableconfig sortExpression="&quot;NATURE&quot;" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column name="DELESTAGE" type="field" width="-1" hidden="0"/>
      <column name="SRC_BAN_G" type="field" width="-1" hidden="0"/>
      <column name="SRC_BAN_D" type="field" width="-1" hidden="0"/>
      <column name="NOM_BAN_G" type="field" width="-1" hidden="0"/>
      <column name="NOM_BAN_D" type="field" width="-1" hidden="0"/>
      <column name="LD_BAN_G" type="field" width="-1" hidden="0"/>
      <column name="LD_BAN_D" type="field" width="-1" hidden="0"/>
      <column name="ID_BAN_G" type="field" width="-1" hidden="0"/>
      <column name="ID_BAN_D" type="field" width="-1" hidden="0"/>
      <column name="NOM_ITI" type="field" width="-1" hidden="0"/>
      <column name="NATURE_ITI" type="field" width="-1" hidden="0"/>
      <column name="VOIE_VERTE" type="field" width="-1" hidden="0"/>
      <column name="ITI_CYCL" type="field" width="-1" hidden="0"/>
      <column name="TOPONYME" type="field" width="-1" hidden="0"/>
      <column name="GESTION" type="field" width="-1" hidden="0"/>
      <column name="CL_ADMIN" type="field" width="-1" hidden="0"/>
      <column name="NUM_EUROP" type="field" width="-1" hidden="0"/>
      <column name="NUMERO" type="field" width="-1" hidden="0"/>
      <column name="ID_ITI" type="field" width="-1" hidden="0"/>
      <column name="ID_RN" type="field" width="-1" hidden="0"/>
      <column name="ID_VOIE_D" type="field" width="-1" hidden="0"/>
      <column name="ID_VOIE_G" type="field" width="-1" hidden="0"/>
      <column name="DATE_SERV" type="field" width="-1" hidden="0"/>
      <column name="ALIAS_D" type="field" width="-1" hidden="0"/>
      <column name="ALIAS_G" type="field" width="-1" hidden="0"/>
      <column name="INSEECOM_D" type="field" width="-1" hidden="0"/>
      <column name="INSEECOM_G" type="field" width="-1" hidden="0"/>
      <column name="BORNEFIN_D" type="field" width="-1" hidden="0"/>
      <column name="BORNEFIN_G" type="field" width="-1" hidden="0"/>
      <column name="BORNEDEB_D" type="field" width="-1" hidden="0"/>
      <column name="BORNEDEB_G" type="field" width="-1" hidden="0"/>
      <column name="RESTR_MAT" type="field" width="-1" hidden="0"/>
      <column name="RESTR_LON" type="field" width="-1" hidden="0"/>
      <column name="RESTR_LAR" type="field" width="-1" hidden="0"/>
      <column name="RESTR_PPE" type="field" width="-1" hidden="0"/>
      <column name="RESTR_P" type="field" width="-1" hidden="0"/>
      <column name="RESTR_H" type="field" width="-1" hidden="0"/>
      <column name="NAT_RESTR" type="field" width="-1" hidden="0"/>
      <column name="SENS_CYC_G" type="field" width="-1" hidden="0"/>
      <column name="SENS_CYC_D" type="field" width="-1" hidden="0"/>
      <column name="CYCLABLE_G" type="field" width="-1" hidden="0"/>
      <column name="CYCLABLE_D" type="field" width="-1" hidden="0"/>
      <column name="FERMETURE" type="field" width="-1" hidden="0"/>
      <column name="ACCES_PED" type="field" width="-1" hidden="0"/>
      <column name="ACCES_VL" type="field" width="-1" hidden="0"/>
      <column name="VIT_MOY_VL" type="field" width="-1" hidden="0"/>
      <column name="URBAIN" type="field" width="-1" hidden="0"/>
      <column name="BUS" type="field" width="-1" hidden="0"/>
      <column name="SENS" type="field" width="-1" hidden="0"/>
      <column name="PRIVE" type="field" width="-1" hidden="0"/>
      <column name="IT_VERT" type="field" width="-1" hidden="0"/>
      <column name="LARGEUR" type="field" width="-1" hidden="0"/>
      <column name="NB_VOIES" type="field" width="-1" hidden="0"/>
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
      <column name="IMPORTANCE" type="field" width="-1" hidden="0"/>
      <column name="NOM_COLL_D" type="field" width="-1" hidden="0"/>
      <column name="NOM_COLL_G" type="field" width="-1" hidden="0"/>
      <column name="NATURE" type="field" width="-1" hidden="0"/>
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
    <field name="ACCES_PED" editable="1"/>
    <field name="ACCES_VL" editable="1"/>
    <field name="ACQU_ALTI" editable="1"/>
    <field name="ACQU_PLANI" editable="1"/>
    <field name="ALIAS_D" editable="1"/>
    <field name="ALIAS_G" editable="1"/>
    <field name="BORNEDEB_D" editable="1"/>
    <field name="BORNEDEB_G" editable="1"/>
    <field name="BORNEFIN_D" editable="1"/>
    <field name="BORNEFIN_G" editable="1"/>
    <field name="BUS" editable="1"/>
    <field name="CL_ADMIN" editable="1"/>
    <field name="CYCLABLE_D" editable="1"/>
    <field name="CYCLABLE_G" editable="1"/>
    <field name="DATE_APP" editable="1"/>
    <field name="DATE_CONF" editable="1"/>
    <field name="DATE_CREAT" editable="1"/>
    <field name="DATE_MAJ" editable="1"/>
    <field name="DATE_SERV" editable="1"/>
    <field name="DELESTAGE" editable="1"/>
    <field name="ETAT" editable="1"/>
    <field name="FERMETURE" editable="1"/>
    <field name="FICTIF" editable="1"/>
    <field name="GESTION" editable="1"/>
    <field name="ID" editable="1"/>
    <field name="ID_BAN_D" editable="1"/>
    <field name="ID_BAN_G" editable="1"/>
    <field name="ID_ITI" editable="1"/>
    <field name="ID_RN" editable="1"/>
    <field name="ID_SOURCE" editable="1"/>
    <field name="ID_VOIE_D" editable="1"/>
    <field name="ID_VOIE_G" editable="1"/>
    <field name="IMPORTANCE" editable="1"/>
    <field name="INSEECOM_D" editable="1"/>
    <field name="INSEECOM_G" editable="1"/>
    <field name="ITI_CYCL" editable="1"/>
    <field name="IT_VERT" editable="1"/>
    <field name="LARGEUR" editable="1"/>
    <field name="LD_BAN_D" editable="1"/>
    <field name="LD_BAN_G" editable="1"/>
    <field name="NATURE" editable="1"/>
    <field name="NATURE_ITI" editable="1"/>
    <field name="NAT_RESTR" editable="1"/>
    <field name="NB_VOIES" editable="1"/>
    <field name="NOM_BAN_D" editable="1"/>
    <field name="NOM_BAN_G" editable="1"/>
    <field name="NOM_COLL_D" editable="1"/>
    <field name="NOM_COLL_G" editable="1"/>
    <field name="NOM_ITI" editable="1"/>
    <field name="NUMERO" editable="1"/>
    <field name="NUM_EUROP" editable="1"/>
    <field name="POS_SOL" editable="1"/>
    <field name="PREC_ALTI" editable="1"/>
    <field name="PREC_PLANI" editable="1"/>
    <field name="PRIVE" editable="1"/>
    <field name="RESTR_H" editable="1"/>
    <field name="RESTR_LAR" editable="1"/>
    <field name="RESTR_LON" editable="1"/>
    <field name="RESTR_MAT" editable="1"/>
    <field name="RESTR_P" editable="1"/>
    <field name="RESTR_PPE" editable="1"/>
    <field name="SENS" editable="1"/>
    <field name="SENS_CYC_D" editable="1"/>
    <field name="SENS_CYC_G" editable="1"/>
    <field name="SOURCE" editable="1"/>
    <field name="SRC_BAN_D" editable="1"/>
    <field name="SRC_BAN_G" editable="1"/>
    <field name="TOPONYME" editable="1"/>
    <field name="URBAIN" editable="1"/>
    <field name="VIT_MOY_VL" editable="1"/>
    <field name="VOIE_VERTE" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="ACCES_PED" labelOnTop="0"/>
    <field name="ACCES_VL" labelOnTop="0"/>
    <field name="ACQU_ALTI" labelOnTop="0"/>
    <field name="ACQU_PLANI" labelOnTop="0"/>
    <field name="ALIAS_D" labelOnTop="0"/>
    <field name="ALIAS_G" labelOnTop="0"/>
    <field name="BORNEDEB_D" labelOnTop="0"/>
    <field name="BORNEDEB_G" labelOnTop="0"/>
    <field name="BORNEFIN_D" labelOnTop="0"/>
    <field name="BORNEFIN_G" labelOnTop="0"/>
    <field name="BUS" labelOnTop="0"/>
    <field name="CL_ADMIN" labelOnTop="0"/>
    <field name="CYCLABLE_D" labelOnTop="0"/>
    <field name="CYCLABLE_G" labelOnTop="0"/>
    <field name="DATE_APP" labelOnTop="0"/>
    <field name="DATE_CONF" labelOnTop="0"/>
    <field name="DATE_CREAT" labelOnTop="0"/>
    <field name="DATE_MAJ" labelOnTop="0"/>
    <field name="DATE_SERV" labelOnTop="0"/>
    <field name="DELESTAGE" labelOnTop="0"/>
    <field name="ETAT" labelOnTop="0"/>
    <field name="FERMETURE" labelOnTop="0"/>
    <field name="FICTIF" labelOnTop="0"/>
    <field name="GESTION" labelOnTop="0"/>
    <field name="ID" labelOnTop="0"/>
    <field name="ID_BAN_D" labelOnTop="0"/>
    <field name="ID_BAN_G" labelOnTop="0"/>
    <field name="ID_ITI" labelOnTop="0"/>
    <field name="ID_RN" labelOnTop="0"/>
    <field name="ID_SOURCE" labelOnTop="0"/>
    <field name="ID_VOIE_D" labelOnTop="0"/>
    <field name="ID_VOIE_G" labelOnTop="0"/>
    <field name="IMPORTANCE" labelOnTop="0"/>
    <field name="INSEECOM_D" labelOnTop="0"/>
    <field name="INSEECOM_G" labelOnTop="0"/>
    <field name="ITI_CYCL" labelOnTop="0"/>
    <field name="IT_VERT" labelOnTop="0"/>
    <field name="LARGEUR" labelOnTop="0"/>
    <field name="LD_BAN_D" labelOnTop="0"/>
    <field name="LD_BAN_G" labelOnTop="0"/>
    <field name="NATURE" labelOnTop="0"/>
    <field name="NATURE_ITI" labelOnTop="0"/>
    <field name="NAT_RESTR" labelOnTop="0"/>
    <field name="NB_VOIES" labelOnTop="0"/>
    <field name="NOM_BAN_D" labelOnTop="0"/>
    <field name="NOM_BAN_G" labelOnTop="0"/>
    <field name="NOM_COLL_D" labelOnTop="0"/>
    <field name="NOM_COLL_G" labelOnTop="0"/>
    <field name="NOM_ITI" labelOnTop="0"/>
    <field name="NUMERO" labelOnTop="0"/>
    <field name="NUM_EUROP" labelOnTop="0"/>
    <field name="POS_SOL" labelOnTop="0"/>
    <field name="PREC_ALTI" labelOnTop="0"/>
    <field name="PREC_PLANI" labelOnTop="0"/>
    <field name="PRIVE" labelOnTop="0"/>
    <field name="RESTR_H" labelOnTop="0"/>
    <field name="RESTR_LAR" labelOnTop="0"/>
    <field name="RESTR_LON" labelOnTop="0"/>
    <field name="RESTR_MAT" labelOnTop="0"/>
    <field name="RESTR_P" labelOnTop="0"/>
    <field name="RESTR_PPE" labelOnTop="0"/>
    <field name="SENS" labelOnTop="0"/>
    <field name="SENS_CYC_D" labelOnTop="0"/>
    <field name="SENS_CYC_G" labelOnTop="0"/>
    <field name="SOURCE" labelOnTop="0"/>
    <field name="SRC_BAN_D" labelOnTop="0"/>
    <field name="SRC_BAN_G" labelOnTop="0"/>
    <field name="TOPONYME" labelOnTop="0"/>
    <field name="URBAIN" labelOnTop="0"/>
    <field name="VIT_MOY_VL" labelOnTop="0"/>
    <field name="VOIE_VERTE" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>COALESCE( "ID", '&lt;NULL>' )</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
