(defmodule lfe-version
  (behaviour provider)
  (export all))

(defun namespace () 'lfe)                   ; All LFE plugsin need to have this
(defun provider-name () 'version)
(defun short-desc () "The LFE rebar3 version plugin.")
(defun deps ()
  '(#(default compile)
    #(default app_discovery)
    #(lfe compile)))

;;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;;; Public API
;;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

(defun init (state)
  (let* ((opts `(#(name ,(provider-name))        ; The 'user friendly' name
                 #(module ,(MODULE))             ; The module implementation
                 #(namespace ,(namespace))       ; Plugin namespace
                 #(opts ())                      ; List of plugin options
                 #(deps ,(deps))                 ; The list of dependencies
                 #(example "rebar3 lfe version") ; How to use the plugin
                 #(short_desc ,(short-desc))     ; A one-line description
                 #(desc ,(info (short-desc)))    ; A longer description
                 #(bare true)))                  ; The task can be run by user
         (provider (providers:create opts))
         (updated-state (rebar_state:add_provider state provider)))
    `#(ok ,updated-state)))

(defun do (state)
  (rebar_api:add_deps_to_path state)
  (lfe_io:format "~p" `(,(lutil:get-versions)))
  `#(ok ,state))

(defun format_error (reason)
  (io_lib:format "~p" `(,reason)))

;;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;;; Internal functions
;;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

(defun info (desc)
  (io_lib:format
    (++ "~n~s~n~n"
        "Display the version info for LFE as well as major components "
        "of Erlang/OTP.~n"
        "~n")
    `(,desc)))
