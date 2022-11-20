import React from 'react';
import { ThemeProvider } from 'theme-ui';
import theme from 'theme';
import SEO from 'components/seo';
import Layout from 'components/layout';
import Banner from 'sections/banner';
// import Services from 'sections/services';
// import UltimateFeatures from 'sections/ultimate-feature';
// import Faq from 'sections/faq';

export default function IndexPage() {
  return (
    <ThemeProvider theme={theme}>
      <Layout>
        <SEO
          title="DEAL-LOCK - Time Lock Storage deals"
          description="Time Lock Storage deals on IPFS using Actors"
        />
        <Banner />
      </Layout>
    </ThemeProvider>
  );
}
