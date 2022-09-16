local go = {}

local status, ls = pcall(require, "luasnip")
if not status then
  return
end

local s = ls.s
local t = ls.t
local i = ls.i

table.insert(
  go,
  s({ trig = "errnil" }, {
    t({ "if err != nil {", "  " }),
    i(0),
    t({ "", "}", "" }),
  })
)

table.insert(
  go,
  s({ trig = "iferrnil" }, {
    t({ "if " }),
    i(1),
    t({ "; err != nil {", "  " }),
    i(0),
    t({ "", "}" }),
  })
)

table.insert(
  go,
  s({ trig = "handlefunc" }, {
    t({ 'mux.HandleFunc("/' }),
    i(1),
    t({ '", func(w http.ResponseWriter, r *http.Request) {', "  " }),
    i(0),
    t({ "", "}" }),
  })
)

table.insert(
  go,
  s({ trig = "server" }, {
    t({ "type Server struct {", "  " }),
    t({ "srv *http.Server", "  " }),
    t({ "l net.Listener", "" }),
    t({ "}", "", "" }),

    t({ "func NewServer(l net.Listener, mux http.Handler) *Server {", "  " }),
    t({ "return &Server{", "    " }),
    t({ "srv: &http.Server{Handler:mux},", "    " }),
    t({ "l: l,", "  " }),
    t({ "}", "" }),
    t({ "}", "", "" }),

    t({ "func (s *Server) Run(ctx context.Context) error {", "" }),
    t({ "	ctx, stop := signal.NotifyContext(ctx, os.Interrupt, syscall.SIGTERM)", "" }),
    t({ "	defer stop()", "" }),
    t({ "", "" }),
    t({ "	eg, ctx := errgroup.WithContext(ctx)", "" }),
    t({ "", "" }),
    t({ "	eg.Go(func() error {", "" }),
    t({ "		if err := s.srv.Serve(s.l); err != nil && err != http.ErrServerClosed {", "" }),
    t({ '			log.Printf("failed to close: %+v", err)', "" }),
    t({ "			return err", "" }),
    t({ "		}", "" }),
    t({ "", "" }),
    t({ "		return nil", "" }),
    t({ "	})", "" }),
    t({ "", "" }),
    t({ "	<-ctx.Done()", "" }),
    t({ "", "" }),
    t({ "	if err := s.srv.Shutdown(context.Background()); err != nil {", "" }),
    t({ '		log.Printf("failed to shutdown: %v", err)', "" }),
    t({ "	}", "" }),
    t({ "", "" }),
    t({ "	return eg.Wait()", "" }),
    t({ "}", "" }),
  })
)

table.insert(
  go,
  s({ trig = "serverrun" }, {
    t({ "func run(ctx context.Context) error {", "" }),
    t({ "	cfg, err := config.New()", "" }),
    t({ "	if err != nil {", "" }),
    t({ "		return err", "" }),
    t({ "	}", "" }),
    t({ "", "" }),
    t({ '	l, err := net.Listen("tcp", fmt.Sprintf(":%d", cfg.Port))', "" }),
    t({ "	if err != nil {", "" }),
    t({ '		log.Fatalf("failed to listen port %d: %v", cfg.Port, err)', "" }),
    t({ "	}", "" }),
    t({ "", "" }),
    t({ '	url := fmt.Sprintf("http://%s", l.Addr().String())', "" }),
    t({ '	log.Printf("start with: %v", url)', "" }),
    t({ "", "" }),
    t({ "	mux, cleanup, err := mux.NewMux(ctx, cfg)", "" }),
    t({ "", "" }),
    t({ "	if err != nil {", "" }),
    t({ "		return err", "" }),
    t({ "	}", "" }),
    t({ "", "" }),
    t({ "	defer cleanup()", "" }),
    t({ "", "" }),
    t({ "	s := server.NewServer(l, mux)", "" }),
    t({ "", "" }),
    t({ "	return s.Run(ctx)", "" }),
    t({ "}", "" }),
  })
)

return go
