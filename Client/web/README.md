# OpenGrid Web Client

This is the web-based frontend for the OpenGrid project, built with React, MapLibre GL JS, and OpenLayers.

## Prerequisites

- Node.js 16+
- npm or yarn

## Getting Started

1. Install dependencies:
   ```bash
   npm install
   # or
   yarn install
   ```

2. Create a `.env` file in the `client/web` directory:
   ```
   REACT_APP_API_URL=http://localhost:8000/api/v1
   REACT_APP_MAPBOX_ACCESS_TOKEN=your-mapbox-token-here
   ```

3. Start the development server:
   ```bash
   npm start
   # or
   yarn start
   ```

4. Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

## Project Structure

```
src/
├── components/       # Reusable UI components
│   ├── Map/         # Map component
│   ├── Sidebar/     # Sidebar component
│   ├── Toolbar/     # Toolbar with actions
│   └── common/      # Common UI components
├── hooks/           # Custom React hooks
├── services/        # API service layer
├── store/           # State management
├── types/           # TypeScript type definitions
├── utils/           # Utility functions
├── App.tsx          # Main application component
└── index.tsx        # Application entry point
```

## Available Scripts

- `npm start` or `yarn start`: Start the development server
- `npm test` or `yarn test`: Run tests
- `npm run build` or `yarn build`: Build for production
- `npm run lint` or `yarn lint`: Run linter
- `npm run format` or `yarn format`: Format code

## Development

### Adding Dependencies

Use npm or yarn to add new dependencies:

```bash
npm install package-name
# or
yarn add package-name
```

### Styling

This project uses [Tailwind CSS](https://tailwindcss.com/) for styling. You can find the configuration in `tailwind.config.js`.

### Environment Variables

- `REACT_APP_API_URL`: Base URL for the API
- `REACT_APP_MAPBOX_ACCESS_TOKEN`: Mapbox access token for map tiles

## Deployment

To create a production build:

```bash
npm run build
# or
yarn build
```

This will create an optimized production build in the `build` directory.

## License

[Your License Here]
