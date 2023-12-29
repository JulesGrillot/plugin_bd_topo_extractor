# Roadmap

## Multiple geometry column 
Some WFS service has multiple geometry column name.
Add `*` as variable in `metadata.txt` when it's the case.
You can also add `*` when you don't know the geometry column name.

Here is the code I have so far to get geometry column name from WFS service :
```python
CODE
```

### Difficulty
The integration of multiple QgsNetworkRequest makes the plugin unstable.
They need to be asynchronous so the extraction doesn't start until the geometry column name is fetched.

## Multiple crs
Same way a WFS service can have different CRS for different layer.

Here is the code I have so far :
```python
CODE
```


## Multiple schema
Same way a WFS service can have different schema for different layer.

Here is the code I have so far :
```python
CODE
```
