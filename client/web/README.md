# OpenGrid Web Client

This is the web-based frontend for the OpenGrid project, built with vanilla JavaScript, MapLibre GL JS, and OpenLayers.

## Features

- Interactive map visualization using MapLibre GL JS
- Toggle between MapLibre and OpenLayers
- Responsive design
- No build step required
- Works in any modern browser

## Getting Started

1. **Prerequisites**
   - Modern web browser (Chrome, Firefox, Safari, or Edge)
   - (Optional) A local web server for development (e.g., Python's http.server)

2. **Quick Start**
   Simply open `index.html` in your web browser to run the application.

3. **Development**
   - Edit `app.js` for application logic
   - Modify `styles.css` for custom styling
   - Update `index.html` for structural changes

4. **Using a Local Server (Optional)**
   ```bash
   # Python 3
   python -m http.server 8000 --directory /path/to/client/web
   
   # Then open http://localhost:8000 in your browser
   ```

## Project Structure

```
client/web/
├── index.html      # Main HTML file
├── app.js          # Application logic
└── styles.css      # Styling
```

## Dependencies

- MapLibre GL JS (loaded via CDN)
- OpenLayers (loaded via CDN)

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

## Development

### Adding New Features
1. Add new JavaScript functionality in `app.js`
2. Style new components in `styles.css`
3. Update the UI in `index.html` as needed

### Customization
- To change map styles, modify the style URLs in `index.html`
- Update colors and layout in `styles.css`
- Add new map layers and controls in `app.js`

## License

[Your License Here]
