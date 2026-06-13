-- Create the submissions table for booking requests
CREATE TABLE IF NOT EXISTS submissions (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  phone TEXT DEFAULT '',
  social TEXT DEFAULT '',
  preferred_time TEXT DEFAULT '',
  country_tz TEXT DEFAULT '',
  message TEXT DEFAULT ''
);

-- Allow anonymous inserts (needed for the public form)
ALTER TABLE submissions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can insert submissions"
  ON submissions FOR INSERT
  TO anon
  WITH CHECK (true);

-- Allow reading submissions for authenticated users (admin panel)
CREATE POLICY "Authenticated users can read submissions"
  ON submissions FOR SELECT
  TO authenticated
  USING (true);

-- Allow deleting submissions for authenticated users
CREATE POLICY "Authenticated users can delete submissions"
  ON submissions FOR DELETE
  TO authenticated
  USING (true);
